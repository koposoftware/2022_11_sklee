<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- HEADER -->
<header class="header-default">
	<div class="container">
		<a href="${pageContext.request.contextPath}/" class="navbar-brand"><img
			src="/resources/img/hanabizuplogo.png" alt=""></a>
	</div>
	<nav class="navbar navbar-expand-lg">
		<div class="container"
			style="margin-bottom: -15px; margin-top: -10px;">
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active1"><a
						href="${pageContext.request.contextPath}/revenueCost"
						class="nav-link">회계관리</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/financeMain"
						class="nav-link">재무분석</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/viewLoanAccount" class="nav-link">대출조회</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/loanProduct" class="nav-link">상품몰</a></li>
				</ul>
			</div>


			<div class="header-right">
				<ul class="nav_sub d-flex">
					<c:choose>
						<c:when test="${empty loginVO }">
							<li class="nav-item"><a
								href="${pageContext.request.contextPath}/signin"
								class="nav-link">로그인</a></li>
							<li class="nav-item"><a href="${pageContext.request.contextPath}/test" class="nav-link">회원가입</a></li>
						</c:when>
						<c:otherwise>
						
							<li class="nav-item"><span style="color:var(--color-hana-green);">${loginVO.compName}님</span> 안녕하세요</li>
							<li class="nav-item"><a
								href="${pageContext.request.contextPath}/logout"
								class="nav-link">로그아웃</a></li>
						</c:otherwise>
					</c:choose>

					<li>|</li>
					<li class="nav-item"><a href="#" class="nav-link">Language</a></li>
					<li class="nav-item"><img src="/resources/img/search1.png"
						alt=""></li>
				</ul>
			</div>
		</div>
	</nav>
</header>