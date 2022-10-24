<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside>
	<div class="sidebar1">
		<a href="${pageContext.request.contextPath}/financeMain" id="side1"> <span class="material-icons-sharp">bar_chart</span>
			<h4>재무분석</h4>
		</a> <a href="${pageContext.request.contextPath}/calFirmValue" id="side2"> <span class="material-icons-sharp">military_tech</span>
			<h4>기업가치계산</h4>
		</a>
	</div>
	<div class="updates">
		<div class="d-flex justify-content-end"
			style="width: 98%; padding-top: 5px;">
			<button class="close_btn">
				<span class="material-icons-sharp">close</span>
			</button>
		</div>
		<h4>기업대출</h4>
		<p class="mt-2">운전자금 대출을 신청하세요</p>
		<img src="resources/img/Consultative sales-bro.svg" alt=""
			style="width: 150px;"> <a href="${pageContext.request.contextPath}/loanProduct" style="margin: 20px;">바로가기</a>
	</div>
</aside>