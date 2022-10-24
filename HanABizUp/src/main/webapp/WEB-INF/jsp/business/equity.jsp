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

	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="/WEB-INF/jsp/include/business_aside.jsp" />
			</div>
			<div class="col-md-10 dashboard_main">
				<div class="dashboard_content">
					<div class="dashboard_header">
						<h2>자본변동사항</h2>
					</div>

					<div class="dashboard_notice">
						<p></p>
					</div>

					<form:form action="" commandName="revenueVO" id="revenueForm">
						<!-- 증자 입력 -->
						<div class="rc_head" id="revenue">
							<h4>증자</h4>
							<div class="d-flex justify-content-between"
								style="margin-bottom: 2px;">
								<span class="explain_1"><span style="color: red;">*</span>증자,
									감자 등 주식거래 사항을 입력해주세요</span>

								<div class="d-flex" style="margin-bottom: 0px;">
									<button class="btn_1" type="button"><span class="material-icons-sharp" style="margin-right: 5px;">emoji_people</span>주주목록</button>
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
									<th width="13%">일자</th>
									<th width="15%">거래항목</th>
									<th width="13%">판매총금액</th>
									<th width="8%">판매수량</th>
									<th width="10%">지급방식</th>
									<th width="20%">비고</th>

								</tr>
								<tbody id="rc_table_1">
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form" name=""
											placeholder="YYYY-MM-DD"></td>
										<td><select
											class="form-select form-select-sm text-center firm_select_form"
											id="productList" name="">
										</select></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form" name=""></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form" name=""></td>
										<td class="d-none"><input type="hidden" name=""
											value="${loginVO.compName}"></td>
										<td><select
											class="form-select form-select-sm text-center firm_select_form"
											name="">
												<option value="M001">현금</option>
												<option value="M002">매출채권</option>
										</select></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form" name=""></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 증자 끝 -->

						<!-- 배당 입력 -->
						<div class="rc_head" id="revenue">
							<h4>배당</h4>
							<div class="d-flex justify-content-between"
								style="margin-bottom: 2px;">
								<span class="explain_1"><span style="color: red;">*</span>증자,
									감자 등 주식거래 사항을 입력해주세요</span>

								<div class="d-flex" style="margin-bottom: 0px;">
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
									<th width="13%">일자</th>
									<th width="15%">거래항목</th>
									<th width="13%">판매총금액</th>
									<th width="8%">판매수량</th>
									<th width="10%">지급방식</th>
									<th width="20%">비고</th>

								</tr>
								<tbody id="rc_table_1">
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form" name=""
											placeholder="YYYY-MM-DD"></td>
										<td><select
											class="form-select form-select-sm text-center firm_select_form"
											id="productList" name="">
										</select></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form" name=""></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form" name=""></td>
										<td class="d-none"><input type="hidden" name=""
											value="${loginVO.compName}"></td>
										<td><select
											class="form-select form-select-sm text-center firm_select_form"
											name="">
												<option value="M001">현금</option>
												<option value="M002">매출채권</option>
										</select></td>
										<td><input type="text"
											class="form-control form-control-sm firm_value_form" name=""></td>
									</tr>
								</tbody>
							</table>
							<div class="d-flex justify-content-end mt-3"
								style="margin-bottom: 0;">
								<button class="btn_2" id="addLedgerBtn">등록하기</button>
							</div>
						</div>
						<!-- 매출 끝 -->
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

		let sideArr = [ side1, side2, side3];

		for (let i = 0; i < sideArr.length; i++) {
			if (sideArr[i].classList.contains('active')) {
				sideArr[i].classList.remove('active')
			}
		}

		sideArr[0].classList.add('active')
		
		const closeBtn = document.querySelector('.close_btn');
        const updates = document.querySelector('.updates');

        closeBtn.addEventListener("click", function () {
            updates.classList.add('d-none');
        });
	</script>
</body>
</html>