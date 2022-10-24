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
<link rel="stylesheet" href="resources/css/login.css">

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
	
		<div class="container1">
		<div class="forms-container">
			<div class="signin-signup">
				<!-- 로그인 -->
				<form:form action="${pageContext.request.contextPath}/login" method="post" modelAttribute="memberVO"
					class="sign-in-form">
					<h1 class="title">로그인</h1>
					<div class="input-field">
						<i class="fas fa-user"></i> 
						<form:input path="id" type="text" placeholder="아이디"/>
					</div>
					<div class="input-field">
						<i class="fas fa-lock"></i> 
						<form:input path="password" type="password" placeholder="비밀번호"/>
					</div>
					<input type="submit" value="로그인" class="btn_login solid">
				</form:form>

				<!-- 회원가입 -->
				<form action=""  method="post" enctype="multipart/form-data"  class="sign-up-form">
					<h2 class="title">회원가입</h2>
					<!-- 아이디 -->
					<div class="input-field">
						<i class="fas fa-user"></i> 
						<input name="id" type="text" placeholder="아이디"/>
					</div>
					<!-- 비밀번호 -->
					<div class="input-field">
						<i class="fas fa-lock"></i> 
						<input name="password" type="password" placeholder="비밀번호"/>
					</div>
					<!-- 이름 -->
					<div class="input-field">
						<i class="fas fa-lock"></i> 
						<input name="name" type="text" placeholder="이름"/>
					</div>
					<!-- 사업자등록증 -->
					<input type="file" name="uploadfile" multiple="multiple"/>
					<input type="submit" value="다음" class="btn_login solid">
				</form>
			</div>
		</div>

		<div class="panels-container">
			<div class="panel left-panel">
				<div class="content">
					<h3 style="color:white !important;">재무 인사이트를 얻으세요!</h3>
					<p>탄탄한 재무정보 분석을 바탕으로 내 기업을 성장시키세요</p>
					<button class="btn_login transparent" id="sign-up-btn">회원가입</button>
				</div>
				<img src="resources/img/door.svg" class="login_img" alt="">
			</div>
			<div class="panel right-panel">
				<div class="content">
					<h3 style="color:white !important;">이미 회원가입 되어 있다면?</h3>
					<p>로그인하고 스타트업큐의 여러 서비스를 누려보세요!</p>
					<button class="btn_login transparent" id="sign-in-btn">로그인</button>
				</div>
				<img src="resources/img/maker_launch.svg" class="login_img" alt="">
			</div>
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	 <script src="resources/js/login.js"></script>
	<jsp:include page="/WEB-INF/jsp/include/script.jsp" />
	
</body>
</html>