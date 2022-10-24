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
<title>STARTUPQ | 매출과 비용</title>
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
				<div class="dashboard_content">
					<div class="dashboard_header">
						<h2>매출 및 비용 등록</h2>
					</div>

					<div class="dashboard_notice">
						<p></p>
						
					</div>
					
					<div class="d-flex justify-content-end">
					<form class="d-flex" role="search" id="searchLoanForm" style="width: 48%; margin-bottom: 10px;">
                                    <input class="form-control me-2" type="search" placeholder="어디에 입력할지 모른다면 거래 내용을 검색해보세요" aria-label="Search"
                                    id="searchKeyword">
                                    <button class="btn_1" type="reset" onclick="javascript:searchAccountingCode()" data-bs-toggle="modal" data-bs-target="#answerModal"><span
                                            class="material-icons-sharp">search</span></button>
                                </form>
					</div>

					<form:form
						action="${pageContext.request.contextPath}/revenueCost/addRevenueLedger"
						commandName="revenueVO" id="revenueForm">
						<!-- 매출 입력 -->
						<div class="rc_head" id="revenue">
							<h4>매출</h4>
							<div class="d-flex justify-content-between"
								style="margin-bottom: 2px;">
								<span class="explain_1"><span style="color: red;">*</span>거래일자는
									상품 또는 서비스를 실제 인도한 일자를 적어주세요</span>

								<div class="d-flex" style="margin-bottom: 0px;">
									<button class="btn_1" data-bs-toggle="modal" type="button"
										data-bs-target="#rcModal">
										<span class="material-icons-sharp" style="margin-right: 5px;">category</span>상품등록
									</button>
									<button class="crud_btn" type="button" id="addrc">
										<span class="material-icons-sharp">add</span>
									</button>
									<button class="crud_btn" type="button" id="delrc">
										<span class="material-icons-sharp">delete</span>
									</button>
								</div>
							</div>
						</div>

						<div class="rc_check">

							<table class="rc_table text-center">
								<tr>
									<th width="4%"><input class="form-check-input"
										type="checkbox"></th>
									<th width="13%">매출일자</th>
									<th width="15%">상품명(재고)</th>
									<th width="13%">판매총금액</th>
									<th width="8%">판매수량</th>
									<th width="10%">판매방식</th>
									<th width="20%">비고</th>

								</tr>
								<tbody id="rc_table_1">
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form" id="rcDate1"
											name="revenueList[0].ledgerDate" placeholder="YYYY-MM-DD"></td>
										<td><select
											class="form-select form-select-sm text-center firm_select_form"
											id="productList" name="revenueList[0].productName">
										</select></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form"
											name="revenueList[0].totalAmount"></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form"
											name="revenueList[0].quantity"></td>
										<td class="d-none"><input type="hidden"
											name="revenueList[0].compName" value="${loginVO.compName}"></td>
										<td><select
											class="form-select form-select-sm text-center firm_select_form"
											name="revenueList[0].paymentCode">
												<option value="M001">현금</option>
												<option value="M002">매출채권</option>
										</select></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form"
											name="revenueList[0].detail"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 매출 끝 -->

						<!-- 생산비용 입력 -->
						<div class="rc_head mt-4">
							<h4>생산(구매)비용</h4>
							<div class="d-flex justify-content-between"
								style="margin-bottom: 2px;">
								<div class="d-flex flex-columnn">
								<span class="explain_1"><span style="color: red;">*</span>각
									상품의 생산량/구매량을 입력하세요</span>
								</div>

								<div class="d-flex" style="margin-bottom: 0px;">
									<button class="crud_btn" type="button" id="addpc">
										<span class="material-icons-sharp">add</span>
									</button>
									<button class="crud_btn" type="button">
										<span class="material-icons-sharp">delete</span>
									</button>
								</div>
							</div>
						</div>


						<div class="rc_check">
							<table class="rc_table text-center">
								<tr>
									<th width="4%"><input class="form-check-input"
										type="checkbox"></th>
									<th width="13%">생산일자</th>
									<th width="13%">상품명</th>
									<th width="8%">생산수량</th>
									<th width="10%">비용지불</th>
									<th width="20%">비고</th>

								</tr>
								<tbody id="rc_table_2">
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form" id="rcDate2"
											name="productCostList[0].ledgerDate" placeholder="YYYY-MM-DD"></td>
										<td><select
											class="form-select form-select-sm text-center firm_select_form"
											id="productList1" name="productCostList[0].productName">
										</select></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form"
											name="productCostList[0].quantity"></td>
										<td class="d-none"><input type="hidden"
											name="productCostList[0].compName"
											value="${loginVO.compName}"></td>
										<td><select
											class="form-select form-select-sm text-center firm_select_form"
											name="productCostList[0].paymentCode">
												<option value="M001">현금</option>
												<option value="M002">매입채무</option>
										</select></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form"
											name="productCostList[0].detail" style="margin-left: 12px;"></td>
									</tr>
								</tbody>
							</table>

						</div>
						<!-- 생산비용 끝 -->


						<!-- 판매관리비 입력 -->
						<div class="rc_head mt-4">
							<h4>판매관리비</h4>
							<div class="d-flex justify-content-between"
								style="margin-bottom: 2px;">
								<div class="d-flex">
								<span class="explain_1"><span style="color: red;">*
								</span>거래가 발생한 일자를 기준으로 지급과 미지급을 판단해주세요</span>
								<div class="d-flex align-items-center">
								 <div class="help_icon" style="background-color: #008485;"
                                            data-bs-toggle="tooltip" data-bs-title="ex) 거래처 회식을 접대비 항목으로 계상할 경우 회식일자를 기준으로 판단합니다."
                                            data-bs-placement="top" data-bs-custom-class="custom-tooltip">?
                                        </div>
								</div>
								</div>
								<div class="d-flex" style="margin-bottom: 0px;">
									<button class="crud_btn" type="button" id="addse">
										<span class="material-icons-sharp">add</span>
									</button>
									<button class="crud_btn" type="button">
										<span class="material-icons-sharp">delete</span>
									</button>
								</div>
							</div>
						</div>



						<div class="rc_check">
							<table class="rc_table text-center">
								<tr>
									<th width="4%"><input class="form-check-input"
										type="checkbox"></th>
									<th width="13%">거래일자</th>
									<th width="13%">항목</th>
									<th width="13%">지출액</th>
									<th width="8%">지불방식</th>
									<th width="16%">비고</th>

								</tr>
								<tbody id="rc_table_3">
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form"
											name="SellingExpensesList[0].ledgerDate"
											placeholder="YYYY-MM-DD" id="rcDate3"></td>
										<td><select
											class="form-select form-select-sm text-center firm_select_form"
											id="costCode" name="SellingExpensesList[0].debitCode">
										</select></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form"
											name="SellingExpensesList[0].totalAmount"></td>
										<td class="d-none"><input type="hidden"
											name="SellingExpensesList[0].compName"
											value="${loginVO.compName}"></td>
										<td><select
											class="form-select form-select-sm text-center firm_select_form"
											name="SellingExpensesList[0].paymentCode">
												<option value="M001">지급</option>
												<option value="M002">미지급</option>
										</select></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form"
											name="SellingExpensesList[0].detail"
											style="margin-left: 12px;"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 판매관리비 끝 -->

						<!-- 자산 입력 -->
						<div class="rc_head mt-4">
							<h4>자산</h4>
							<div class="d-flex justify-content-between"
								style="margin-bottom: 2px;">
								<span class="explain_1"><span style="color: red;">*
								</span>자산(1년 이상 사용)에 관한 사항을 기입해주세요</span>

								<div class="d-flex" style="margin-bottom: 0px;">
									<button class="crud_btn" type="button" id="addas">
										<span class="material-icons-sharp">add</span>
									</button>
									<button class="crud_btn" type="button">
										<span class="material-icons-sharp">delete</span>
									</button>
								</div>
							</div>
						</div>



						<div class="rc_check">
							<table class="rc_table text-center">
								<tr>
									<th width="4%"><input class="form-check-input"
										type="checkbox"></th>
									<th width="13%">거래일자</th>
									<th width="13%">항목</th>
									<th width="13%">지출액</th>
									<th width="8%">지불방식</th>
									<th width="16%">비고</th>

								</tr>
								<tbody id="rc_table_4">
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form" id="rcDate4"
											name="AssetsList[0].ledgerDate" placeholder="YYYY-MM-DD"></td>
										<td><select
											class="form-select form-select-sm text-center firm_select_form"
											id="assetsCode" name="AssetsList[0].debitCode">
										</select></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form"
											name="AssetsList[0].totalAmount"></td>
										<td class="d-none"><input type="hidden"
											name="AssetsList[0].compName" value="${loginVO.compName}"></td>
										<td><select
											class="form-select form-select-sm text-center firm_select_form"
											name="AssetsList[0].paymentCode">
												<option value="M001">현금</option>
												<option value="M002">매입채무</option>
										</select></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form"
											name="AssetsList[0].detail" style="margin-left: 12px;"></td>
									</tr>
								</tbody>
							</table>
							<div class="d-flex justify-content-end mt-3"
								style="margin-bottom: 0;">
								<button class="btn_2" id="addLedgerBtn">등록하기</button>
							</div>
						</div>

					</form:form>
					<!-- 판매관리비 끝 -->







				</div>
			</div>

			<!-- 상품등록 Modal -->
			<div class="modal fade" id="rcModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="d-flex justify-content-end">
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close" style="margin-right: 20px; margin-top: 15px;"></button>
						</div>
						<div class="modal-body d-flex flex-column align-items-center">
							<img src="resources/img/content.png" alt="">
							<h4 class="modal_title">상품 등록</h4>
							<div class="select_salary" style="width: 700px;">
								<div class="d-flex justify-content-end"
									style="margin-bottom: 0px;">
									<button class="crud_btn" id="addProduct">
										<span class="material-icons-sharp">add</span>
									</button>
								</div>
								<form:form
									action="${pageContext.request.contextPath}/revenueCost/addProduct"
									commandName="productVO" name="productForm" id="productForm">
									<table class="rc_table text-center" style="width: 700px">
										<tr>
											<th>상품명</th>
											<th>상품원가(개당)</th>
											<th>재고수량</th>
											<th>누적판매수량</th>
										</tr>
										<tbody id="addProduct_1">
											<tr>
												<td><input type="text"
													class="form-control form-control-sm firm_value_form"
													name="productList[0].productName"></td>
												<td><input type="text"
													class="form-control form-control-sm firm_value_form"
													name="productList[0].productCost"></td>
												<td><input type="text"
													class="form-control form-control-sm firm_value_form"
													name="productList[0].inventory"></td>
												<td><input type="text"
													class="form-control form-control-sm firm_value_form"
													name="productList[0].productSold" value="0"></td>
												<td class="d-none"><input type="hidden"
													name="productList[0].compName" value="${loginVO.compName}"></td>
											</tr>
										</tbody>
									</table>


								</form:form>

								<div class="d-flex justify-content-end mt-3">
									<button class="btn_1" id="addProductBtn" type="button">등록하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	
		<!-- 검색 알람 Modal -->
    <div class="modal fade" id="answerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="d-flex justify-content-end">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        style="margin-right: 20px; margin-top:15px;"></button>
                </div>
               
                	<div class="modal-body d-flex flex-column align-items-center">
                   <img src="/resources/img/no-results.png" alt="">
                    <h4 class="liquidity_title" style="font-size:18px;"><span id="searchWord" style="color:#008485;"></span>에 대한 검색결과</h4>
                    
                    <div class="liquidity_notice">
                            <h4 id="answerCode" style="font-size: 25px; margin-bottom:20px; margin-bottom:20px;"></h4>
                            <h5 id="searchDetail"  style="margin-top:10px; margin-bottom:30px;width:85%; line-height:25px; color: var(--color-gray-1)"></h5>
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
		sideArr[0].classList.add('active');
		
		 const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
	        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
			
	        let today = new Date();
		 console.log(today);
		 console.log(today.getFullYear() + '-' + (today.getMonth()+1) + '-' + (today.getDate()-1));
		 let todayDate = today.getFullYear() + '-' + (today.getMonth()+1) + '-' + (today.getDate()-1);
		 rcDate1.setAttribute("value",todayDate );
		 rcDate2.setAttribute("value",todayDate );
		 rcDate3.setAttribute("value",todayDate );
		 rcDate4.setAttribute("value",todayDate );
		
		$(window).on('load', function() {
			setTimeout(removeLoader, 500); //wait for page load PLUS two seconds.
		});

		function removeLoader() {
			$("#loadingDiv").fadeOut(100, function() {
				// fadeOut complete. Remove the loading div
				$("#loadingDiv").remove(); //makes page more lightweight 
			});
		}
		
		 function searchAccountingCode() {
	            const searchKeyword1 = document.querySelector('#searchKeyword');
	            const searchWord = document.querySelector('#searchWord');
	            const answerCode = document.querySelector('#answerCode');
	            const searchDetail = document.querySelector('#searchDetail');
	            console.log(searchKeyword1.value);
	            
	            let keyword = searchKeyword1.value;
	            
	            $
				.ajax({
					url : '${pageContext.request.contextPath}/ledger/searchAccoountingKeyword',
					type : 'get',
					data: {
						searchKeyword : keyword
					},
					success : function(data) {
						console.log(data)
						searchWord.innerText = keyword;
						answerCode.innerText = '" ' +  data.accountingCode + ' "';
						searchDetail.innerText = data.searchDetail;
	
					}

				})
	        }

		//상품목록
		const productList = document.querySelector('#productList');
		const productList1 = document.querySelector('#productList1');
		const addProduct_1 = document.querySelector('#addProduct_1');
		const costCode = document.querySelector('#costCode');
		const assetsCode = document.querySelector('#assetsCode');

		$(document)
				.ready(
						function() {
							$
									.ajax({
										url : '${pageContext.request.contextPath}/revenueCost/productList',
										type : 'get',
										success : function(data) {
											console.log(data)
											$('#productList').empty();

											for (let i = 0; i < data.length; i++) {

												let cro = document
														.createElement("option");
												cro.setAttribute("value",
														data[i].productName);
												cro.innerText = data[i].productName;
												productList.appendChild(cro);
											}

											$('#productList1').empty();
											for (let i = 0; i < data.length; i++) {

												let cro = document
														.createElement("option");
												cro.setAttribute("value",
														data[i].productName);
												cro.innerText = data[i].productName;
												productList1.appendChild(cro);
											}

										}

									})

							$
									.ajax({
										url : '${pageContext.request.contextPath}/revenueCost/accountingCode',
										type : 'get',
										success : function(data) {
											console.log(data)
											$('#costCode').empty();
											for (let i = 0; i < data.length; i++) {
												let cro = document
														.createElement("option");
												cro.setAttribute("value",
														data[i].accountingCode);
												cro.innerText = data[i].accountingDetail;
												costCode.appendChild(cro);
											}

										}

									})

							$
									.ajax({
										url : '${pageContext.request.contextPath}/revenueCost/assetsCode',
										type : 'get',
										success : function(data) {
											console.log(data)
											$('#assetsCode').empty();
											for (let i = 0; i < data.length; i++) {
												let cro = document
														.createElement("option");
												cro.setAttribute("value",
														data[i].accountingCode);
												cro.innerText = data[i].accountingDetail;
												assetsCode.appendChild(cro);
											}

										}

									})
						})

		const addProduct = document.querySelector('#addProduct');
		let i = 1;
		addProduct.addEventListener("click", function() {
			let ctr = document.createElement("tr");

			let ctd = document.createElement("td");
			let crin = document.createElement("input");
			crin.setAttribute("type", "text");
			crin.setAttribute("name", "productList[" + i + "].productName");
			crin.classList.add("form-control");
			crin.classList.add("form-control-sm");
			crin.classList.add("firm_value_form");
			ctd.appendChild(crin);
			ctr.appendChild(ctd);

			let ctd1 = document.createElement("td");
			let crin1 = document.createElement("input");
			crin1.setAttribute("type", "text");
			crin1.setAttribute("name", "productList[" + i + "].productCost");
			crin1.classList.add("form-control");
			crin1.classList.add("form-control-sm");
			crin1.classList.add("firm_value_form");
			ctd1.appendChild(crin1);
			ctr.appendChild(ctd1);

			let ctd3 = document.createElement("td");
			let crin3 = document.createElement("input");
			crin3.setAttribute("type", "text");
			crin3.setAttribute("name", "productList[" + i + "].inventory");
			crin3.classList.add("form-control");
			crin3.classList.add("form-control-sm");
			crin3.classList.add("firm_value_form");
			ctd3.appendChild(crin3);
			ctr.appendChild(ctd3);

			let ctd4 = document.createElement("td");
			let crin4 = document.createElement("input");
			crin4.setAttribute("type", "text");
			crin4.setAttribute("name", "productList[" + i + "].productSold");
			crin4.setAttribute("value", "0");
			crin4.classList.add("form-control");
			crin4.classList.add("form-control-sm");
			crin4.classList.add("firm_value_form");
			ctd4.appendChild(crin4);
			ctr.appendChild(ctd4);

			let ctd2 = document.createElement("td");
			ctd2.classList.add("d-none");
			let crin2 = document.createElement("input");
			crin2.setAttribute("type", "hidden");
			crin2.setAttribute("name", "productList[" + i + "].compName");
			crin2.setAttribute("value", "${loginVO.compName}");
			ctd2.appendChild(crin2);
			ctr.appendChild(ctd2);

			addProduct_1.appendChild(ctr);
			i = i + 1;

		})

		const productBtn = document.querySelector('#addProductBtn');
		const productForm = document.querySelector('#productForm');
		productBtn.addEventListener("click", function() {
			productForm.submit();
		})

		const addrc = document.querySelector('#addrc');
		const rc_tbody_1 = document.querySelector('#rc_table_1');

		let j = 1;

		addrc
				.addEventListener(
						"click",
						function() {
							let ctr = document.createElement("tr");

							let ctd = document.createElement("td");
							let crin = document.createElement("input");
							crin.setAttribute("type", "checkbox");
							crin.classList.add("form-check-input");
							ctd.appendChild(crin);
							ctr.appendChild(ctd);

							let ctd1 = document.createElement("td");
							let crin1 = document.createElement("input");
							crin1.setAttribute("type", "text");
							crin1.setAttribute("placeholder", "YYYY-MM-DD");
							crin1.setAttribute("value", todayDate);
							crin1.setAttribute("name", "revenueList[" + j
									+ "].ledgerDate");
							crin1.classList.add("form-control");
							crin1.classList.add("form-control-sm");
							crin1.classList.add("firm_value_form");
							ctd1.appendChild(crin1);
							ctr.appendChild(ctd1);

							let ctd2 = document.createElement("td");
							let crs0 = document.createElement("select");
							crs0.setAttribute("type", "text");
							crs0.setAttribute("name", "revenueList[" + j
									+ "].productName");
							crs0.classList.add("form-select");
							crs0.classList.add("form-select-sm");
							crs0.classList.add("firm_value_form");
							crs0.classList.add("text-center");

							$
									.ajax({
										url : '${pageContext.request.contextPath}/revenueCost/productList',
										type : 'get',
										success : function(data) {
											console.log(data)
											for (let i = 0; i < data.length; i++) {
												let cro = document
														.createElement("option");
												cro.setAttribute("value",
														data[i].productName);
												cro.innerText = data[i].productName;
												crs0.appendChild(cro);
											}

										}

									})

							ctd2.appendChild(crs0);
							ctr.appendChild(ctd2);

							let ctd3 = document.createElement("td");
							let crin3 = document.createElement("input");
							crin3.setAttribute("type", "text");
							crin3.setAttribute("name", "revenueList[" + j
									+ "].totalAmount");
							crin3.classList.add("form-control");
							crin3.classList.add("form-control-sm");
							crin3.classList.add("firm_value_form");
							ctd3.appendChild(crin3);
							ctr.appendChild(ctd3);

							let ctd4 = document.createElement("td");
							let crin4 = document.createElement("input");
							crin4.setAttribute("type", "text");
							crin4.setAttribute("name", "revenueList[" + j
									+ "].quantity");
							crin4.classList.add("form-control");
							crin4.classList.add("form-control-sm");
							crin4.classList.add("firm_value_form");
							ctd4.appendChild(crin4);
							ctr.appendChild(ctd4);

							let ctd6 = document.createElement("td");
							ctd6.classList.add('d-none');
							let crin6 = document.createElement("input");
							crin6.setAttribute("type", "hidden");
							crin6.setAttribute("name", "revenueList[" + j
									+ "].compName");
							crin6.setAttribute("value", "${loginVO.compName}");
							ctd6.appendChild(crin6);
							ctr.appendChild(ctd6);

							let ctd5 = document.createElement("td");
							let crs = document.createElement("select");
							crs.setAttribute("type", "text");
							crs.setAttribute("name", "revenueList[" + j
									+ "].paymentCode");
							crs.classList.add("form-select");
							crs.classList.add("form-select-sm");
							crs.classList.add("firm_value_form");
							crs.classList.add("text-center");
							let cto = document.createElement("option");
							cto.setAttribute("value", "M001");
							cto.innerText = '현금';
							let cto1 = document.createElement("option");
							cto1.setAttribute("value", "M002");
							cto1.innerText = '매출채권';
							crs.appendChild(cto);
							crs.appendChild(cto1);
							ctd5.appendChild(crs);
							ctr.appendChild(ctd5);

							let ctd7 = document.createElement("td");
							let crin7 = document.createElement("input");
							crin7.setAttribute("type", "text");
							crin7.setAttribute("name", "revenueList[" + j
									+ "].detail");
							crin7.classList.add("form-control");
							crin7.classList.add("form-control-sm");
							crin7.classList.add("firm_value_form");
							ctd7.appendChild(crin7);
							ctr.appendChild(ctd7);

							rc_table_1.appendChild(ctr);

							j = j + 1;
						})

		/* 생산비용 더하기 */

		const addpc = document.querySelector('#addpc');
		const rc_tbody_2 = document.querySelector('#rc_table_2');

		let k = 1;

		addpc
				.addEventListener(
						"click",
						function() {
							let ctr = document.createElement("tr");

							let ctd = document.createElement("td");
							let crin = document.createElement("input");
							crin.setAttribute("type", "checkbox");
							crin.classList.add("form-check-input");
							ctd.appendChild(crin);
							ctr.appendChild(ctd);

							let ctd1 = document.createElement("td");
							let crin1 = document.createElement("input");
							crin1.setAttribute("type", "text");
							crin1.setAttribute("placeholder", "YYYY-MM-DD");
							crin1.setAttribute("value", todayDate);
							crin1.setAttribute("name", "productCostList[" + k
									+ "].ledgerDate");
							crin1.classList.add("form-control");
							crin1.classList.add("form-control-sm");
							crin1.classList.add("firm_value_form");
							ctd1.appendChild(crin1);
							ctr.appendChild(ctd1);

							let ctd2 = document.createElement("td");
							let crs0 = document.createElement("select");
							crs0.setAttribute("type", "text");
							crs0.setAttribute("name", "productCostList[" + k
									+ "].productName");
							crs0.classList.add("form-select");
							crs0.classList.add("form-select-sm");
							crs0.classList.add("firm_value_form");
							crs0.classList.add("text-center");

							$
									.ajax({
										url : '${pageContext.request.contextPath}/revenueCost/productList',
										type : 'get',
										success : function(data) {
											console.log(data)
											for (let i = 0; i < data.length; i++) {
												let cro = document
														.createElement("option");
												cro.setAttribute("value",
														data[i].productName);
												cro.innerText = data[i].productName;
												crs0.appendChild(cro);
											}

										}

									})

							ctd2.appendChild(crs0);
							ctr.appendChild(ctd2);

							let ctd3 = document.createElement("td");
							let crin3 = document.createElement("input");
							crin3.setAttribute("type", "text");
							crin3.setAttribute("name", "productCostList[" + k
									+ "].quantity");
							crin3.classList.add("form-control");
							crin3.classList.add("form-control-sm");
							crin3.classList.add("firm_value_form");
							ctd3.appendChild(crin3);
							ctr.appendChild(ctd3);

							let ctd5 = document.createElement("td");
							let crs = document.createElement("select");
							crs.setAttribute("type", "text");
							crs.setAttribute("name", "productCostList[" + k
									+ "].paymentCode");
							crs.classList.add("form-select");
							crs.classList.add("form-select-sm");
							crs.classList.add("firm_value_form");
							crs.classList.add("text-center");
							let cto = document.createElement("option");
							cto.setAttribute("value", "M001");
							cto.innerText = '현금';
							let cto1 = document.createElement("option");
							cto1.setAttribute("value", "M002");
							cto1.innerText = '매입채무';
							crs.appendChild(cto);
							crs.appendChild(cto1);
							ctd5.appendChild(crs);
							ctr.appendChild(ctd5);

							let ctd6 = document.createElement("td");
							ctd6.classList.add('d-none');
							let crin6 = document.createElement("input");
							crin6.setAttribute("type", "hidden");
							crin6.setAttribute("name", "productCostList[" + k
									+ "].compName");
							crin6.setAttribute("value", "${loginVO.compName}");
							ctd6.appendChild(crin6);
							ctr.appendChild(ctd6);

							let ctd7 = document.createElement("td");
							let crin7 = document.createElement("input");
							crin7.setAttribute("type", "text");
							crin7.setAttribute("style", "margin-left:12px;");
							crin7.setAttribute("name", "productCostList[" + k
									+ "].detail");
							crin7.classList.add("form-control");
							crin7.classList.add("form-control-sm");
							crin7.classList.add("firm_value_form");
							ctd7.appendChild(crin7);
							ctr.appendChild(ctd7);

							rc_table_2.appendChild(ctr);

							k = k + 1;
						})

		/* 판매관리비 더하기 */

		const addse = document.querySelector('#addse');
		const rc_tbody_3 = document.querySelector('#rc_table_3');

		let l = 1;

		addse
				.addEventListener(
						"click",
						function() {
							let ctr = document.createElement("tr");

							let ctd = document.createElement("td");
							let crin = document.createElement("input");
							crin.setAttribute("type", "checkbox");
							crin.classList.add("form-check-input");
							ctd.appendChild(crin);
							ctr.appendChild(ctd);

							let ctd1 = document.createElement("td");
							let crin1 = document.createElement("input");
							crin1.setAttribute("type", "text");
							crin1.setAttribute("placeholder", "YYYY-MM-DD");
							crin1.setAttribute("value", todayDate);
							crin1.setAttribute("name", "SellingExpensesList["
									+ l + "].ledgerDate");
							crin1.classList.add("form-control");
							crin1.classList.add("form-control-sm");
							crin1.classList.add("firm_value_form");
							ctd1.appendChild(crin1);
							ctr.appendChild(ctd1);

							let ctd2 = document.createElement("td");
							let crs0 = document.createElement("select");
							crs0.setAttribute("type", "text");
							crs0.setAttribute("name", "SellingExpensesList["
									+ l + "].debitCode");
							crs0.classList.add("form-select");
							crs0.classList.add("form-select-sm");
							crs0.classList.add("firm_value_form");
							crs0.classList.add("text-center");

							$
									.ajax({
										url : '${pageContext.request.contextPath}/revenueCost/accountingCode',
										type : 'get',
										success : function(data) {
											console.log(data)
											for (let i = 0; i < data.length; i++) {
												let cro = document
														.createElement("option");
												cro.setAttribute("value",
														data[i].accountingCode);
												cro.innerText = data[i].accountingDetail;
												crs0.appendChild(cro);
											}

										}

									})

							ctd2.appendChild(crs0);
							ctr.appendChild(ctd2);

							let ctd3 = document.createElement("td");
							let crin3 = document.createElement("input");
							crin3.setAttribute("type", "text");
							crin3.setAttribute("name", "SellingExpensesList["
									+ l + "].totalAmount");
							crin3.classList.add("form-control");
							crin3.classList.add("form-control-sm");
							crin3.classList.add("firm_value_form");
							ctd3.appendChild(crin3);
							ctr.appendChild(ctd3);

							let ctd5 = document.createElement("td");
							let crs = document.createElement("select");
							crs.setAttribute("type", "text");
							crs.setAttribute("name", "SellingExpensesList[" + l
									+ "].paymentCode");
							crs.classList.add("form-select");
							crs.classList.add("form-select-sm");
							crs.classList.add("firm_value_form");
							crs.classList.add("text-center");
							let cto = document.createElement("option");
							cto.setAttribute("value", "M001");
							cto.innerText = '지급';
							let cto1 = document.createElement("option");
							cto1.setAttribute("value", "M002");
							cto1.innerText = '미지급';
							crs.appendChild(cto);
							crs.appendChild(cto1);
							ctd5.appendChild(crs);
							ctr.appendChild(ctd5);

							let ctd6 = document.createElement("td");
							ctd6.classList.add('d-none');
							let crin6 = document.createElement("input");
							crin6.setAttribute("type", "hidden");
							crin6.setAttribute("name", "SellingExpensesList["
									+ l + "].compName");
							crin6.setAttribute("value", "${loginVO.compName}");
							ctd6.appendChild(crin6);
							ctr.appendChild(ctd6);

							let ctd7 = document.createElement("td");
							let crin7 = document.createElement("input");
							crin7.setAttribute("type", "text");
							crin7.setAttribute("style", "margin-left:12px;");
							crin7.setAttribute("name", "SellingExpensesList["
									+ l + "].detail");
							crin7.classList.add("form-control");
							crin7.classList.add("form-control-sm");
							crin7.classList.add("firm_value_form");
							ctd7.appendChild(crin7);
							ctr.appendChild(ctd7);

							rc_table_3.appendChild(ctr);

							l = l + 1;
						})

		/* 자산 더하기 */

		const addas = document.querySelector('#addas');
		const rc_tbody_4 = document.querySelector('#rc_table_4');

		let m = 1;

		addas
				.addEventListener(
						"click",
						function() {
							let ctr = document.createElement("tr");

							let ctd = document.createElement("td");
							let crin = document.createElement("input");
							crin.setAttribute("type", "checkbox");
							crin.classList.add("form-check-input");
							ctd.appendChild(crin);
							ctr.appendChild(ctd);

							let ctd1 = document.createElement("td");
							let crin1 = document.createElement("input");
							crin1.setAttribute("type", "text");
							crin1.setAttribute("placeholder", "YYYY-MM-DD");
							crin1.setAttribute("name", "AssetsList[" + m
									+ "].ledgerDate");
							crin1.classList.add("form-control");
							crin1.classList.add("form-control-sm");
							crin1.classList.add("firm_value_form");
							crin1.setAttribute("value", todayDate);
							ctd1.appendChild(crin1);
							ctr.appendChild(ctd1);

							let ctd2 = document.createElement("td");
							let crs0 = document.createElement("select");
							crs0.setAttribute("type", "text");
							crs0.setAttribute("name", "AssetsList[" + m
									+ "].debitCode");
							crs0.classList.add("form-select");
							crs0.classList.add("form-select-sm");
							crs0.classList.add("firm_value_form");
							crs0.classList.add("text-center");

							$
									.ajax({
										url : '${pageContext.request.contextPath}/revenueCost/assetsCode',
										type : 'get',
										success : function(data) {
											console.log(data)
											for (let i = 0; i < data.length; i++) {
												let cro = document
														.createElement("option");
												cro.setAttribute("value",
														data[i].accountingCode);
												cro.innerText = data[i].accountingDetail;
												crs0.appendChild(cro);
											}

										}

									})

							ctd2.appendChild(crs0);
							ctr.appendChild(ctd2);

							let ctd3 = document.createElement("td");
							let crin3 = document.createElement("input");
							crin3.setAttribute("type", "text");
							crin3.setAttribute("name", "AssetsList[" + m
									+ "].totalAmount");
							crin3.classList.add("form-control");
							crin3.classList.add("form-control-sm");
							crin3.classList.add("firm_value_form");
							ctd3.appendChild(crin3);
							ctr.appendChild(ctd3);

							let ctd5 = document.createElement("td");
							let crs = document.createElement("select");
							crs.setAttribute("type", "text");
							crs.setAttribute("name", "AssetsList[" + m
									+ "].paymentCode");
							crs.classList.add("form-select");
							crs.classList.add("form-select-sm");
							crs.classList.add("firm_value_form");
							crs.classList.add("text-center");
							let cto = document.createElement("option");
							cto.setAttribute("value", "M001");
							cto.innerText = '현금';
							let cto1 = document.createElement("option");
							cto1.setAttribute("value", "M002");
							cto1.innerText = '매입채무';
							crs.appendChild(cto);
							crs.appendChild(cto1);
							ctd5.appendChild(crs);
							ctr.appendChild(ctd5);

							let ctd6 = document.createElement("td");
							ctd6.classList.add('d-none');
							let crin6 = document.createElement("input");
							crin6.setAttribute("type", "hidden");
							crin6.setAttribute("name", "AssetsList[" + m
									+ "].compName");
							crin6.setAttribute("value", "${loginVO.compName}");
							ctd6.appendChild(crin6);
							ctr.appendChild(ctd6);

							let ctd7 = document.createElement("td");
							let crin7 = document.createElement("input");
							crin7.setAttribute("type", "text");
							crin7.setAttribute("style", "margin-left:12px;");
							crin7.setAttribute("name", "AssetsList[" + m
									+ "].detail");
							crin7.classList.add("form-control");
							crin7.classList.add("form-control-sm");
							crin7.classList.add("firm_value_form");
							ctd7.appendChild(crin7);
							ctr.appendChild(ctd7);

							rc_table_4.appendChild(ctr);

							m = m + 1;
						})

		const addLedgerBtn = document.querySelector('#addLedgerBtn');
		const revenueForm = document.querySelector('#revenueForm');
		const productCostForm = document.querySelector('#productCostForm');
		addLedgerBtn.addEventListener("click", function() {
			revenueForm.submit();
		})
		
		const closeBtn = document.querySelector('.close_btn');
        const updates = document.querySelector('.updates');

        closeBtn.addEventListener("click", function () {
            updates.classList.add('d-none');
        });
	</script>
</body>
</html>