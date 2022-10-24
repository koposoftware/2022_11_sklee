<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- HEADER -->
<header class="header-default"
	style="border-bottom: 2px solid #f2f1f6a3;">
	<nav class="navbar navbar-expand-lg">
		<div class="container-xl manager_header" style="width: 1200px;">
			<div class="d-flex">
				<a href="${pageContext.request.contextPath}/manager"
					class="navbar-brand"><img src="/resources/img/hanabizuplogo.png" style="width:240px !important;"
					alt=""></a>
				<div class="collapse navbar-collapse">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active1"><a href="${pageContext.request.contextPath}/manager/dashboard"
						class="nav-link">대출심사 </a></li>
				</ul>
			</div>
			</div>
			<div class="right">
				<c:choose>
					<c:when test="${empty bankerVO }">
						<div class="header-buttons">
							<a href="${pageContext.request.contextPath}/empLogin">로그인</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="profile" style="width: 100%;">
							<div class="info">
								<p>
									<b>${bankerVO.name }</b> ${bankerVO.rank }님
								</p>
								<span>환영합니다</span>
							</div>
							<div class="profile-photo">
								<img src="/resources/img/1647236336236.jpg" alt="">
							</div>
							<div class="d-flex justify-content-center align-items-center">
								<a href="${pageContext.request.contextPath}/empLogin/logout">
									<span class="material-icons-sharp">logout</span>
								</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>
</header>