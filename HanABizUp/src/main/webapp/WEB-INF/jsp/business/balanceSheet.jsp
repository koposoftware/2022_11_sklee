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
	<jsp:include page="/WEB-INF/jsp/include/loading.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="/WEB-INF/jsp/include/business_aside.jsp" />
			</div>
			<div class="col-md-10 dashboard_main">
				<div class="dashboard_content">
					<div class="dashboard_header">
						<h2>재무제표 조회</h2>
					</div>

					<div class="d-flex justify-content-end mt-3"
						style="margin-bottom: 0px;">
						<a href="${pageContext.request.contextPath}/financeMain" class="btn_5"> <span class="material-icons-sharp"
							style="margin-right: 5px">leaderboard</span>통계보기
						</a>
					</div>

					<!-- 재무상태표 -->
					<div class="mb-5 mt-2">
						<div class="ts_head">
						<div class="d-flex">
						<h4>재무상태표</h4>
							<div class="help_icon2"
                                            data-bs-toggle="tooltip" data-bs-title="회계의 복식부기 원칙에 따라 차변과 대변 항목이 일치해야 올바른 재무제표 입니다."
                                            data-bs-placement="right" data-bs-custom-class="custom-tooltip">?
						</div>
                                        </div>
							<p>2022 년 1월 1일부터 2022년 12월 31일까지</p>
						</div>

						<div
							class="d-flex justify-content-center mt-3 flex-column align-items-center">
							<div class="d-flex justify-content-end" style="width: 100%;">
								<p>(단위: 원)</p>
							</div>
							<table class="table table-bordered trial_balance_table">
								<thead>
								<tr class="text-center" style="background-color: #aed1d174;">
										<th scope="col" colspan="2" width="50%">자산</th>
										<th scope="col" colspan="2" width="50%">부채</th>
									</tr>
									<tr class="text-center" style="background-color: #aed1d174;">
										<th scope="col" width="25%">계정과목</th>
										<th scope="col" width="25%">금액</th>
										<th scope="col" width="25%">계정과목</th>
										<th scope="col" width="25%">금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="ts_3">자산</td>
										<td class="ts_4"></td>
										<td class="ts_3">부채</td>
										<td class="ts_4"></td>
									</tr>
									<tr>
										<td class="ts_3">&#8544;. 유동자산</td>
										<td class="ts_4"></td>
										<td class="ts_3">&#8544;. 유동부채</td>
										<td class="ts_4"></td>
										
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;1. 현금및현금성자산</td>
										<td class="ts_4"id="cash"></td>
										<td>&nbsp;&nbsp;&nbsp;1. 매입채무및기타채무</td>
										<td class="ts_4"id="tradePayables"></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;2. 매출채권및기타채권</td>
										<td class="ts_4"id="tradeReceivables"></td>
										<td>&nbsp;&nbsp;&nbsp;2. 단기차입금</td>
										<td class="ts_4"id="shortTermBorrowings"></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;3. 재고자산</td>
										<td class="ts_4"id="inventories"></td>
										<td>&nbsp;&nbsp;&nbsp;3. 미지급비용</td>
										<td class="ts_4"id="accuredExpenses"></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;4. 단기금융상품</td>
										<td class="ts_4"id="shortTermFinancial"></td>
										<td>&nbsp;&nbsp;&nbsp;4. 미지급법인세</td>
										<td class="ts_4"id="incomeTaxesPayables"></td>
									</tr>
									<tr>
										<td class="ts_3">>&nbsp;&nbsp;&nbsp;유동자산 합계</td>
										<td class="ts_4"id="currentAssets"></td>
										<td class="ts_3">>&nbsp;&nbsp;&nbsp;유동부채 합계</td>
										<td class="ts_4"id="currentLiabilities"></td>
										
									</tr>
									<tr>
										<td class="ts_3">&#8545;.비유동자산</td>
										<td class="ts_4"></td>
										<td class="ts_3">&#8545;.비유동부채</td>
										<td class="ts_4"></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;1. 유형자산</td>
										<td class="ts_4"id="tangibleAssets"></td>
										<td>&nbsp;&nbsp;&nbsp;1. 장기차입금</td>
										<td class="ts_4"id="longTermBorrowings"></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;2. 투자부동산</td>
										<td class="ts_4"id="investmentProperties"></td>
										<td class="ts_3">>&nbsp;&nbsp;&nbsp;비유동부채 합계</td>
										<td class="ts_4"id="longTermLiabilities"></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;3. 무형자산</td>
										<td class="ts_4"id="intangibleAssets"></td>
										<td class="ts_3">>&nbsp;&nbsp;&nbsp;부채 총계</td>
										<td class="ts_4"id="liabilities"></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;4. 장기금융자산</td>
										<td class="ts_4"id="longTermFinancial"></td>
										<td class="ts_3">자본</td>
										<td class="ts_4"></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;5. 기타비유동자산</td>
										<td class="ts_4"id="otherLongTermAssets"></td>
										<td>&#8544;. 자본금</td>
										<td class="ts_4" id="capitalStock"></td>
									</tr>
									<tr>
										<td class="ts_3">>&nbsp;&nbsp;&nbsp; 비유동자산 합계</td>
										<td class="ts_4"id="longTermAssets"></td>
										<td>&#8545;. 자본잉여금</td>
										<td class="ts_4" id="capitalSurplus"></td>
									</tr>
									<tr>
										<td></td>
										<td class="ts_4"></td>
										<td>&#8546;. 이익잉여금</td>
										<td class="ts_4" id="retainedEarning"></td>
									</tr>
									<tr>
										<td></td>
										<td class="ts_4"></td>
										<td class="ts_3">>&nbsp;&nbsp;&nbsp;자본총계</td>
										<td class="ts_4" id="equity"></td>
									</tr>
									<tr class="ts_bg">
										<td class="ts_3">자산 총계</td>
										<td class="ts_4" id="assets"></td>
										<td class="ts_3">자본과 부채 총계</td>
										<td class="ts_4" id="liabilitiesAndEquity"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<!-- 손익계산서 -->
					<div id="income_sheet" class="my-5">
						<div class="ts_head">
						<div class="d-flex">
						<h4>손익계산서</h4>
							<div class="help_icon2"
                                            data-bs-toggle="tooltip" data-bs-title="회계의 복식부기 원칙에 따라 차변과 대변 항목이 일치해야 올바른 재무제표 입니다."
                                            data-bs-placement="right" data-bs-custom-class="custom-tooltip">?
						</div>
						</div>
							
							<p>2022 년 1월 1일부터 2022년 12월 31일까지</p>
							
						</div>

						<div
							class="d-flex justify-content-center mt-3 flex-column align-items-center">
							<div class="d-flex justify-content-end" style="width: 100%;">
								<p>(단위: 천원)</p>
							</div>
							<table class="table table-bordered trial_balance_table">
								<thead>
									<tr class="text-center" style="background-color: #F5F4F4;">
										<th scope="col" width="35%">과목</th>
										<th scope="col">2021년 12월 31일까지</th>
									</tr>
								</thead>
								<tbody id="netIncomeTable">
									<tr>
										<td>매출액</td>
										<td id="sales"></td>
									</tr>
									<tr>
										<td>매출원가</td>
										<td id="costOfSales"></td>
									</tr>
									<tr>
										<td class="ts_3">>매출총이익</td>
										<td id="grossProfit"></td>
									</tr>
									<tr>
										<td>판매비와관리비</td>
										<td id="sellingExpenses"></td>
									</tr>
									<tr>
										<td class="ts_3">>영업이익</td>
										<td id="operatingIncome"></td>
									</tr>
									<tr>
										<td>법인세비용</td>
										<td id="incomeTax"></td>
									</tr>
									<tr class="ts_bg">
										<td class="ts_3">>당기순이익</td>
										<td id="netIncome"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/script.jsp" />
	 <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

		sideArr[2].classList.add('active');
		
		$(window).on('load', function() {
			setTimeout(removeLoader, 2300); //wait for page load PLUS two seconds.
		});

		function removeLoader() {
			$("#loadingDiv").fadeOut(400, function() {
				// fadeOut complete. Remove the loading div
				$("#loadingDiv").remove(); //makes page more lightweight 
			});
			
			Swal.fire({
                title: '재무제표 완료',
                text: '재무상태표와 손익계산가 완성되었습니다!',
                icon: 'success',
                confirmButtonText: '확인',
               	confirmButtonColor: "#008485",
            })
			
		}


		const closeBtn = document.querySelector('.close_btn');
		const updates = document.querySelector('.updates');

		closeBtn.addEventListener("click", function() {
			updates.classList.add('d-none');
		});
		
		 const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
	        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
			

		$(document)
				.ready(
						function() {
							$
									.ajax({
										url : '${pageContext.request.contextPath}/ledger/incomeStatement',
										type : 'get',
										success : function(data) {
											console.log(data)
											const sales = document
													.querySelector('#sales');
											const costOfSales = document
													.querySelector('#costOfSales');
											const grossProfit = document
													.querySelector('#grossProfit');
											const sellingExpenses = document
													.querySelector('#sellingExpenses');
											const operatingIncome = document
													.querySelector('#operatingIncome');
											const incomeTax = document
													.querySelector('#incomeTax');
											const netIncome = document
													.querySelector('#netIncome');

											sales.innerText = data.sales
													.toLocaleString('en-US');
											costOfSales.innerText = data.costOfSales
													.toLocaleString('en-US');
											grossProfit.innerText = data.grossProfit
													.toLocaleString('en-US');
											sellingExpenses.innerText = data.sellingExpenses
													.toLocaleString('en-US');
											operatingIncome.innerText = data.operatingIncome
													.toLocaleString('en-US');
											incomeTax.innerText = data.incomeTax
													.toLocaleString('en-US');
											netIncome.innerText = data.netIncome
													.toLocaleString('en-US');

										}

									})

							$
									.ajax({
										url : '${pageContext.request.contextPath}/ledger/balanceSheetView',
										type : 'get',
										success : function(data) {
											console.log(data)
											
											const accuredExpenses = document.querySelector('#accuredExpenses');
											const capitalStock = document.querySelector('#capitalStock');
											const capitalSurplus = document.querySelector('#capitalSurplus');
											const cash = document.querySelector('#cash');
											const currentAssets = document.querySelector('#currentAssets');
											const currentLiabilities = document.querySelector('#currentLiabilities');
											const equity = document.querySelector('#equity');
											const incomeTaxesPayables = document.querySelector('#incomeTaxesPayables');
											const intangibleAssets = document.querySelector('#intangibleAssets');
											const inventories = document.querySelector('#inventories');
											const investmentProperties = document.querySelector('#investmentProperties');
											const liabilities = document.querySelector('#liabilities');
											const longTermAssets = document.querySelector('#longTermAssets');
											const longTermBorrowings = document.querySelector('#longTermBorrowings');
											const longTermFinancial = document.querySelector('#longTermFinancial');
											const otherLongTermAssets = document.querySelector('#otherLongTermAssets');
											const retainedEarning = document.querySelector('#retainedEarning');
											const shortTermBorrowings = document.querySelector('#shortTermBorrowings');
											const shortTermFinancial = document.querySelector('#shortTermFinancial');
											const tangibleAssets = document.querySelector('#tangibleAssets');
											const tradePayables = document.querySelector('#tradePayables');
											const tradeReceivables = document.querySelector('#tradeReceivables');
											const assets = document.querySelector('#assets');
											const liabilitiesAndEquity = document.querySelector('#liabilitiesAndEquity');
											
											accuredExpenses.innerText = data.accuredExpenses.toLocaleString('en-US');
											capitalStock.innerText = data.capitalStock.toLocaleString('en-US');
											capitalSurplus.innerText = data.capitalSurplus.toLocaleString('en-US');
											cash.innerText = data.cash.toLocaleString('en-US');
											currentAssets.innerText = data.currentAssets.toLocaleString('en-US');
											currentLiabilities.innerText = data.currentLiabilities.toLocaleString('en-US');
											incomeTaxesPayables.innerText = data.incomeTaxesPayables.toLocaleString('en-US');
											intangibleAssets.innerText = data.intangibleAssets.toLocaleString('en-US');
											inventories.innerText = data.inventories.toLocaleString('en-US');
											investmentProperties.innerText = data.investmentProperties.toLocaleString('en-US');
											liabilities.innerText = data.liabilities.toLocaleString('en-US');
											longTermAssets.innerText = data.longTermAssets.toLocaleString('en-US');
											longTermBorrowings.innerText = data.longTermBorrowings.toLocaleString('en-US');
											longTermFinancial.innerText = data.longTermFinancial.toLocaleString('en-US');
											longTermLiabilities.innerText = data.longTermLiabilities.toLocaleString('en-US');
											otherLongTermAssets.innerText = data.otherLongTermAssets.toLocaleString('en-US');
											retainedEarning.innerText = data.retainedEarning.toLocaleString('en-US');
											shortTermBorrowings.innerText = data.shortTermBorrowings.toLocaleString('en-US');
											shortTermFinancial.innerText = data.shortTermFinancial.toLocaleString('en-US');
											tangibleAssets.innerText = data.tangibleAssets.toLocaleString('en-US');
											tradePayables.innerText = data.tradePayables.toLocaleString('en-US');
											tradeReceivables.innerText = data.tradeReceivables.toLocaleString('en-US');
											equity.innerText = data.equity.toLocaleString('en-US');
											assets.innerText = (data.currentAssets + data.longTermAssets).toLocaleString('en-US');
											liabilitiesAndEquity.innerText = (data.liabilities + data.equity).toLocaleString('en-US');

										}

									})
									
									
						})
	</script>
</body>
</html>