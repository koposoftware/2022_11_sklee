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
						<h2>총계정원장 조회</h2>
					</div>


					<div class="dashboard_notice mb-3">
						<p style="color: var(- -color-black-matt); margin-bottom: 8px;">
							<span style="color: var(- -color-hana-red);">*</span> 최근에 입력한
							데이터부터 조회되었습니다.
						</p>
					</div>


					<div class="d-flex justify-content-end"
						style="margin-bottom: 10px;">
						<button class="btn_1" data-bs-toggle="modal" type="button"
							data-bs-target="#makeBsModal">
							<span class="material-icons-sharp" style="margin-right: 5px;">article</span>재무제표
							만들기
						</button>
					</div>

					<div class="d-flex justify-content-between mb-0">
						<button class="btn_4" style="margin-right: 10px;">
							<span class="material-icons-sharp">edit</span>수정
						</button>
						<div style="width: 250px;">
							<form class="d-flex justify-contend-end" role="search">
								<input class="form-control me-2" type="search"
									placeholder="항목검색" aria-label="Search">
								<button class="btn_3" type="button">
									<img src="resources/img/search1.png" alt=""
										style="width: 20px;">
								</button>
							</form>
						</div>
					</div>

					<div class="d-flex justify-content-end"
						style="margin-bottom: 10px;"></div>

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

						<div class="d-flex justify-content-center py-5">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<li class="page-item"><button
											class="page-link prev text-muted">
											<i class="fa-solid fa-angle-left"></i> prev
										</button></li>
									<li class="page-item"><button
											class="page-link getPage c1 text-dark">1</button></li>
									<li class="page-item"><button
											class="page-link getPage c2 text-dark">2</button></li>
									<li class="page-item"><button
											class="page-link getPage c3 text-dark">3</button></li>
									<li class="page-item"><button
											class="page-link getPage c4 text-dark">4</button></li>
									<li class="page-item"><button
											class="page-link getPage c5 text-dark">5</button></li>
									<li class="page-item"><button
											class="page-link next text-muted">
											next <i class="fa-solid fa-angle-right"></i>
										</button></li>
								</ul>
							</nav>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 회계기간 설정 Modal -->
	<div class="modal fade" id="makeBsModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="d-flex justify-content-end">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" style="margin-right: 20px; margin-top: 15px;"></button>
				</div>
				<div class="modal-body d-flex flex-column align-items-center">
					<img src="resources/img/calendar.png" style="width: 80px;">
					<h4 class="accounting_period_title">회계기간 설정</h4>

					<div class="accounting_period" style="width: 500px;">
						<div class="modal_notice">
							<p>*회계기간의 시작일자와 종료일자를 선택해주세요</p>
						</div>
						<form:form
							action="${pageContext.request.contextPath}/ledger/trialBalance"
							commandName="accountingPeriodVO">
							<table class="rc_table text-center" style="width: 500px;">
								<tr>
									<th width="20%">회계연도</th>
									<th width="40%">시작일자</th>
									<th width="40%">종료일자</th>
								</tr>
								<tbody id="addProduct_1">
									<tr>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form"
											placeholder="1기" name="accountingPeriod"></td>
										<td><input type="date" class="modal_date"
											max="2022-12-31" value="2022-01-01" name="startDate">
										</td>
										<td><input type="date" class="modal_date"
											id="currentDate" max="2022-12-31" min="1980-01-01"
											name="endDate"></td>
										<td class="d-none"><input type="hidden" name="compName"
											value="${loginVO.compName}"></td>
									</tr>
								</tbody>
							</table>

							<div class="d-flex justify-content-end mt-4">
								<button class="btn_5">
									<span class="material-icons-sharp" style="margin-right: 0px">navigate_next</span>다음
								</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/script.jsp" />
	<script>
	
	document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);

		const side1 = document.querySelector('#side1');
		const side2 = document.querySelector('#side2');
		const side3 = document.querySelector('#side3');

		let sideArr = [ side1, side2, side3];

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
										url : '${pageContext.request.contextPath}/ledger/getAllLedgerList',
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
												ctd0.innerText = data[i].ledgerNo;
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
						
						$('.getPage').click(function(){
	  let numClass = 1+parseInt($(this).text()-1)*10;
    $(document).ready(function () {
      $.ajax({
        type: "get",
        url: "/ledger/getNextLedgerList",
        data: {
          num: numClass,
        },
        success:function(data){
        	console.log(data);
        	$('#confirmLedger_tbody').empty();
        	
        	const confirmLedger_tbody = document
			.querySelector('#confirmLedger_tbody');

	for (let i = 0; i < data.length; i++) {

		let ctr = document
				.createElement("tr");

		let ctd0 = document
				.createElement("td");
		ctd0.innerText = data[i].ledgerNo;
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
        	,error: function () {
          alert("실패");
        },
      });
    });
  

  })
						
						const c1 = document.querySelector(".c1");
	const c2 = document.querySelector(".c2");
	const c3 = document.querySelector(".c3");
	const c4 = document.querySelector(".c4");
	const c5 = document.querySelector(".c5");
	const next = document.querySelector(".next");
	const prev = document.querySelector(".prev");

	let last = parseInt("${count}");
	const rows_per_page = 10; //1 페이지 당 보여지는 글의 수
	const btn_num = 5; //Pagination 버튼 수
	const pages = Math.floor(last / (rows_per_page * btn_num)); //pagination 수
	lastPage = parseInt(
	  Math.ceil((last % (rows_per_page * btn_num)) / rows_per_page)
	);
	let arr2 = [c1, c2, c3, c4, c5];

	if (last > rows_per_page * btn_num) {
	  //페이지 뒤로 넘기는 함수
	  function nextPage() {
	    if (parseInt(c5.innerText) < pages * 5) {
	      for (let i = 0; i < 5; i++) {
	        arr2[i].innerText = parseInt(arr2[i].innerText) + 5;
	      }
	    } else if (parseInt(c5.innerText) == pages * 5) {
	      for (let i = 0; i < 5; i++) {
	        arr2[i].innerText = parseInt(arr2[i].innerText) + 5;
	      }
	      for (let i = lastPage; i < 5; i++) {
	        arr2[i].classList.add("d-none");
	      }
	      //console.log(c5.innerText);
	    }
	  }

	  //페이지 앞으로 넘기는 함수
	  function prevPage() {
	    if (parseInt(c1.innerText) > 1 && c5.innerText <= btn_num * pages) {
	      for (let i = 0; i < 5; i++) {
	        arr2[i].innerText = parseInt(arr2[i].innerText) - 5;
	      }
	    } else if (parseInt(c5.innerText) == btn_num * (pages + 1)) {
	      for (let i = lastPage; i < 5; i++) {
	        arr2[i].classList.remove("d-none");
	        arr2[i].innerText = parseInt(arr2[i].innerText);
	      }
	      for (let i = 0; i < 5; i++) {
	        arr2[i].innerText = parseInt(arr2[i].innerText) - 5;
	      }
	    }
	  }
	} else {
	  for (let i = lastPage; i < 5; i++) {
	    arr2[i].classList.add("d-none");
	  }
	}

	next.addEventListener("click", nextPage);
	prev.addEventListener("click", prevPage);

						
				
	const closeBtn = document.querySelector('.close_btn');
    const updates = document.querySelector('.updates');

    closeBtn.addEventListener("click", function () {
        updates.classList.add('d-none');
    });
	</script>
</body>
</html>