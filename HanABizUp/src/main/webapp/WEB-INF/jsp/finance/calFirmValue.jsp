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
				<div class="dashboard_content mb-5">
					<div class="dashboard_header">
						<h2>기업가치 계산기</h2>
						<span>모의계산</span>
					</div>

					<div class="firm_cal_notice">
						<p>* 재무제표 항목은 가장 최근 항목을 기준으로 입력해주세요</p>
						<p>* 모든 항목의 기준은 1년 단위입니다.</p>
					</div>

					<div class="d-flex justify-content-end mt-3"
						style="margin-bottom: 0px;">
						<button class="btn_5" id="connectBalanceSheet">
							<span class="material-icons-sharp" style="margin-right: 5px">summarize</span>재무정보
							연동
						</button>
					</div>
					<form:form
						action="${pageContext.request.contextPath}/calFirmValue/calculate">
						<div class="firm_cal_head">
							<div class="d-flex">
								<span class="material-icons-sharp" style="margin-right: 5px">arrow_circle_right</span>
								<h4>재무제표 항목 입력</h4>
							</div>
							<p>
								<span style="color: red;">*</span> 표시는 필수 입력사항입니다
							</p>
						</div>

						<div class="firm_cal_check">

							<table class="firm_cal_table">
								<thead class="text-center">
									<td style="width: 40%;"></td>
									<td style="width: 30%">당기</td>
									<td style="width: 30%">전기</td>
								</thead>
								<tr class="d-none">
									<td><input type="hidden" name="calFirmList[1].fiscalYear" value="1"></td>
									<td><input type="hidden" name="calFirmList[0].fiscalYear" value="0"></td>
								</tr>
								<tr class="d-none">
									<td><input type="hidden" name="calFirmList[1].compName" value="${loginVO.compName}"></td>
									<td><input type="hidden" name="calFirmList[0].compName" value="${loginVO.compName}"></td>
								</tr>
								<tr>
									<th><span>*</span>유동자산</th>
									<td><input type="text" id="currentAssets1"
										class="form-control form-control-sm firm_cal_form" name="calFirmList[1].currentAssets"></td>
									<td><input type="text" id="currentAssets2"
										class="form-control form-control-sm firm_cal_form" name="calFirmList[0].currentAssets"></td>
								</tr>
								<tr>
									<th><span>*</span>비유동자산</th>
									<td><input type="text" id="longTermAssets1"
										class="form-control form-control-sm firm_cal_form" name="calFirmList[1].longTermAssets"></td>
									<td><input type="text" id="longTermAssets2"
										class="form-control form-control-sm firm_cal_form" name="calFirmList[0].longTermAssets"></td>
								</tr>
								<tr>
									<th><span>*</span>유동부채</th>
									<td><input type="text"  id="currentLiabilities1"
										class="form-control form-control-sm firm_cal_form" name="calFirmList[1].currentLiabilities"></td>
									<td><input type="text" id="currentLiabilities2"
										class="form-control form-control-sm firm_cal_form" name="calFirmList[0].currentLiabilities"></td>
								</tr>
								<tr>
									<th><span>*</span>비유동부채</th>
									<td><input type="text" id="longTermLiabilities1"
										class="form-control form-control-sm firm_cal_form" name="calFirmList[1].longTermLiabilities"></td>
									<td><input type="text" id="longTermLiabilities2"
										class="form-control form-control-sm firm_cal_form" name="calFirmList[0].longTermLiabilities"></td>
								</tr>
								<tr>
									<th><span>*</span>매출</th>
									<td><input type="text" id="sales1"
										class="form-control form-control-sm firm_cal_form" name="calFirmList[1].sales"></td>
									<td><input type="text" id="sales2"
										class="form-control form-control-sm firm_cal_form" name="calFirmList[0].sales"></td>
								</tr>
								<tr>
									<th><span>*</span>매출원가</th>
									<td><input type="text" id="costOfSales1"
										class="form-control form-control-sm firm_cal_form" name="calFirmList[1].costOfSales"></td>
									<td><input type="text" id="costOfSales2"
										class="form-control form-control-sm firm_cal_form" name="calFirmList[0].costOfSales"></td>
								</tr>
								<tr>
									<th><span>*</span>감가상각비</th>
									<td><input type="text" id="depreciation1"
										class="form-control form-control-sm firm_cal_form" name="calFirmList[1].depreciation"></td>
									<td><input type="text" id="depreciation2"
										class="form-control form-control-sm firm_cal_form" name="calFirmList[0].depreciation"></td>
								</tr>
							</table>

						</div>

						<div class="firm_cal_head" style="margin-top: 80px;">
							<div class="d-flex">
								<span class="material-icons-sharp" style="margin-right: 5px">arrow_circle_right</span>
								<h4>기타 항목 입력</h4>
							</div>
							<p>
								<span style="color: red;">*</span> 표시는 필수 입력사항입니다
							</p>
						</div>

						<div class="firm_cal_check mb-3">

							<table class="firm_cal_table">
							<tr class="d-none">
									<td><input type="hidden" name="compName" value="${loginVO.compName}"></td>
								</tr>
								<tr>
									<th width="40%"><span>*</span>사채(대출) 표면이자율</th>
									<td width="60%"><input type="text"
										class="form-control form-control-sm firm_cal_form_1" name="kd"></td>
								</tr>
								<tr>
									<th><span>*</span>기업성장률</th>
									<td><input type="text"
										class="form-control form-control-sm firm_cal_form_1" name="growthRate"></td>
								</tr>
								<tr>
									<th><span>*</span>배당수익률</th>
									<td><input type="text"
										class="form-control form-control-sm firm_cal_form_1" name="ke"></td>
								</tr>
								<tr>
									<th><span>*</span>법인세율</th>
									<td><input type="text"
										class="form-control form-control-sm firm_cal_form_1" name="taxRate"></td>
								</tr>
							</table>

						</div>
						<div class="d-flex justify-content-end mt-3"
							style="margin-bottom: 0px;">
							<button class="btn_2" type="submit">
								<span class="material-icons-sharp" style="margin-right: 5px">apartment</span>기업가치
								계산
							</button>
						</div>
					</form:form>
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

		let sideArr = [ side1, side2];

		for (let i = 0; i < sideArr.length; i++) {
			if (sideArr[i].classList.contains('active')) {
				sideArr[i].classList.remove('active')
			}
		}

		sideArr[1].classList.add('active');
		
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
		
		const connectBalanceSheet = document.querySelector('#connectBalanceSheet');
		const currentAssets1 = document.querySelector('#currentAssets1');
		const currentAssets2 = document.querySelector('#currentAssets2');
		const longTermAssets1 = document.querySelector('#longTermAssets1');
		const longTermAssets2 = document.querySelector('#longTermAssets2');
		const currentLiabilities1 = document.querySelector('#currentLiabilities1');
		const currentLiabilities2 = document.querySelector('#currentLiabilities2');
		const longTermLiabilities1 = document.querySelector('#longTermLiabilities1');
		const longTermLiabilities2 = document.querySelector('#longTermLiabilities2');
		const sales1 = document.querySelector('#sales1');
		const sales2 = document.querySelector('#sales2');
		const costOfSales1 = document.querySelector('#costOfSales1');
		const costOfSales2 = document.querySelector('#costOfSales2');
		const depreciation1 = document.querySelector('#depreciation1');
		const depreciation2 = document.querySelector('#depreciation2');
		
		
		connectBalanceSheet.addEventListener("click", function(){
			$
			.ajax({
				url : '${pageContext.request.contextPath}/businessMain/getAllBalanceSheet',
				type : 'get',
				success : function(data) {
					console.log(data)
					currentAssets1.setAttribute("value", data[0].currentAssets);
					currentAssets2.setAttribute("value", data[1].currentAssets);
					longTermAssets1.setAttribute("value", data[0].longTermAssets);
					longTermAssets2.setAttribute("value", data[1].longTermAssets);
					currentLiabilities1.setAttribute("value", data[0].currentLiabilities);
					currentLiabilities2.setAttribute("value", data[1].currentLiabilities);
					longTermLiabilities1.setAttribute("value", data[0].longTermLiabilities);
					longTermLiabilities2.setAttribute("value", data[1].longTermLiabilities);
					

					}
					/* 끝 */

				})
				
				$
			.ajax({
				url : '${pageContext.request.contextPath}/businessMain/getAllIncomeStatement',
				type : 'get',
				success : function(data) {
					console.log(data)
					sales1.setAttribute("value", data[0].sales);
					sales2.setAttribute("value", data[1].sales);
					costOfSales1.setAttribute("value", data[0].costOfSales);
					costOfSales2.setAttribute("value", data[1].costOfSales);
					depreciation1.setAttribute("value", 2000000);
					depreciation2.setAttribute("value", 1000000);

					}
					/* 끝 */

				})

			})
	</script>
</body>
</html>