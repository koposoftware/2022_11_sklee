<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>STARTUPQ</title>
<jsp:include page="/WEB-INF/jsp/include/link.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />

	<section id="main">
        <div id="main_img">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 d-flex flex-column">
                        <h2>HanaBizUp에서 매출과 재무분석하고</h2>
                        <h2>맞춤형 재무전략을 세우세요</h2>
                        <h5>회계정보기반 매출분석 및 기업 대출연계 서비스</h5>
                        <div style="margin-top: 50px;">
                            <a href="${pageContext.request.contextPath}/revenueCost" class="start_btn">시작하기</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <img src="resources/img/finance.svg" class="d-block" alt="...">
                </div>
            </div>
        </div>

        <!-- Main Button -->
        <div class="container" id="main_btn">
            <div class="row">
                <div class="col-md-5 d-flex justify-content-center">
                    <div class="s_btn">
                     <a href="#">회계
                            <img src="resources/img/transfer_g.png" alt="">
                        </a>
                    </div>
                    <div class="s_btn">
                       
                         <a href="#">대출
                            <img src="resources/img/bankbook_g.png" alt="">
                        </a>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-5 d-flex justify-content-center">
                    <div class="m_btn">
                        
                        <div class="m_btn_1">
                            <a href="#">
                                <img src="resources/img/loan.png" alt="">
                                <p>기업대출</p>
                            </a>
                            <a href="#">
                                <img src="resources/img/building1.png" alt="">
                                <p>매출입력</p>
                            </a>
                            <a href="#">
                                <img src="resources/img/factory.png" alt="">
                                <p>비용입력</p>
                            </a>
                        </div>
                        <div class="m_btn_1">
                            <a href="#">
                                <img src="resources/img/balance-sheet.png" alt="">
                                <p>재무분석</p>
                            </a>
                            <a href="#">
                                <img src="resources/img/bar-chart.png" alt="">
                                <p>매출분석</p>
                            </a>
                            <a href="#">
                                <img src="resources/img//alertBell.png" alt="">
                                <p>유동성분석</p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="second">
        <div class="container d-flex justify-content-between" style="margin-top: 50px;">

            <div class="invest"><a href="#" class="d-flex"><img src="resources/img/investor.png" alt="">
                <div style="margin-left:10px;">
                <p class="p1">운전자금 부족 시</p><p class="p2">기업대출</p>
                </div>    
            </a></div>

            <div class="invest"><a href="#" class="d-flex"><img src="resources/img/form.png" alt="">
                <div style="margin-left:10px;">
                <p class="p1">재무제표</p><p class="p2">분기별 받아보기</p>
                </div>    
            </a></div>
            
            <div class="invest"><a href="#" class="d-flex"><img src="resources/img/computer.png" alt="">
                <div style="margin-left:10px;">
                <p class="p1">대출상품</p><p class="p2">한눈에보기</p>
                </div>    
            </a></div>
            <div class="invest"><a href="#" class="d-flex"><img src="resources/img/rocket.png" alt="">
                <div style="margin-left:10px;">
                <p class="p1">내 기업가치는?</p><p class="p2">기업가치 계산기</p>
                </div>    
            </a></div>
        </div>
    </section>

	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/script.jsp" />

</body>
</html>