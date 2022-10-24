<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>STARTUPQ | 회사관리</title>
<jsp:include page="/WEB-INF/jsp/include/link.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/loading3.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="/WEB-INF/jsp/include/business_aside.jsp" />
			</div>
			<div class="col-md-10 dashboard_main">
				<div class="dashboard_content mb-4">
					<div class="dashboard_header">
						<h2>회계분개</h2>
					</div>


					<div id="applyResult2">
						<div class="resultTop2">
							<img src="/resources/img/checked.png" alt="">
							<h1>
								<span style="color: #008485;">회계분개</span>가 완료되었습니다
							</h1>
						</div>
						<div class="resultBottom2">
							<p>* 아래 분개결과를 확인해주세요</p>
							<p>* 분개란 부기(簿記)에서 거래 내용을 차변과 대변으로 나누어 기입하는 것입니다.</p>
						</div>
					</div>

					<div class="d-flex justify-content-end"
						style="margin-bottom: 20px;">
						<button type="button" class="btn_1"
							onclick="javascript: confirmInsert()">
							<span class="material-icons-sharp">check_circle</span>확인완료
						</button>
					</div>

					<!-- 매출 입력 -->
					<div style="margin-bottom:50px;" class="d-none">
						<div class="d-flex" id="revenue">
							<h4 style="font-weight:700px; font-size:25px;">매출</h4>
							<span class="explain_1" style="font-size:14px !important; margin-left: 10px;"><span style="color: red;">* </span>
							상품 판매 시 매출과 매출원가로 두 단계로 나누어 회계분개가 이루어집니다.</span>
						</div>
						<div class="d-flex flex-column">
						<table class="business_table mb-4">
							<tr class="table_head" style="height: 40px;">
								<th>#</th>
								<th>거래일자</th>
								<th>차변계정</th>
								<th>차변금액(원)</th>
								<th>대변계정</th>
								<th>대변금액(원)</th>
								<th>적요</th>
							</tr>
							<tbody id="revenue_tbody">
							</tbody>
						</table>
					</div>
					</div>
					<div class="d-flex flex-column">
						<table class="business_table mb-4">
							<tr class="table_head" style="height: 40px;">
								<th>#</th>
								<th>거래일자</th>
								<th>차변계정</th>
								<th>차변금액(원)</th>
								<th>대변계정</th>
								<th>대변금액(원)</th>
								<th>적요</th>
							</tr>
							<tbody id="confirmLedger_tbody">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/script.jsp" />
	<script>
		const side1 = document.querySelector('#side1');
		const side2 = document.querySelector('#side2');
		const side3 = document.querySelector('#side3');

		let sideArr = [ side1, side2, side3 ];

		for (let i = 0; i < sideArr.length; i++) {
			if (sideArr[i].classList.contains('active')) {
				sideArr[i].classList.remove('active')
			}
		}

		sideArr[2].classList.add('active');

		$(window).on('load', function() {
			setTimeout(removeLoader, 500); //wait for page load PLUS two seconds.
		});

		function removeLoader() {
			$("#loadingDiv").fadeOut(100, function() {
				// fadeOut complete. Remove the loading div
				$("#loadingDiv").remove(); //makes page more lightweight 
			});
		}

		$(document)
				.ready(
						function() {
							$
									.ajax({
										url : '${pageContext.request.contextPath}/confirmLedger/getLedgerList',
										type : 'get',
										success : function(data) {
											console.log(data)

											const confirmLedger_tbody = document
													.querySelector('#confirmLedger_tbody');

											for (let i = 0; i < data.length; i++) {

												let ctr = document
														.createElement("tr");

												let ctd0 = document
														.createElement("td");
												ctd0.innerText = i + 1;
												ctr.appendChild(ctd0);

												let ctd = document
														.createElement("td");
												ctd.innerText = data[i].ledgerDate;
												ctr.appendChild(ctd);

												let ctd1 = document
														.createElement("td");
												ctd1.innerText = data[i].debit;
												ctr.appendChild(ctd1);

												let ctd2 = document
														.createElement("td");
												ctd2.innerText = data[i].totalAmount
														.toLocaleString('en-US');
												ctr.appendChild(ctd2);

												let ctd3 = document
														.createElement("td");
												ctd3.innerText = data[i].credit;
												ctr.appendChild(ctd3);

												let ctd4 = document
														.createElement("td");
												ctd4.innerText = data[i].totalAmount
														.toLocaleString('en-US');
												ctr.appendChild(ctd4);

												let ctd5 = document
														.createElement("td");
												ctd5.innerText = data[i].detail;
												ctr.appendChild(ctd5);

												confirmLedger_tbody
														.appendChild(ctr);
											}
											/* 끝 */

										}

									})
						})

		const closeBtn = document.querySelector('.close_btn');
		const updates = document.querySelector('.updates');

		closeBtn.addEventListener("click", function() {
			updates.classList.add('d-none');
		});
	</script>

	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		function confirmInsert() {
			Swal.fire({
				title : '등록 완료',
				text : '회계정보가 성공적으로 등록되었습니다!',
				icon : 'success',
				confirmButtonText : '확인'
			}).then(function() {
				window.location = "${pageContext.request.contextPath}/ledger";
			});
		}
	</script>

</body>
</html>