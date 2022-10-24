<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지 </title>
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/06461e5bbe.js"
	crossorigin="anonymous"></script>

<!-- Particles CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link rel="stylesheet" href="/resources/css/particle.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="/resources/css/main2.css">

<!-- Favicon -->
<link rel="icon" type="image/png" href="/resources/img/hanalogo.png">

<!-- Material Icon -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Icons+Sharp" />

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/manager/topMenu2.jsp" />

	<!-- MAIN SECTION -->
	<section id="main">
	<div id="particle-container">
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
			<div class="particle"></div>
		</div>
		
		<div class="container-xl">
			<div class="row">
				<div class="col-md-6 d-flex align-items-center">
					<div id="main_text">
						<h1>
							<span style="color: #008485;">HanaBizUp</span>에서
						</h1>
						<h1 id="letsfind"></h1>
						<p class="text-muted lead mb-4">오늘 하루도 힘차게 보내세요</p>
						<div class="d-flex justify-content-start mb-5"
						style="margin-bottom: 0px;">
						<a href="${pageContext.request.contextPath}/" class="btn_5"><span class="material-icons-sharp" style="margin-right:5px;">arrow_circle_right</span>시작하기</a>
					</div>
					</div>
				</div>
				<div class="col-md-6">
					<img src="/resources/img/9814.jpg" class="d-block w-100" style="margin-top:50px;"
						alt="...">
				</div>
				
			</div>
		</div>
	</section>


	<div class="container d-flex justify-content-end">
	<button id="to_top" onclick="scrollToTop()">
		<span class="material-icons-sharp">keyboard_arrow_up</span>
		<p>TOP</p>
	</button>
</div>

<footer>
	<div class="container" style="width:1200px;">
		<ul class="footer_list">
			<li><a href="#">은행소개</a></li>
			<li>|</li>
			<li><a href="#">영업점찾기</a></li>
			<li>|</li>
			<li><a href="#">개인정보처리방침</a></li>
			<li>|</li>
			<li><a href="#">그룹사간 고객정보 제공내역</a></li>
			<li>|</li>
			<li><a href="#">퇴직연금공시</a></li>
			<li>|</li>
			<li><a href="#">웹접근성 안내</a></li>
			<li>|</li>
			<li><a href="#">기업뱅킹 가이드</a></li>
			<li>|</li>
			<li><a href="#">원격지원상담</a></li>
			<li>|</li>
			<li><a href="#">고객센터</a></li>
		</ul>

		<div>
			<ul id="firm_addr">
				<li>기업뱅킹상담</li>
				<li>1599-1111, 1588-1111 (단축코드 0 > 5)</li>
				<li>+82-42-520-2500 (해외)</li>
				<div id="other_firm">
					<select class="form-select-custom">
						<option selected>STARTUPQ</option>
						<option value="1">하나금융티아이</option>
						<option value="2">하나은행</option>
						<option value="3">하나증권</option>
						<option value="4">하나카드</option>
					</select>
				</div>
			</ul>
			<div class="firm_copy">Copyright &copy; STARTUPQ. ALL RIGHTS
				RESERVED.</div>
		</div>
	</div>
</footer>

<script>
	function scrollToTop() {
		window.scrollTo(0, 0);
	}
</script>
	<!-- javascripts  -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


	<!-- typeIt -->
	<script src="https://unpkg.com/typeit@8.7.0/dist/index.umd.js"></script>
	<script>
		new TypeIt("#letsfind", {
			strings :"하나금융그룹과 함께 성장합시다!",
			speed : 100,
			waitUntilVisible : true,
		}).go();

	</script>

	<!-- Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>

</html>