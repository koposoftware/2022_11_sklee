<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>STARTUPQ | 재무분석</title>
<jsp:include page="/WEB-INF/jsp/include/link.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
		<jsp:include page="/WEB-INF/jsp/include/loading3.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="/WEB-INF/jsp/include/finance_aside.jsp" />
			</div>

			<!-- 대시보드 메인 -->
			<div class="col-md-10 dashboard_main">
				<div class="dashboard_content">
					<div class="dashboard_header">
						<h2>재무정보 분석</h2>
						<span>회계기간별</span>
					</div>

					<div class="dashboard_btn">
						<div class="date">
							<select class="date_select" id="accountingPeriod2">
							</select>
						</div>
						<div>
							<a href="#" class="btn_1" data-bs-toggle="modal"
								data-bs-target="#bsModal">재무제표 열람 <span
								class="material-icons-sharp">description</span></a>
						</div>
					</div>

					<div class="bs_top">
						<div class="top">
							<div class="d-flex justify-content-between">
								<div class="top_icon">
									<span class="material-icons-sharp">pie_chart</span>
								</div>
								<button class="btn_7" type="button" data-bs-toggle="modal" data-bs-target="#liquidityModal">						
						<i class="fa-solid fa-bell fa-shake" data-bs-toggle="tooltip" data-bs-title="자금흐름 확인!"
						<c:choose>
							<c:when test="${liquidity gt 0}"> style="--fa-animation-duration: 3s; color:#e90061; font-size:23px;"</c:when>
							<c:otherwise>style="--fa-animation-duration: 3s; color: #e90061; font-size:23px;"</c:otherwise>
						</c:choose>
                                            data-bs-placement="top" data-bs-custom-class="custom-tooltip1" 
						
						></i>
						</button>
							</div>
							<div class="d-flex justify-content-between">
								<div class="top_text">
									<div class="top_text_1">
                                        <h4>유동비율</h4>
                                        <div class="help_icon" style="background-color: #98D7C2;"
                                            data-bs-toggle="tooltip" data-bs-title="유동자산 / 유동부채"
                                            data-bs-placement="right" data-bs-custom-class="custom-tooltip">?
                                        </div>
                                    </div>
									<h5>단기 지급능력 지표</h5>
									<div class="d-flex">
									<span id="current_ratio_number_1"></span><span>%</span>
									</div>
									<p>안정성 비율</p>
								</div>
								<div class="progress">
									<svg>
                                        <circle cx="38" cy="38" r="36"
											id="current_ratio"></circle>
                                    </svg>
									<div class="number d-flex justify-content-center">
										<p id="current_ratio_number"></p><p>%</p>
									</div>
								</div>
							</div>
						</div>
						<div class="top">
							<div class="d-flex align-items-center ">
								<div class="top_icon"
									style="background-color: var(--color-tri-red);">
									<span class="material-icons-sharp">analytics</span>
								</div>
							</div>
							<div class="d-flex justify-content-between">
								<div class="top_text">
									<div class="top_text_1">
                                        <h4>부채비율</h4>
                                        <div class="help_icon" style="background-color: #FFA384;"
                                            data-bs-toggle="tooltip" data-bs-title="부채총계 / 자기자본 으로 비율이 낮을수록 기업의 재무적 안정성이 높니다"
                                            data-bs-placement="right" data-bs-custom-class="custom-tooltip">?
                                        </div>
                                    </div>
									<h5>기업 안정성 지표</h5>
									<div class="d-flex">									
									<span id="debt_ratio_number_1"></span><span>%</span>
									</div>
									<p>안정성 비율</p>
								</div>
								<div class="progress">
									<svg>
                                        <circle cx="38" cy="38" r="36"
											id="debt_ratio"></circle>
                                    </svg>
									<div class="number d-flex justify-content-center">
										<p id="debt_ratio_number"></p><p>%</p>
									</div>
								</div>
							</div>
						</div>
						<div class="top">
							<div class="d-flex align-items-center ">
								<div class="top_icon"
									style="background-color: var(--color-tri-blue);">
									<span class="material-icons-sharp">bar_chart</span>
								</div>
							</div>
							<div class="d-flex justify-content-between mb-1">
								<div class="top_text">
								<div class="top_text_1">
									 <h4>총자산수익률</h4>
                                        <div class="help_icon" style="background-color: #74BDCB;"
                                            data-bs-toggle="tooltip" data-bs-title="당기순이익 / 총자산"
                                            data-bs-placement="right" data-bs-custom-class="custom-tooltip">?
                                        </div>
                                     </div>
									<h5>자산 운영 효율성 지표</h5>
									<div class="d-flex">	
									<span id="total_asset_return_number_1"></span><span>%</span>
									</div>
									<p>수익성 비율</p>
								</div>
								<div class="progress">
									<svg>
                                        <circle cx="38" cy="38" r="36"
											id="total_asset_return"></circle>
                                    </svg>
									<div class="number d-flex justify-content-center">
										<p id="total_asset_return_number"></p><p>%</p>
									</div>
								</div>
							</div>
						</div>

					</div>


					<div class="middle">
						<div id="myChart"></div>
						<!-- <div id="myChart2"></div> -->
						<div class="middle_boxes">
							<div class="middle_box">
								<div class="d-flex align-items-center">
									<div class="middle_icon">
										<span class="material-icons-sharp">point_of_sale</span>
									</div>
								</div>
								<div class="middle_text">
									<h4>총매출액</h4>
									<span id="financeSales"></span>
									<p id="salesDiff"></p>
								</div>
							</div>
							
							<div class="middle_box">
								<div class="d-flex align-items-center">
									<div class="middle_icon">
										<span class="material-icons-sharp">paid</span>
									</div>
								</div>
								<div class="middle_text">
									<h4>매출원가</h4>
									<span id="financeCostOfSales"></span>
									<p id="costOfSalesDiff"></p>
								</div>
							</div>
							
							<div class="middle_box">
								<div class="d-flex align-items-center">
									<div class="middle_icon">
										<span class="material-icons-sharp">stacked_line_chart</span>
									</div>
								</div>
								<div class="middle_text">
									<h4>당기순이익</h4>
									<span id="financeNetIncome"></span>
									<p id="netIncomeDiff"></p>
								</div>
							</div>
						</div>
					</div>
					
					 <!-- 3개년 재무제표 -->
					<div class="d-flex justify-content-center flex-column align-items-center mb-5 mt-5" style="width: 100%;">
						<div class="bss_head">
							<h4>요약 재무제표</h4>
						</div>

						<div class="d-flex justify-content-center flex-column align-items-center" style="width: 100%;">
							<div class="d-flex justify-content-end" style="width: 100%;">
								<p>(단위: 원)</p>
							</div>
							<table class="balanceSheetSummary">
								<thead>
									<tr class="text-center" style="background-color: #F5F4F4;">
										<th scope="col" width="30%"></th>
										<th scope="col" id="term1"></th>
										<th scope="col" id="term2"></th>
										<th scope="col" id="term3"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="t_front">자산</td>
										<td></td>
										<td></td>
									</tr>
									<tr id="bs_currentAssets">
										<td class="t_front1">&#8544; . 유동자산</td>
									</tr>
                                    <tr id="bs_cash">
										<td class="t_front2">현금및현금성자산</td>
									</tr>
                                    <tr id="bs_shortTermFinancial">
										<td class="t_front2">단기금융상품</td>
									</tr>
                                    <tr id="bs_tradeReceivables">
										<td class="t_front2">매출채권및기타채권</td>
									</tr>
                                    <tr id="bs_inventories">
										<td class="t_front2">재고자산</td>
									</tr>
                                    <tr id="bs_longTermAssets">
										<td class="t_front1">&#8545; . 비유동자산</td>
									</tr>
                                    <tr id="bs_tangibleAssets">
										<td class="t_front2">유형자산</td>
									</tr>
                                    <tr id="bs_intangibleAssets">
										<td class="t_front2">무형자산</td>
									</tr>
                                    <tr id="bs_investmentProperties">
										<td class="t_front2">투자부동산</td>
									</tr>
                                    <tr id="bs_longTermFinancial">
										<td class="t_front2">장기금융자산</td>
									</tr>
                                    <tr id="bs_otherLongTermAssets">
										<td class="t_front2">기타비유동자산</td>
									</tr>
                                    <tr>
										<td class="t_front">부채</td>
									</tr>
									<tr id="bs_currentLiabilities">
										<td class="t_front1">&#8544; . 유동부채</td>
									</tr>
                                    <tr id="bs_tradePayables">
										<td class="t_front2">매입채무및기타채무</td>
									</tr>
                                    <tr id="bs_shortTermBorrowings">
										<td class="t_front2">단기차입금</td>
									</tr>
                                    <tr id="bs_incomeTaxesPayables">
										<td class="t_front2">미지급법인세</td>
									</tr>
                                    <tr id="bs_accuredExpenses">
										<td class="t_front2">미지급비용</td>
									</tr>
                                    <tr id="bs_longTermLiabilities">
										<td class="t_front1">&#8545; . 비유동부채</td>
									</tr>
                                    <tr id="bs_longTermBorrowings">
										<td class="t_front2">장기차입금</td>
									</tr>
                                    <tr>
										<td class="t_front">자본</td>
									</tr>
									<tr id="bs_capitalStock">
										<td class="t_front1">&#8544; . 자본금</td>
									</tr>
                                    <tr id="bs_capitalSurplus">
										<td class="t_front1">&#8545; . 자본잉여금</td>
									</tr>
                                    <tr id="bs_retainedEarning">
										<td class="t_front1">&#8546; . 이익잉여금</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
	</div>
	
	

	<!-- 재무제표 Modal -->
	<div class="modal fade" id="bsModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="d-flex justify-content-end">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" style="margin-right: 20px; margin-top: 15px;"></button>
				</div>
				<div class="modal-body">
					<div class="d-flex justify-content-end" style="width: 95%;">
						<div class="download">
							<button class="download_btn">
								<span class="material-icons-sharp">menu</span>
							</button>
						</div>
					</div>

					<div class="download">
						<ul class="download_menu d-none">
							<li><a href="#">PDF(국문)</a></li>
							<li><a href="#">PDF(영문)</a></li>
						</ul>
					</div>
					
					<!-- 재무상태표 -->
					<div class="d-flex justify-content-center flex-column align-items-center mb-5 mt-5" style="width: 100%;">
						<div class="ts_head">
							<h4>재무상태표</h4>
							<p id="balanceSheetDate"></p>
						</div>

						<div
							class="d-flex justify-content-center mt-3 flex-column align-items-center" style="width: 90%;">
							<div class="d-flex justify-content-end" style="width: 100%;">
								<p>(단위: 원)</p>
							</div>
							<table class="table table-bordered trial_balance_table" style="width: 100%;">
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
										<td class="ts_3">>&nbsp;&nbsp;&nbsp;비유동자산 합계</td>
										<td class="ts_4" id="longTermAssets"></td>
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
					<div id="income_sheet" class="d-flex justify-content-center flex-column align-items-center mb-5 mt-5" style="width: 100%;">
						<div class="ts_head">
							<h4>손익계산서</h4>
							<p id="balanceSheetDate1"></p>
						</div>

						<div
							class="d-flex justify-content-center mt-3 flex-column align-items-center" style="width: 90%;">
							<div class="d-flex justify-content-end" style="width: 100%;">
								<p>(단위: 원)</p>
							</div>
							<table class="table table-bordered trial_balance_table" style="width: 100%;">
								<thead>
									<tr class="text-center" style="background-color: #F5F4F4;">
										<th scope="col" width="35%">과목</th>
										<th scope="col"> 금액 </th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>매출액</td>
										<td id="sales"></td>
									</tr>
									<tr>
										<td>매출원가</td>
										<td id="costOfSales"></td>
									</tr>
									<tr>
										<td class="ts_3">[매출총이익]</td>
										<td id="grossProfit"></td>
									</tr>
									<tr>
										<td>판매비와관리비</td>
										<td id="sellingExpenses"></td>
									</tr>
									<tr>
										<td class="ts_3">[영업이익]</td>
										<td id="operatingIncome"></td>
									</tr>
									<tr>
										<td>영업외수익</td>
										<td id="nonOperatingIncome"></td>
									</tr>
									<tr>
										<td>영업외비용</td>
										<td id="nonOperatingExpenses"></td>
									</tr>
									<tr>
										<td>법인세비용</td>
										<td id="incomeTax"></td>
									</tr>
									<tr class="ts_bg">
										<td class="ts_3">[당기순이익]</td>
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
	
	<!-- 유동성 알람 Modal -->
    <div class="modal fade" id="liquidityModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="d-flex justify-content-end">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        style="margin-right: 20px; margin-top:15px;"></button>
                </div>
                
                <c:choose>
                <c:when test="${liquidity gt 0}">
                	<div class="modal-body d-flex flex-column align-items-center">
                   <img src="/resources/img/like.png" alt="">
                    <h4 class="liquidity_title">자금 흐름 양호</h4>
                    
                    <div class="liquidity_notice">
                            <h4>유동성이 전기보다</h4>
                           <h4><span style="color:#008485;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${liquidity}"/></span>원 증가했습니다.</h4>
                            <p>* 유동성 =  현금및현금성자산 + 단기금융자산</p>
                            <h5>기업을 더욱 성장시키고 싶다면 <a href="${pageContext.request.contextPath}/loanProduct" style="color:#008485;">시설자금대출</a>을 확인해보세요</h5>
                    </div>
                </div>
                </c:when>
                <c:otherwise>
                <div class="modal-body d-flex flex-column align-items-center">
                    <img src="/resources/img/alert.png" alt="">
                    <h4 class="liquidity_title">자금 흐름 경고</h4>
                    	<div class="liquidity_notice">
                            <h4>유동성이 전기보다</h4>
                           <h4><span style="color:#e90061;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${fn:substring(liquidity,1,16) }" />원</span> 감소했습니다.</h4>
                            <p>* 유동성 =  현금및현금성자산 + 단기금융자산</p>
                            <h5>단기 자금이 부족하다면 <a href="${pageContext.request.contextPath}/loanProduct" style="color:#E90061;">운전자금대출</a>을 확인해보세요</h5>
                    </div>
                </div>
                </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
	
	
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/script.jsp" />
	<script src="resources/js/financeMain.js"></script>
	
	<script>
		const side1 = document.querySelector('#side1');
		const side2 = document.querySelector('#side2');

		let sideArr = [ side1, side2];

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
		
		
		let assets_1 = 0; 
		

        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
		
		$(document)
		.ready(
				function() {
					

					$
							.ajax({
								url : '${pageContext.request.contextPath}/businessMain/getAllBalanceSheet',
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
									
									accuredExpenses.innerText = data[0].accuredExpenses.toLocaleString('en-US');
									capitalStock.innerText = data[0].capitalStock.toLocaleString('en-US');
									capitalSurplus.innerText = data[0].capitalSurplus.toLocaleString('en-US');
									cash.innerText = data[0].cash.toLocaleString('en-US');
									currentAssets.innerText = data[0].currentAssets.toLocaleString('en-US');
									currentLiabilities.innerText = data[0].currentLiabilities.toLocaleString('en-US');
									incomeTaxesPayables.innerText = data[0].incomeTaxesPayables.toLocaleString('en-US');
									intangibleAssets.innerText = data[0].intangibleAssets.toLocaleString('en-US');
									inventories.innerText = data[0].inventories.toLocaleString('en-US');
									investmentProperties.innerText = data[0].investmentProperties.toLocaleString('en-US');
									liabilities.innerText = data[0].liabilities.toLocaleString('en-US');
									longTermAssets.innerText = data[0].longTermAssets.toLocaleString('en-US');
									longTermBorrowings.innerText = data[0].longTermBorrowings.toLocaleString('en-US');
									longTermFinancial.innerText = data[0].longTermFinancial.toLocaleString('en-US');
									longTermLiabilities.innerText = data[0].longTermLiabilities.toLocaleString('en-US');
									otherLongTermAssets.innerText = data[0].otherLongTermAssets.toLocaleString('en-US');
									retainedEarning.innerText = data[0].retainedEarning.toLocaleString('en-US');
									shortTermBorrowings.innerText = data[0].shortTermBorrowings.toLocaleString('en-US');
									shortTermFinancial.innerText = data[0].shortTermFinancial.toLocaleString('en-US');
									tangibleAssets.innerText = data[0].tangibleAssets.toLocaleString('en-US');
									tradePayables.innerText = data[0].tradePayables.toLocaleString('en-US');
									tradeReceivables.innerText = data[0].tradeReceivables.toLocaleString('en-US');
									equity.innerText = data[0].equity.toLocaleString('en-US');
									assets.innerText = (data[0].currentAssets + data[0].longTermAssets).toLocaleString('en-US');
									liabilitiesAndEquity.innerText = (data[0].liabilities + data[0].equity).toLocaleString('en-US');
									
									/* console.log(longTermAssets); */
									
									const bs_cash = document.querySelector('#bs_cash');
									const bs_currentAssets = document.querySelector('#bs_currentAssets');
									const bs_shortTermFinancial = document.querySelector('#bs_shortTermFinancial');
									const bs_inventories = document.querySelector('#bs_inventories');
									const bs_tradeReceivables = document.querySelector('#bs_tradeReceivables');
									const bs_longTermAssets = document.querySelector('#bs_longTermAssets');
									const bs_tangibleAssets = document.querySelector('#bs_tangibleAssets');
									const bs_intangibleAssets = document.querySelector('#bs_intangibleAssets');
									const bs_investmentProperties = document.querySelector('#bs_investmentProperties');
									const bs_longTermFinancial = document.querySelector('#bs_longTermFinancial');
									const bs_otherLongTermAssets = document.querySelector('#bs_otherLongTermAssets');
									const bs_currentLiabilities = document.querySelector('#bs_currentLiabilities');
									const bs_tradePayables = document.querySelector('#bs_tradePayables');
									const bs_shortTermBorrowings = document.querySelector('#bs_shortTermBorrowings');
									const bs_incomeTaxesPayables = document.querySelector('#bs_incomeTaxesPayables');
									const bs_accuredExpenses = document.querySelector('#bs_accuredExpenses');
									const bs_longTermLiabilities = document.querySelector('#bs_longTermLiabilities');
									const bs_longTermBorrowings = document.querySelector('#bs_longTermBorrowings');
									const bs_capitalStock = document.querySelector('#bs_capitalStock');
									const bs_capitalSurplus = document.querySelector('#bs_capitalSurplus');
									const bs_retainedEarning= document.querySelector('#bs_retainedEarning');
									
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].cash.toLocaleString('en-US');
										bs_cash.appendChild(crtd);
									}
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].currentAssets.toLocaleString('en-US');
										bs_currentAssets.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].shortTermFinancial.toLocaleString('en-US');
										bs_shortTermFinancial.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].inventories.toLocaleString('en-US');
										bs_inventories.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].tradeReceivables.toLocaleString('en-US');
										bs_tradeReceivables.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].longTermAssets.toLocaleString('en-US');
										bs_longTermAssets.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].tangibleAssets.toLocaleString('en-US');
										bs_tangibleAssets.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].intangibleAssets.toLocaleString('en-US');
										bs_intangibleAssets.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].investmentProperties.toLocaleString('en-US');
										bs_investmentProperties.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].longTermFinancial.toLocaleString('en-US');
										bs_longTermFinancial.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].otherLongTermAssets.toLocaleString('en-US');
										bs_otherLongTermAssets.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].currentLiabilities.toLocaleString('en-US');
										bs_currentLiabilities.appendChild(crtd);
									}	
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].tradePayables.toLocaleString('en-US');
										bs_tradePayables.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].shortTermBorrowings.toLocaleString('en-US');
										bs_shortTermBorrowings.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].incomeTaxesPayables.toLocaleString('en-US');
										bs_incomeTaxesPayables.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].accuredExpenses.toLocaleString('en-US');
										bs_accuredExpenses.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].longTermLiabilities.toLocaleString('en-US');
										bs_longTermLiabilities.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].longTermBorrowings.toLocaleString('en-US');
										bs_longTermBorrowings.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].capitalStock.toLocaleString('en-US');
										bs_capitalStock.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].capitalSurplus.toLocaleString('en-US');
										bs_capitalSurplus.appendChild(crtd);
									}	
									
									for(let i = 0; i< 3; i++){
										let crtd = document.createElement("td");
										crtd.innerText = data[i].retainedEarning.toLocaleString('en-US');
										bs_retainedEarning.appendChild(crtd);
									}	

									
									// Highchart2
									Highcharts.chart("myChart", {
									  chart: {
									    plotBackgroundColor: null,
									    plotBorderWidth: null,
									    plotShadow: false,
									    type: "pie",
									    width: 500,
									    height: 320,
									  },
									  title: {
									    text: "자산비율",
									  },
									  tooltip: {
									    pointFormat: "{series.name}: <b>{point.percentage:.1f}%</b>",
									  },
									  accessibility: {
									    point: {
									      valueSuffix: "%",
									    },
									  },
									  plotOptions: {
									    pie: {
									      allowPointSelect: true,
									      cursor: "pointer",
									      dataLabels: {
									        enabled: true,
									        format: "<b>{point.name}</b>: {point.percentage:.1f} %",
									      },
									    },
									  },
									  colors: ['#EED6D3','#F8AFA6', '#FADCD9', '#F9F1F0','#F79489'],
									  series: [
									    {
									      name: "비율",
									      colorByPoint: true,
									      dataSorting: {
									          enabled: true
									      },
									      data: [
									        {
									          name: "현금및현금성자산",
									          y: data[0].cash,
									        },
									        {
									          name: "매출채권및기타채권",
									          y: data[0].tradeReceivables,
									        },
									        {
									          name: "재고자산",
									          y: data[0].inventories,
									        },
									        {
										          name: "단기금융자산",
										          y: data[0].shortTermFinancial,
										     },
										     {
										          name: "비유동자산",
										          y: data[0].longTermAssets,
										     },
									      ],
									    },
									  ],
									});
									
								
								}

							})
							
							const total_asset_return_number = document.querySelector('#total_asset_return_number');
									const total_asset_return_number_1 = document.querySelector('#total_asset_return_number_1');
									
									
							
							$
									.ajax({
										url : '${pageContext.request.contextPath}/businessMain/getAllIncomeStatement',
										type : 'get',
										success : function(data) {
											/* console.log(data) */
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
											const nonOperatingIncome = document
													.querySelector('#nonOperatingIncome');
											const incomeTax = document
													.querySelector('#incomeTax');
											const netIncome = document
													.querySelector('#netIncome');

											sales.innerText = data[0].sales
													.toLocaleString('en-US');
											costOfSales.innerText = data[0].costOfSales
													.toLocaleString('en-US');
											grossProfit.innerText = data[0].grossProfit
													.toLocaleString('en-US');
											sellingExpenses.innerText = data[0].sellingExpenses
													.toLocaleString('en-US');
											operatingIncome.innerText = data[0].operatingIncome
													.toLocaleString('en-US');
											nonOperatingExpenses.innerText = data[0].nonOperatingExpenses
													.toLocaleString('en-US');
											incomeTax.innerText = data[0].incomeTax
													.toLocaleString('en-US');
											netIncome.innerText = data[0].netIncome
													.toLocaleString('en-US');
											

										}

									})
									
							const accountingPeriod2 = document.querySelector('#accountingPeriod2');
							let accountingPeriod3 = '';
							$
							.ajax({
								url : '${pageContext.request.contextPath}/financeMain/accountingPeriod',
								type : 'get',
								success : function(data) {
									console.log(data);
									const term1 = document.querySelector('#term1');
									const term2 = document.querySelector('#term2');
									const term3 = document.querySelector('#term3');
									
									term1.innerText = data[0].accountingPeriod;
									term2.innerText = data[1].accountingPeriod;
									term3.innerText = data[2].accountingPeriod;
									
									const balanceSheetDate = document.querySelector('#balanceSheetDate');
									const balanceSheetDate1 = document.querySelector('#balanceSheetDate1');
									accountingPeriod3 = data[0].accountingPeriod;
								
									
									for(let i  = 0; i < data.length; i++){										
									let cro = document.createElement("option");
									cro.setAttribute("value", data[i].accountingPeriod);
									cro.innerText = data[i].accountingPeriod + '(' + data[i].endDate +')';
									accountingPeriod2.appendChild(cro);
									}
									
									balanceSheetDate.innerText = data[0].startDate.substring(0,4) + '년 ' +  
									 data[0].startDate.substring(6,7) + '월 ' + data[0].startDate.substring(9,10) + '일 부터 ' + 
									' ' +  data[0].endDate.substring(0,4) + '년 ' +  
									 data[0].endDate.substring(5,7) + '월 ' + data[0].endDate.substring(8,10) + '일 까지';
									
									balanceSheetDate1.innerText = data[0].startDate.substring(0,4) + '년 ' +  
									 data[0].startDate.substring(6,7) + '월 ' + data[0].startDate.substring(9,10) + '일 부터 ' + 
									' ' +  data[0].endDate.substring(0,4) + '년 ' +  
									 data[0].endDate.substring(5,7) + '월 ' + data[0].endDate.substring(8,10) + '일 까지';
									
									$.ajax({
										url : '${pageContext.request.contextPath}/financeMain/balanceSheetStat',
										data : {
											accountingPeriod : data[0].accountingPeriod,
										},
										type : 'get',
										success : function(data) {
											console.log(data);
											
											const current_ratio_number_1 = document.querySelector('#current_ratio_number_1');
											const current_ratio_number = document.querySelector('#current_ratio_number');
											
											let current_ratio_1 = parseInt(data.currentRatio);
											current_ratio_number.innerText = current_ratio_1;
											current_ratio_number_1.innerText = current_ratio_1;
											
											const debt_ratio_number = document.querySelector('#debt_ratio_number');
											const debt_ratio_number_1 = document.querySelector('#debt_ratio_number_1');
											
											let debt_ratio_1 = parseInt(data.debtRatio);
											debt_ratio_number.innerText = debt_ratio_1;
											debt_ratio_number_1.innerText = debt_ratio_1;
											
											const total_asset_return_number = document.querySelector('#total_asset_return_number');
											const total_asset_return_number_1 = document.querySelector('#total_asset_return_number_1');
											
											
											let total_asset_return_1 = parseInt(data.totalAssetReturn);
											total_asset_return_number.innerText = total_asset_return_1;
											total_asset_return_number_1.innerText = total_asset_return_1;
											
											const financeSales = document.querySelector('#financeSales');
											financeSales.innerText = data.sales.toLocaleString('en-US') + '원';
											
											const financeNetIncome = document.querySelector('#financeNetIncome');
											financeNetIncome.innerText = data.netIncome.toLocaleString('en-US') + '원';
											
											const financeCostOfSales = document.querySelector('#financeCostOfSales');
											financeCostOfSales.innerText = data.costOfSales.toLocaleString('en-US') + '원';
											
											
											const salesDiff = document.querySelector('#salesDiff');
											salesDiff.innerText = '전기 대비 +' + data.salesDiff.toLocaleString('en-US') + '%';
											
											const costOfSalesDiff = document.querySelector('#costOfSalesDiff');
											costOfSalesDiff.innerText = '전기 대비 +' + data.costOfSalesDiff.toLocaleString('en-US') + '%';
											
											const netIncomeDiff = document.querySelector('#netIncomeDiff');
											netIncomeDiff.innerText = '전기 대비 +' + data.netIncomeDiff.toLocaleString('en-US') + '%';
											
											
											
										}

									});
										
								}

							})
							
							
							
							
				})
				
				accountingPeriod2.addEventListener("change", function(){
					
					/* console.log(accountingPeriod2.value); */
					
					$
					.ajax({
						url : '${pageContext.request.contextPath}/financeMain/balanceSheetStat',
						data : {
							accountingPeriod : accountingPeriod2.value,
						},
						type : 'get',
						success : function(data) {
							/* console.log(data); */
							
							const current_ratio_number_1 = document.querySelector('#current_ratio_number_1');
							const current_ratio_number = document.querySelector('#current_ratio_number');
							
							let current_ratio_1 = parseInt(data.currentRatio);
							current_ratio_number.innerText = current_ratio_1;
							current_ratio_number_1.innerText = current_ratio_1;
							
							const debt_ratio_number = document.querySelector('#debt_ratio_number');
							const debt_ratio_number_1 = document.querySelector('#debt_ratio_number_1');
							
							let debt_ratio_1 = parseInt(data.debtRatio);
							debt_ratio_number.innerText = debt_ratio_1;
							debt_ratio_number_1.innerText = debt_ratio_1;
							
							const total_asset_return_number = document.querySelector('#total_asset_return_number');
							const total_asset_return_number_1 = document.querySelector('#total_asset_return_number_1');
							
							
							let total_asset_return_1 = parseInt(data.totalAssetReturn);
							total_asset_return_number.innerText = total_asset_return_1;
							total_asset_return_number_1.innerText = total_asset_return_1;
							
							const financeSales = document.querySelector('#financeSales');
							financeSales.innerText = data.sales.toLocaleString('en-US') + '원';
							
							const financeNetIncome = document.querySelector('#financeNetIncome');
							financeNetIncome.innerText = data.netIncome.toLocaleString('en-US') + '원';
							
							const financeCostOfSales = document.querySelector('#financeCostOfSales');
							financeCostOfSales.innerText = data.costOfSales.toLocaleString('en-US') + '원';
							
							
							const salesDiff = document.querySelector('#salesDiff');
							salesDiff.innerText = '전기 대비 +' + data.salesDiff.toLocaleString('en-US') + '%';
							
							const costOfSalesDiff = document.querySelector('#costOfSalesDiff');
							let costOfSalesDiffText = '';
							/* if(data.costOfSalesDiff.startsWith('-')){
								costOfSalesDiffText = '전기 대비 ' + data.costOfSalesDiff.toLocaleString('en-US') + '%';
							} else{									
								costOfSalesDiffText = '전기 대비 +' + data.costOfSalesDiff.toLocaleString('en-US') + '%';
							} */
							 costOfSalesDiff.innerText = '전기 대비 +'+  data.salesDiff.toLocaleString('en-US') + '%';
								
							
							const netIncomeDiff = document.querySelector('#netIncomeDiff');
							netIncomeDiff.innerText = '전기 대비 +' + data.netIncomeDiff.toLocaleString('en-US') + '%';
							
							
							
						}

					})
					
					$
									.ajax({
										url : '${pageContext.request.contextPath}/ledger/balanceSheetView2',
										data : {
											accountingPeriod : accountingPeriod2.value,
										},
										type : 'get',
										success : function(data) {
											console.log(data);
											
											// Highchart2
											Highcharts.chart("myChart", {
											  chart: {
											    plotBackgroundColor: null,
											    plotBorderWidth: null,
											    plotShadow: false,
											    type: "pie",
											    width: 500,
											    height: 320,
											  },
											  title: {
											    text: "자산비율",
											  },
											  tooltip: {
											    pointFormat: "{series.name}: <b>{point.percentage:.1f}%</b>",
											  },
											  accessibility: {
											    point: {
											      valueSuffix: "%",
											    },
											  },
											  plotOptions: {
											    pie: {
											      allowPointSelect: true,
											      cursor: "pointer",
											      dataLabels: {
											        enabled: true,
											        format: "<b>{point.name}</b>: {point.percentage:.1f} %",
											      },
											    },
											  },
											  colors: ['#EED6D3','#F8AFA6', '#FADCD9', '#F9F1F0','#F79489'],
											  series: [
											    {
											      name: "비율",
											      colorByPoint: true,
											      dataSorting: {
											          enabled: true
											      },
											      data: [
											        {
											          name: "현금및현금성자산",
											          y: data.cash,
											        },
											        {
											          name: "매출채권및기타채권",
											          y: data.tradeReceivables,
											        },
											        {
											          name: "재고자산",
											          y: data.inventories,
											        },
											        {
												          name: "단기금융자산",
												          y: data.shortTermFinancial,
												     },
												     {
												          name: "비유동자산",
												          y: data.longTermAssets,
												     },
											      ],
											    },
											  ],
											});

										}

									})
				});
        
	</script>
</body>
</html>