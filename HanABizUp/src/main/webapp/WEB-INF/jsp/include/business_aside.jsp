<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside>
	<div class="sidebar1">
		<a href="${pageContext.request.contextPath}/revenueCost" id="side1"
			class="active"><span class="material-icons-sharp">point_of_sale</span>
			<h4>매출 및 비용 등록</h4> </a> <a
			href="${pageContext.request.contextPath}/businessMain" id="side2"><span
			class="material-icons-sharp">bar_chart</span>
			<h4>판매현황</h4> </a> <a href="${pageContext.request.contextPath}/ledger"
			id="side3"><span class="material-icons-sharp">summarize</span>
			<h4>총계정원장</h4> </a>
		<%-- <a
			href="${pageContext.request.contextPath}/equity" id="side4"><span
			class="material-icons-sharp">donut_small</span>
			<h4>자본 관리</h4></a> --%>
	</div>

	<div class="updates">
		<div class="d-flex justify-content-end"
			style="width: 98%; padding-top: 0;">
			<button class="close_btn">
				<span class="material-icons-sharp">close</span>
			</button>
		</div>
		<h4 class="mb-1">기업가치</h4>
		<h4>계산기</h4>
		<p class="mt-2">나의 기업가치를 확인하세요!</p>
		<img src="/resources/img/Calculator-amico.svg" alt=""> <a
			href="${pageContext.request.contextPath}/calFirmValue">바로가기</a>
	</div>

</aside>