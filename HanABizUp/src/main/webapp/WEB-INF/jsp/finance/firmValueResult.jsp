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
	<jsp:include page="/WEB-INF/jsp/include/loading4.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="/WEB-INF/jsp/include/finance_aside.jsp" />
			</div>

			<!-- 대시보드 메인 -->
			<div class="col-md-10 dashboard_main">
			    <div class="dashboard_content mb-5">
                    <div class="dashboard_header">
                        <h2>기업가치 계산결과</h2>
                        <span>모의계산</span>
                    </div>

                    <div class="firm_cal_notice_2">
                        <div class="d-flex flex-column justify-content-center">
                            <p>* 기업잉여현금흐름(FCFF)모형을 이용해 계산한 결과입니다.</p>
                            <p>* 최저 기업가치는 매년 감가상각비만큼 영업자산에 재투자 가정했습니다.</p>
                            <p>* 최고 기업가치는 일정기간 이후부터 안정성장률로 영구히 성장한다고 가정했습니다.</p>
                        </div>
                    </div>

                    <div class="cal_firm_value">
                        <div class="d-flex flex-column align-items-center">
                            <h1>${loginVO.compName}의 기업가치는</h1>
                            <h1><span style="color:#E90061;" id="firmValueResult"></span> 으로 추정됩니다</h1>
                            <p>(가중평균자본비용은 <span style="color:#E90061;" id="waccResult"></span> 입니다)</p>
                        </div>
                    </div>

                    <div class="d-flex justify-content-end mt-3" style="margin-bottom: 0px;">
                        <a href="${pageContext.request.contextPath}/calFirmValue" class="btn_2"><span class="material-icons-sharp" style="margin-right: 5px">arrow_back</span>다시 계산하기</a>
                    </div>

                </div>
			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/script.jsp" />

	<script>
		const side1 = document.querySelector('#side1');
		const side2 = document.querySelector('#side2');

		let sideArr = [ side1, side2];

		for (let i = 0; i < sideArr.length; i++) {
			if (sideArr[i].classList.contains('active')) {
				sideArr[i].classList.remove('active')
			}
		}

		sideArr[1].classList.add('active');
		
		$(window).on('load', function() {
			setTimeout(removeLoader, 2000); //wait for page load PLUS two seconds.
		});

		function removeLoader() {
			$("#loadingDiv").fadeOut(300, function() {
				// fadeOut complete. Remove the loading div
				$("#loadingDiv").remove(); //makes page more lightweight 
			});
		}

		const closeBtn = document.querySelector('.close_btn');
		const updates = document.querySelector('.updates');

		closeBtn.addEventListener("click", function() {
			updates.classList.add('d-none');
		});
		
		const firmValueResult = document.querySelector('#firmValueResult');
		const waccResult = document.querySelector('#waccResult');
		
		$(document)
		.ready(
				function() {
					$
							.ajax({
								url : '${pageContext.request.contextPath}/calFirmValue/result',
								type : 'get',
								success : function(data) {
									console.log(parseFloat(data.wacc))
								firmValueResult.innerText =  (data.firmValHigh/100000000).toLocaleString('en-US') + '억 원 ';
								waccResult.innerText = Math.round((parseFloat(data.wacc)*100)) + '%';

								}

							})
				})
	</script>
</body>
</html>