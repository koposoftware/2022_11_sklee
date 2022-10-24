<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>대출 심사</title>
<jsp:include page="/WEB-INF/jsp/include/link.jsp" />
<link rel="stylesheet" href="/resources/css/loan.css">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/manager/topMenu2.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/loading3.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="/WEB-INF/jsp/manager/manager_aside.jsp" />
			</div>

			<!-- 대시보드 메인 -->
			<div class="col-md-10 dashboard_main">
				<div class="dashboard_content mb-5">
					<div class="dashboard_header" style="margin-bottom: 50px;">
						<h2>대출심사</h2>
					</div>

					<div class="d-flex justify-content-end" style="margin-bottom: 0px;">
						<button class="btn_2" style="margin-right: 5px;"
							onclick="javascript:refuseLoan(${loan.loanNo})">
							<span class="material-icons-sharp" style="margin-right: 5px">dangerous</span>거절
						</button>
						<button class="btn_1" onclick="javascript:confirmLoanEval()">
							<span class="material-icons-sharp">check_circle</span>승인
						</button>
					</div>

					<div class="firm_cal_head">
						<div class="d-flex mb-3">
							<span class="material-icons-sharp" style="margin-right: 5px;">arrow_circle_right</span>
							<h4>신청사항</h4>
						</div>
					</div>

					<div class="firm_cal_check" style="margin-bottom: 100px;">
						<form
							action="${pageContext.request.contextPath}/manager/confirmLoan"
							id="loanUpdateForm" method="post">
							<table class="loan_apply_table loan_tb">
								<tr>
									<th width="25%">기업명</th>
									<td width="30%">${loan.compName}</td>
									<th>신청일자</th>
									<td>${loan.applyDate}</td>
								</tr>
								<tr>
									<th>대출종류</th>
									<td>${loan.loanCode}</td>
									<th>담당자</th>
									<td>${loan.managerName}</td>
								</tr>
								<tr>
									<th>대출금액</th>
									<td><input type="text" class="form-control text-center"
										value="${loan.loanAmount}" name="loanAmount"></td>
									<th>담당자 이메일</th>
									<td>${loan.managerEmail}</td>
								</tr>
								<tr>
									<th>상환방법</th>
									<td>${loan.loanPayType}</td>
									<th>대출기한(개월)</th>
									<td><input type="text" class="form-control text-center"
										value="${loan.loanTerm}" name="loanTerm"></td>
								</tr>
								<tr>
									<th>대출이자</th>
									<td><input type="text" class="form-control text-center"
										value="${loan.interestRate}" name="interestRate"></td>
									<th>대출금입금계좌</th>
									<td>${loan.accountNo}</td>
									<td class="d-none"><input type="hidden" name="loanNo"
										value="${loan.loanNo}"></td>
								</tr>
							</table>
						</form>
					</div>

					<!-- Tab links -->
					<div class="tab">
						<button class="tablinks" onclick="openBS(event, 'BSRec')">
							<span class="material-icons-sharp" style="margin-right: 5px;">summarize</span>최근
							재무상태표
						</button>
						<button class="tablinks" onclick="openBS(event, 'BS3')">
							<span class="material-icons-sharp" style="margin-right: 5px;">bar_chart</span>재무제표(최근3년)
						</button>
						<button class="tablinks" onclick="openBS(event, 'firmValue')">
							<span class="material-icons-sharp" style="margin-right: 5px;">insights</span>기업가치
							평가
						</button>
					</div>

					<!-- Tab content -->
					<div id="BSRec" class="tabcontent" style="display: block;">
						<!-- 재무상태표 -->
						<div
							class="d-flex justify-content-center flex-column align-items-center mb-5 mt-5"
							style="width: 100%;">
							<div class="ts_head">
								<h4>재무상태표</h4>
								<p id="balanceSheetDate"></p>
							</div>

							<div
								class="d-flex justify-content-center mt-3 flex-column align-items-center"
								style="width: 100%;">
								<div class="d-flex justify-content-end" style="width: 100%;">
									<p>(단위: 원)</p>
								</div>
								<table class="table table-bordered trial_balance_table"
									style="width: 100%;">
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
											<td class="ts_4" id="cash"></td>
											<td>&nbsp;&nbsp;&nbsp;1. 매입채무및기타채무</td>
											<td class="ts_4" id="tradePayables"></td>
										</tr>
										<tr>
											<td>&nbsp;&nbsp;&nbsp;2. 매출채권및기타채권</td>
											<td class="ts_4" id="tradeReceivables"></td>
											<td>&nbsp;&nbsp;&nbsp;2. 단기차입금</td>
											<td class="ts_4" id="shortTermBorrowings"></td>
										</tr>
										<tr>
											<td>&nbsp;&nbsp;&nbsp;3. 재고자산</td>
											<td class="ts_4" id="inventories"></td>
											<td>&nbsp;&nbsp;&nbsp;3. 미지급비용</td>
											<td class="ts_4" id="accuredExpenses"></td>
										</tr>
										<tr>
											<td>&nbsp;&nbsp;&nbsp;4. 단기금융상품</td>
											<td class="ts_4" id="shortTermFinancial"></td>
											<td>&nbsp;&nbsp;&nbsp;4. 미지급법인세</td>
											<td class="ts_4" id="incomeTaxesPayables"></td>
										</tr>
										<tr>
											<td class="ts_3">>&nbsp;&nbsp;&nbsp;유동자산 합계</td>
											<td class="ts_4" id="currentAssets"></td>
											<td class="ts_3">>&nbsp;&nbsp;&nbsp;유동부채 합계</td>
											<td class="ts_4" id="currentLiabilities"></td>

										</tr>
										<tr>
											<td class="ts_3">&#8545;.비유동자산</td>
											<td class="ts_4"></td>
											<td class="ts_3">&#8545;.비유동부채</td>
											<td class="ts_4"></td>
										</tr>
										<tr>
											<td>&nbsp;&nbsp;&nbsp;1. 유형자산</td>
											<td class="ts_4" id="tangibleAssets"></td>
											<td>&nbsp;&nbsp;&nbsp;1. 장기차입금</td>
											<td class="ts_4" id="longTermBorrowings"></td>
										</tr>
										<tr>
											<td>&nbsp;&nbsp;&nbsp;2. 투자부동산</td>
											<td class="ts_4" id="investmentProperties"></td>
											<td class="ts_3">>&nbsp;&nbsp;&nbsp;비유동부채 합계</td>
											<td class="ts_4" id="longTermLiabilities"></td>
										</tr>
										<tr>
											<td>&nbsp;&nbsp;&nbsp;3. 무형자산</td>
											<td class="ts_4" id="intangibleAssets"></td>
											<td class="ts_3">>&nbsp;&nbsp;&nbsp;부채 총계</td>
											<td class="ts_4" id="liabilities"></td>
										</tr>
										<tr>
											<td>&nbsp;&nbsp;&nbsp;4. 장기금융자산</td>
											<td class="ts_4" id="longTermFinancial"></td>
											<td class="ts_3">자본</td>
											<td class="ts_4"></td>
										</tr>
										<tr>
											<td>&nbsp;&nbsp;&nbsp;5. 기타비유동자산</td>
											<td class="ts_4" id="otherLongTermAssets"></td>
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
					</div>

					<div id="BS3" class="tabcontent">
					<div class="bss_head d-flex justify-content-center mb-3">
								<h4 style="font-size: 22px; font-weight: 600;">재무제표 통계</h4>
							</div>
						 <div id="myChart3" style="width:100%; margin-top:40px; margin-bottom:40px;"></div>    
						
						<!-- 3개년 재무제표 -->
						<div
							class="d-flex justify-content-center flex-column align-items-center mb-5"
							style="width: 100%;">
							<div class="bss_head d-flex justify-content-center mb-3">
								<h4 style="font-size: 22px; font-weight: 600;">요약 재무제표</h4>
							</div>
								
							<div
								class="d-flex justify-content-center flex-column align-items-center"
								style="width: 100%;">
								<div class="d-flex justify-content-end" style="width: 100%;">
									<p>(단위: 원)</p>
								</div>
								<table class="balanceSheetSummary">
									<thead>
										<tr class="text-center" style="background-color: #F5F4F4;">
											<th scope="col" width="30%"></th>
										<th scope="col" id="term1">4기</th>
										<th scope="col" id="term2">3기</th>
										<th scope="col" id="term3">2기</th>
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
											<td class="t_front2">&#8545; . 자본잉여금</td>
										</tr>
										<tr id="bs_retainedEarning">
											<td class="t_front2">&#8546; . 이익잉여금</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						
					</div>

					<div id="firmValue" class="tabcontent">
						<div class="cal_firm_value" style="margin-top:40px;">
							<div class="d-flex flex-column align-items-center">
								<h1>
									<b>${loan.compName}</b>의 기업가치는
								</h1>
								<h1>
									<span style="color: #E90061;" id="firmValueResult"></span> 으로
									추정됩니다
								</h1>
							</div>
							<div style="margin-left:80px;">
								<lottie-player
									src="https://assets3.lottiefiles.com/packages/lf20_tljjahng.json"
									background="transparent" speed="1"
									style="width: 300px; height: 300px;" loop autoplay></lottie-player>
							</div>
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
       
       function openBS(evt, BS) {
            // Declare all variables
            var i, tabcontent, tablinks;

            // Get all elements with class="tabcontent" and hide them
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }

            // Get all elements with class="tablinks" and remove the class "active"
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }

            // Show the current tab, and add an "active" class to the button that opened the tab
            document.getElementById(BS).style.display = "block";
            evt.currentTarget.className += " active";
        }
       
       function confirmLoanEval() {
    	   
    	   const loanUpdateForm = document.getElementById('loanUpdateForm');
    	   
           Swal.fire({
               title: '심사완료',
               text: '대출 승인을 완료했습니다!',
               icon: 'success',
               confirmButtonText: '확인'
           }).then(function () {
        	   loanUpdateForm.submit();
           });
       }
       
 function refuseLoan(loanNo) {
	 
	 console.log(loanNo);
    	   
           Swal.fire({
               title: '대출거절',
               text: '대출거절을 거절하시겠습니까?',
               icon: 'warning',
               confirmButtonText: '확인'
               ,confirmButtonColor: "#E43D40",
           }).then(function () {
        	    window.location = "${pageContext.request.contextPath}/manager/loanRefusal/" + loanNo;
           });
       }
       
	$(document)
	.ready(
			function() {
				
				let compName1 = String("${loan.compName}"); 
				let currentAssetsArr = [];
				let longTermAssetsArr = [];
				let currentLiabilitiesArr = [];
				let longTermLiabilitiesArr = [];

				$
						.ajax({
							url : '${pageContext.request.contextPath}/businessMain/getAllBalanceSheet2',
							type : 'get',
							data:{
								compName : compName1
							},
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
								
								for(let i = 3 ; i > 0; i--){
									currentAssetsArr.push(data[i].currentAssets);
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
								
								for(let i = 3 ; i > 0; i--){
									longTermAssetsArr.push(data[i].longTermAssets);
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
								
								for(let i = 3 ; i > 0; i--){
									currentLiabilitiesArr.push(data[i].currentLiabilities);
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
								
								for(let i = 3 ; i > 0; i--){
									longTermLiabilitiesArr.push(data[i].longTermLiabilities);
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
								
								console.log(currentAssetsArr);
								
								Highcharts.chart('myChart3', {
									  chart: {
									    type: 'column'
									  },
									  title: {
									    text: ''
									  },
									  xAxis: {
									    categories: [
									      '2기',
									      '3기',
									      '4기'
									    ],
									    crosshair: true
									  },
									  yAxis: {
									    title: {
									      useHTML: true,
									      text: '금액'
									    }
									  },
									  colors : [
											'#3f526f',
											'#65758c',
											'#8c97a9',
											'#9fa9b7',
											'#b2bac5',
											'#f79256',
											'#fbd1a2' ],
									  tooltip: {
									    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
									    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
									      '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
									    footerFormat: '</table>',
									    shared: true,
									    useHTML: true
									  },
									  plotOptions: {
									    column: {
									      pointPadding: 0.2,
									      borderWidth: 0
									    }
									  },
									  series: [{
									    name: '유동자산',
									    data: currentAssetsArr

									  }, {
									    name: '비유동자산',
									    data:longTermAssetsArr

									  }, {
									    name: '유동부채',
									    data: currentLiabilitiesArr

									  }, {
									    name: '비유동부채',
									    data: longTermLiabilitiesArr

									  }
									  ]
									});

							}

						})
						
								
						$
						.ajax({
							url : '${pageContext.request.contextPath}/financeMain/accountingPeriod2',
							type : 'get',
							data:{
								compName : compName1
							},
							success : function(data) {
								console.log(data);
								
								const balanceSheetDate = document.querySelector('#balanceSheetDate');
								
								balanceSheetDate.innerText = data[0].startDate.substring(0,4) + '년 ' +  
								 data[0].startDate.substring(6,7) + '월 ' + data[0].startDate.substring(9,10) + '일 부터 ' + 
								' ' +  data[0].endDate.substring(0,4) + '년 ' +  
								 data[0].endDate.substring(5,7) + '월 ' + data[0].endDate.substring(8,10) + '일 까지';
							
							}

						})
						
						$
							.ajax({
								url : '${pageContext.request.contextPath}/calFirmValue/result2',
								type : 'get',
								data:{
									compName : compName1
								},
								success : function(data) {
								firmValueResult.innerText =  (data.firmValHigh/100000000).toLocaleString('en-US') + '억 원 ';

								}

							})
						
						
			})
	</script>
</body>
</html>