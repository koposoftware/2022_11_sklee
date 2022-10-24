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
<title>STARTUPQ | 대출계좌</title>
<jsp:include page="/WEB-INF/jsp/include/link.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/loading3.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="/WEB-INF/jsp/include/account_aside.jsp" />
			</div>

			<!-- 대시보드 메인 -->
			<div class="col-md-10 dashboard_main">
				<div class="dashboard_content mb-5">
					<div class="dashboard_header" style="margin-bottom: 50px">
						<h2>계좌조회</h2>
					</div>

					<div class="loanResult_head">
						<h4>승인대출조회</h4>
						<span>* 고객님께서 보유하신 대출계좌 목록입니다.</span>
					</div>

					<div style="margin-bottom: 100px;">
						<table class="loanResultTable text-center">
							<thead>
								<tr>
									<th>대출종류</th>
									<th>대출계좌</th>
									<th>대출금액</th>
									<th>이자</th>
									<th>시작일</th>
									<th>만기일</th>
									<th>상세보기</th>
								</tr>
							</thead>
							<tbody id="confirmLoanList">
							</tbody>
						</table>
					</div>

					<div class="loanResult_head">
						<h4>대출신청내역</h4>
						<span>* 대출진행상황을 확인하세요.</span>
					</div>


					<div>
						<table class="loanResultTable text-center">
							<thead>
								<tr>
									<th>대출종류</th>
									<th>신청일자</th>
									<th>대출신청금액</th>
									<th>금리유형</th>
									<th>상환방법</th>
									<th>진행상황</th>
								</tr>
							</thead>
							<tbody id="loanApplicationList">
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

		let sideArr = [ side1 ];

		for (let i = 0; i < sideArr.length; i++) {
			if (sideArr[i].classList.contains('active')) {
				sideArr[i].classList.remove('active')
			}
		}

		sideArr[0].classList.add('active');
		
		$(window).on('load', function() {
			setTimeout(removeLoader, 500); //wait for page load PLUS two seconds.
		});

		function removeLoader() {
			$("#loadingDiv").fadeOut(100, function() {
				// fadeOut complete. Remove the loading div
				$("#loadingDiv").remove(); //makes page more lightweight 
			});
		}

		const closeBtn = document.querySelector('.close_btn');
		const updates = document.querySelector('.updates');

		closeBtn.addEventListener("click", function() {
			updates.classList.add('d-none');
		});

		$(document).ready(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/viewLoanApplication',
				type : 'get',
				success : function(data) {
					console.log(data)
					
					$('#loanApplicationList').empty();
					
					const loanApplicationList = document.getElementById('loanApplicationList');
					for(let i = 0 ; i < data.length; i++){
						let ctr = document.createElement("tr");
						
						
						let ctd1 = document.createElement("td");
						ctd1.innerText = data[i].loanCode;
						ctr.appendChild(ctd1);
						

						let ctd = document.createElement("td");
						ctd.innerText = data[i].applyDate;
						ctr.appendChild(ctd);
						
						let ctd2 = document.createElement("td");
						ctd2.innerText = data[i].loanAmount.toLocaleString('en-US') + '원';
						ctr.appendChild(ctd2);
						
						let ctd3 = document.createElement("td");
						ctd3.innerText = data[i].interestRate;
						ctr.appendChild(ctd3);
						
						let ctd4 = document.createElement("td");
						ctd4.innerText = data[i].loanPayType;
						ctr.appendChild(ctd4);
						
						
						let ctd5 = document.createElement("td");
						ctd5.setAttribute("class", "status")
						let crd = document.createElement("div");
						crd.innerText = data[i].loanStatus;
						crd.setAttribute("class", "statusPill")
						if(data[i].loanStatus == "신청완료"){
							crd.setAttribute("style", "background-color:#F6A21E;");
						} else if(data[i].loanStatus == "승인"){
							crd.setAttribute("style", "background-color:#7A871E;");
						} else if(data[i].loanStatus == "거절"){
							crd.setAttribute("style", "background-color:#F85C70;");
						}
						ctd5.appendChild(crd);
						ctr.appendChild(ctd5);
						
						
						
						loanApplicationList.appendChild(ctr);
					}
					
				}

			});
			
			$.ajax({
				url : '${pageContext.request.contextPath}/viewConfirmLoan',
				type : 'get',
				success : function(data) {
					console.log(data)
					
					$('#confirmLoanList').empty();
					
					const confirmLoanList = document.getElementById('confirmLoanList');
					for(let i = 0; i < data.length; i++){
						
						let ctr = document.createElement("tr");
						
						
						let ctd1 = document.createElement("td");
						ctd1.innerText = data[i].loanCode;
						ctr.appendChild(ctd1);
						
						let ctd2 = document.createElement("td");
						ctd2.innerText = data[i].loanAccount;
						ctr.appendChild(ctd2);
						
						let ctd3 = document.createElement("td");
						ctd3.innerText = data[i].loanAmount.toLocaleString('en-US') + '원';
						ctr.appendChild(ctd3);
						
						let ctd4 = document.createElement("td");
						ctd4.innerText = data[i].interestRate;
						ctr.appendChild(ctd4);
						
						let ctd7 = document.createElement("td");
						ctd7.innerText = data[i].loanStartDate;
						ctr.appendChild(ctd7);
						
						let ctd5 = document.createElement("td");
						ctd5.innerText = data[i].loanEndDate;
						ctr.appendChild(ctd5);
						
						let ctd6 = document.createElement("td");
						ctd6.classList.add('d-flex');
						ctd6.classList.add('justify-content-center');
						ctd6.classList.add('align-items-center');
						ctd6.setAttribute("style", "height: 45px");
						let cra = document.createElement("a");
						cra.setAttribute("href", "#");
						cra.classList.add('btn_5');
						cra.innerText = "상세보기";
						ctd6.appendChild(cra);
						ctr.appendChild(ctd6);
						
						confirmLoanList.appendChild(ctr);
					}
					
				}

			})
		})
	</script>
</body>
</html>