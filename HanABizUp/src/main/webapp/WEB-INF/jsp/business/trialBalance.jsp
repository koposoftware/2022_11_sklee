<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<jsp:include page="/WEB-INF/jsp/include/loading2.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="/WEB-INF/jsp/include/business_aside.jsp" />
			</div>
			<div class="col-md-10 dashboard_main">
				<div class="dashboard_content">
					<div class="dashboard_header">
						<h2>합계잔액시산표 조회</h2>
						
					</div>

					<div class="d-flex justify-content-end mt-3"
						style="margin-bottom: 0px;">
						<button data-bs-toggle="modal" type="button"
							data-bs-target="#changeBsModal" class="btn_5">
							<span class="material-icons-sharp" style="margin-right: 10px">fact_check</span>수정분개
						</button>
					</div>

					<!-- 합계잔액시산표 -->
					<div class="mb-5 mt-2">
						<div class="ts_head">
						<div class="d-flex">
						<h4>합계잔액시산표</h4><div class="help_icon2"
                                            data-bs-toggle="tooltip" data-bs-title="합계잔액시산표는 재무제표 도출 전 단계로 향후 최종 재무제표 문제가 있을 때 그 문제를 추적하기 위해 사용됩니다."
                                            data-bs-placement="right" data-bs-custom-class="custom-tooltip">?
                                        </div>
						</div>
							
							<p>${fn:substring(accountingPeriodVO.startDate,0,4) }년 
							${fn:substring(accountingPeriodVO.startDate,6,7) }월
							${fn:substring(accountingPeriodVO.startDate,9,10) }일 부터  &nbsp;
							
							 ${fn:substring(accountingPeriodVO.endDate,0,4) }년 
							${fn:substring(accountingPeriodVO.endDate,5,7) }월
							${fn:substring(accountingPeriodVO.endDate,8,10) }일 까지</p>
						</div>

						<div
							class="d-flex justify-content-center mt-3 flex-column align-items-center">
							<div class="d-flex justify-content-end" style="width: 100%;">
								<p>(단위: 원)</p>
							</div>
							<table class="table table-bordered trial_balance_table">
								<thead>
									<tr>
										<th width="40%" colspan="2">차변</th>
										<th width="20%" rowspan="2" style="padding-bottom: 25px;">계정과목</th>
										<th width="40%" colspan="2">대변</th>
									</tr>
									<tr>
										<th>합계</th>
										<th>잔액</th>
										<th>잔액</th>
										<th>합계</th>
									</tr>
								</thead>
								<tbody id="trial_balance_tbody">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 수정분정 Modal -->
	<div class="modal fade" id="changeBsModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="d-flex justify-content-end">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" style="margin-right: 20px; margin-top: 15px;"></button>
				</div>
				<div class="modal-body d-flex flex-column align-items-center">
					<img src="/resources/img/report.png" style="width: 80px;">
					<h4 class="accounting_period_title">추가입력 사항</h4>

					<div class="accounting_period" style="width: 500px;">
						<div class="modal_notice">
							<p>* 아래 사항을 입력해주세요</p>
						</div>
						<form:form
							action="${pageContext.request.contextPath}/ledger/balanceSheet">
							<table class="rc_table text-center" style="width: 500px;">
								<tr>
									<th>법인세</th>
									<td><input type="text"
										class="form-control form-control-sm firm_value_form"
										 name="corporateTax"></td>
								</tr>
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
		const side1 = document.querySelector('#side1');
		const side2 = document.querySelector('#side2');
		const side3 = document.querySelector('#side3');

		let sideArr = [ side1, side2, side3];

		for (let i = 0; i < sideArr.length; i++) {
			if (sideArr[i].classList.contains('active')) {
				sideArr[i].classList.remove('active')
			}
		}

		sideArr[2].classList.add('active')

		$(document)
				.ready(
						function() {
							$
									.ajax({
										url : '${pageContext.request.contextPath}/ledger/selectTrialBalance',
										type : 'get',
										success : function(data) {
											console.log(data)

											const trial_balance_tbody = document
													.querySelector('#trial_balance_tbody');
											$('#trial_balance_tbody').empty();
											for (let i = 0; i < data.length; i++) {

												let ctr = document
														.createElement("tr");

												let ctd = document
														.createElement("td");
												ctd.innerText = data[i].debitSum
														.toLocaleString('en-US');
												ctr.appendChild(ctd);

												let ctd1 = document
														.createElement("td");
												if (parseInt(data[i].debitAmount) == 0) {
												} else {
													ctd1.innerText = data[i].debitAmount
															.toLocaleString('en-US');
												}
												ctr.appendChild(ctd1);

												let ctd2 = document
														.createElement("td");
												ctd2.innerText = data[i].accountingDetail;
												ctr.appendChild(ctd2);

												let ctd3 = document
														.createElement("td");
												if (parseInt(data[i].creditAmount) == 0) {
												} else {
													ctd3.innerText = data[i].creditAmount
															.toLocaleString('en-US');
												}
												ctr.appendChild(ctd3);

												let ctd4 = document
														.createElement("td");
												ctd4.innerText = data[i].creditSum
														.toLocaleString('en-US');
												ctr.appendChild(ctd4);

												trial_balance_tbody
														.appendChild(ctr);
											}

											/* 합계 계산 */
											let ctr = document
													.createElement("tr");
											ctr
													.setAttribute("style",
															"background-color: var(--color-hana-green-2)");

											let credit_sum = 0
											let credit_sum_1 = 0
											let debit_sum = 0
											let debit_sum_1 = 0

											let ctd = document
													.createElement("td");
											for (let i = 0; i < data.length; i++) {
												debit_sum = debit_sum
														+ data[i].debitSum
											}
											ctd.innerText = debit_sum
													.toLocaleString('en-US');
											ctr.appendChild(ctd);

											let ctd3 = document
													.createElement("td");
											for (let i = 0; i < data.length; i++) {
												debit_sum_1 = debit_sum_1
														+ data[i].creditAmount
											}
											ctd3.innerText = debit_sum_1
													.toLocaleString('en-US');
											ctr.appendChild(ctd3);

											let ctd1 = document
													.createElement("td");
											ctd1.innerText = '합계';
											ctd1.classList.add('ts_1');
											ctr.appendChild(ctd1);

											let ctd2 = document
													.createElement("td");
											for (let i = 0; i < data.length; i++) {
												credit_sum = credit_sum
														+ data[i].creditAmount
											}
											ctd2.innerText = credit_sum
													.toLocaleString('en-US');
											ctr.appendChild(ctd2);

											let ctd4 = document
													.createElement("td");
											for (let i = 0; i < data.length; i++) {
												credit_sum_1 = credit_sum_1
														+ data[i].creditSum
											}
											ctd4.innerText = credit_sum_1
													.toLocaleString('en-US');
											ctr.appendChild(ctd4);
											trial_balance_tbody
													.appendChild(ctr);
											/* 끝 */

										}

									})
						})
						
						const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
		

		$(window).on('load', function() {
			setTimeout(removeLoader, 1500); //wait for page load PLUS two seconds.
		});

		function removeLoader() {
			$("#loadingDiv").fadeOut(500, function() {
				// fadeOut complete. Remove the loading div
				$("#loadingDiv").remove(); //makes page more lightweight 
			});
		}
	</script>
</body>
</html>