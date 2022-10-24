<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside>
	<div class="sidebar1">
		<a href="${pageContext.request.contextPath}/manager/dashboard" id="side1"> <span
			class="material-icons-sharp">approval</span>
			<h4>대출관리</h4>
		</a> <a href="${pageContext.request.contextPath}/manager/viewEvalList"
			id="side2"> <span class="material-icons-sharp">list</span>
			<h4>심사내역</h4>
		</a>
	</div>
	<div class="updates">
		<div class="d-flex justify-content-end"
			style="width: 98%; padding-top: 5px;">
			<button class="close_btn">
				<span class="material-icons-sharp">close</span>
			</button>
		</div>
		<h4>${bankerVO.name} ${bankerVO.rank}님</h4>
		<p class="mt-2 mb-1">오늘 하루도 힘내세요!</p>
		<img src="/resources/img/Cheer up-rafiki.svg" alt=""
			style="width: 150px;">
		<p class="mt-2">다음 월급일까지 D-15일</p>
	</div>
</aside>