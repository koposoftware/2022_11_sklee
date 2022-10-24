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
				<div class="dashboard_content mb-5">
					<div id="itemBanner">
						<div class="bannerText">
							<div class="firmPill2">기업대출</div>
								<h4 id="loanTitle"></h4>
								<p id="loanSummary"></p>
								<div id="loanProductDetail"></div>
								<div class="d-flex mb-3">
									<a href="${pageContext.request.contextPath}/applyLoan/${loanProductCode}" class="btn_1">
										<span class="material-icons-sharp" style="margin-right: 10px;">approval</span>대출신청
									</a>
								</div>
						</div>
						<div class="bannerImg">
							<img src="/resources/img/Finance leaders-rafiki.svg" alt="">
						</div>
					</div>

					<div id="loanMain">
						<h6>대출대상</h6>
						<p id="qualification"></p>

						<h6>대출금리</h6>
						<div>
							<table class="tblBasic small"
								summary="2022.04.25 기준, 기본금리, 기준금리, 가산금리로 구성된 표입니다.">
								<caption>대출금리 상세</caption>
								<colgroup>
									<col width="16.66%">
									<col width="16.66%">
									<col width="16.66%">
									<col width="16.66%">
									<col width="16.66%">
									<col width="16.66%">
								</colgroup>
								<tbody>
									<tr>
										<th class="tc" colspan="3" scope="col">2022.04.25 기준</th>
										<th class="tc" scope="col">기본금리</th>
										<th class="tc" scope="col">기준금리</th>
										<th class="tc" scope="col">가산금리</th>
									</tr>
									<tr>
										<td class="tc" rowspan="4">운전/시설자금대출</td>
										<td class="tc" rowspan="2">운전자금</td>
										<td class="tc">최저금리(A1)</td>
										<td class="tc">6.135%</td>
										<td class="tc">2.965%</td>
										<td class="tc">3.17%</td>
									</tr>
									<tr>
										<td class="tc">취급가능등급 최고금리(B6)</td>
										<td class="tc">13%</td>
										<td class="tc">2.965%</td>
										<td class="tc">10.035%</td>
									</tr>
									<tr>
										<td class="tc" rowspan="2">시설자금</td>
										<td class="tc">최저금리(A1)</td>
										<td class="tc">5.785%</td>
										<td class="tc">2.965%</td>
										<td class="tc">2.82%</td>
									</tr>
									<tr>
										<td class="tc">취급가능등급 최고금리(B6)</td>
										<td class="tc">13%</td>
										<td class="tc">2.965%</td>
										<td class="tc">10.035%</td>
									</tr>
								</tbody>
							</table>
							<ul class="orderListDot">
								<li>운전자금, 대출금액 1억, 대출기간 1년, 1년 고정금리 기준, 전액 신용, 만기일시상환을 가정하여
									산정한 것으로, 실제 대출 취급 시 대출 대상 기업의 신용등급, 담보비율 등의 요소에 따라 달라질 수 있습니다</li>
								<li>기본금리 = 기준금리 + 가산금리</li>
								<li>기준금리는 CD 3개월물, 금융채 6개월, 금융채 1년, 단기 코픽스 금리, 기간별 고정금리 중
									선택 가능합니다</li>
								<li>가산금리는 신용등급, 대출기간, 담보, 대출금액 등에 따라 차등적용됩니다.</li>
								<li>연체이자율은 [대출이자율+연체가산이율]로 적용 / 연체가산이율은 연 3%, 연체이자율은 최고 연
									15% 적용됩니다.</li>
								<li>대부업 등의 등록 및 금융이용자 보호에 관한 법률에 따른 법정최고금리는 연 20%입니다.</li>
							</ul>
						</div>


						<h6>대출한도</h6>
						<div>
							은행이 정한 운전자금 가용한도 범위 내 <br> ※ 운전자금 가용한도 = 1회전 소요운전자금 – 금융기관
							총차입액 <br> 1회전 소요운전자금 = (연간 추정매출액 － 추정감가상각비) × 1회전기간/365
						</div>

						<h6>대출기간</h6>
						<div>
							<ul class="orderListDot">
								<li>일시상환 : 3년 이내</li>
								<li>분할상환 : 5년 이내</li>
							</ul>
						</div>

						<h6>이자계산방법</h6>
						<div>
							<ul class="orderListDot">
								<li>대출금에 연이율과 대출일수를 곱한 후 이를 365일(윤년인 경우 366일)로 나누어 산출하되 원단위
									미만은 절사 <br> 원리금균등분할상환대출의 월별이자 계산은 대출원금에 연이율을 곱한 다음 12로 나누어
									계산 <br> 일수계산은 여신당일로부터 기일 또는 상환일(일부상환 및 분할상환 포함) 전일까지로
									한다.(한편넣기) <br> 위 내용에도 불구하고 다음의 여신은 여신당일부터 기일 또는 상환일까지로 한다.
									<br> 1. 대출 당일에 회수되는 대출금 / 2. 대외기관으로부터 자금을 차입하는 대출금으로서 이자를
									상환일까지 지급하는 대출금 / <br> 3. 연체기간이 1일인 연체대출채권 및 지급보증대지급금 / 4.
									대여유가증권
								</li>
								<li>원금 균등분할상환대출 : 대출금액 x 대출이자율 x 이자일수 ÷ 365(윤년은 366일)</li>
							</ul>
						</div>

						<h6>원금 또는 이자의 상환시기 및 방법</h6>
						<div>
							<ul class="orderListDot">
								<li>건별대출(만기일시상환) : 원금은 만기에 일시상환, 이자는 일정주기(매1개월 등) 단위로 납부</li>
								<li>분할상환대출 : 분할상환원금 및 이자를 일정주기(매1개월 등)단위로 납부</li>
								<li>대출실행 응당일/별도지정일에 대출금 입금계좌/자동등록계좌에서 자동이체 처리</li>
								<li>고객님께서 선택하시는 대출방식 및 상품별로 원금/이자의 상환시기 및 방법이 일부 상이할 수
									있으므로, 대출취급시 <br> 작성하시는 대출거래약정서의 상환방법 및 이자지급방법 내용을 참조하여 주시기
									바랍니다.
								</li>
							</ul>
						</div>



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

		let sideArr = [ side1 ];

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
				url : '${pageContext.request.contextPath}/loanProduct/Detail/' + "${loanProductCode}",
				type : 'get',
				success : function(data) {
					console.log(data);
					
					const loanTitle = document.querySelector('#loanTitle');
					$('#loanTitle').empty();
					
					const loanSummary = document.querySelector('#loanSummary');
					$('#loanSummary').empty();
					
					const qualification = document.querySelector('#qualification');
					$('#qualification').empty();
					
					loanTitle.innerText = data.detail;
					loanSummary.innerText = data.summary;
					qualification.innerText = data.qualification;
				}

			})
		})
	</script>
</body>
</html>