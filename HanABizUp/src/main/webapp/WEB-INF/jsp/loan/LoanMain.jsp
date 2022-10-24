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
<title>STARTUPQ | 재무분석</title>
<jsp:include page="/WEB-INF/jsp/include/link.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/loading3.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="/WEB-INF/jsp/include/loan_aside.jsp" />
			</div>

			<!-- 대시보드 메인 -->
			<div class="col-md-10 dashboard_main">
			
			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/script.jsp" />

	<script>
		const side1 = document.querySelector('#side1');
		const side2 = document.querySelector('#side2');

		let sideArr = [ side1, side2 ];

		for (let i = 0; i < sideArr.length; i++) {
			if (sideArr[i].classList.contains('active')) {
				sideArr[i].classList.remove('active')
			}
		}

		sideArr[0].classList.add('active');
		
		$(window).on('load', function() {
			setTimeout(removeLoader, 500); //wait for page load PLUS two seconds.
		});

		function removeLoader() {
			$("#loadingDiv").fadeOut(100, function() {
				// fadeOut complete. Remove the loading div
				$("#loadingDiv").remove(); //makes page more lightweight 
			});
		}

		const closeBtn = document.querySelector('.close_btn');
		const updates = document.querySelector('.updates');

		closeBtn.addEventListener("click", function() {
			updates.classList.add('d-none');
		});

		$(document).ready(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/calFirmValue/result',
				type : 'get',
				success : function(data) {
					console.log(data)
				}

			})
		})
	</script>
</body>
</html>