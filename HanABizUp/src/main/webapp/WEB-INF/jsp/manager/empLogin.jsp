<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- Custom CSS -->
<jsp:include page="/WEB-INF/jsp/include/link.jsp" />
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="stylesheet" href="/resources/css/loan.css">

</head>
<body>

		<jsp:include page="/WEB-INF/jsp/manager/topMenu2.jsp" />
		<jsp:include page="/WEB-INF/jsp/include/loading3.jsp" />
	
		<div class="container1">
		<div class="forms-container">
			<div class="signin-signup">
				<!-- 로그인 -->
				<form:form action="${pageContext.request.contextPath}/empLogin/confirm" method="post" modelAttribute="bankerVO1"
					class="sign-in-form">
					<h1 class="title">로그인</h1>
					<div class="input-field">
						<i class="fas fa-user"></i> 
						<form:input path="empNo" type="text" placeholder="사원번호"/>
					</div>
					<div class="input-field">
						<i class="fas fa-lock"></i> 
						<form:input path="password" type="password" placeholder="비밀번호"/>
					</div>
					<input type="submit" value="로그인" class="btn_login solid">
				</form:form>
			</div>
		</div>

		<div class="panels-container">
			<div class="panel left-panel">
				<div class="content" style="margin-right:40px;">
					<h3 style="color:white !important;">하나금융그룹과 </h3>
					<h3 style="margin-top:15px;">함께 금융전문가로 성장해나가세요</h3>
					<p>오늘 하루도 힘내세요!</p>
				</div>
				<img src="/resources/img/door.svg" class="login_img" alt="">
			</div>
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	 <script src="/resources/js/login.js"></script>
	<jsp:include page="/WEB-INF/jsp/include/script.jsp" />
	<script>
	$(window).on('load', function() {
		setTimeout(removeLoader, 500); //wait for page load PLUS two seconds.
	});

	function removeLoader() {
		$("#loadingDiv").fadeOut(100, function() {
			// fadeOut complete. Remove the loading div
			$("#loadingDiv").remove(); //makes page more lightweight 
		});
	}
	</script>
	
</body>
</html>