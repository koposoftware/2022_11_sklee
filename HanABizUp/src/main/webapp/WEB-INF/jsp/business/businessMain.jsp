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
<title>STARTUPQ | 회사관리</title>
<jsp:include page="/WEB-INF/jsp/include/link.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/loading3.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="/WEB-INF/jsp/include/business_aside.jsp" />
			</div>
			<div class="col-md-10 dashboard_main">
				<div class="dashboard_content">
					<div class="dashboard_header">
						<h2>
							<span style="font-size: 25px; color: var(--color-black-matt);"
								id="currentMonthView"></span>월 판매 현황
						</h2>
					</div>

					<div class="d-flex justify-content-start mb-3 mt-4">
						<form>
							<input type="month" value="2022-10" class="month_select"
								id="select_month">
						</form>
					</div>
					<div class="bs_top1">
						<div class="top1 green_bg">
							<div class="d-flex align-items-center">
								<div class="top1_icon">
									<span class="material-icons-sharp">pie_chart</span>
								</div>
							</div>
							<div class="d-flex justify-content-between">
								<div class="top1_text">
									<h4>매출액</h4>
									<p id="currentSales"></p>
									<h5 id="diffSales"></h5>
								</div>
								<div class="progress1"></div>
							</div>
						</div>
						<div class="top1 red_bg">
							<div class="d-flex align-items-center ">
								<div class="top1_icon"
									style="background-color: white; color: #F67280;">
									<span class="material-icons-sharp">analytics</span>
								</div>
							</div>
							<div class="d-flex justify-content-between">
								<div class="top1_text">
									<h4>매출원가</h4>
									<p id="currentCost"></p>
									<h5 id="diffCost"></h5>
								</div>
								<div class="progress1"></div>
							</div>
						</div>
						<div class="top1 purple_bg">
							<div class="d-flex align-items-center ">
								<div class="top1_icon"
									style="background-color: white; color: #8675A9;">
									<span class="material-icons-sharp">bar_chart</span>
								</div>
							</div>
							<div class="d-flex justify-content-between mb-1">
								<div class="top1_text">
									<h4>연간 총매출액</h4>
									<p id="yearlySales"></p>
									<h5>2022년 총 매출액입니다</h5>
								</div>
							</div>
						</div>

					</div>
					<div class="middle1_head" style="margin-top: 70px;">
						<h4 class="middle_head">
							<span style="font-size: 20px; color: var(--color-black-matt);"
								id="currentMonthView"></span>월 상품별 판매량
						</h4>
					</div>
					<div></div>
					<div id="myChart2"></div>
					<div class="middle1">

						<div>
							<div class="middle1_head">
								<h4 class="middle_head">누적 상품 판매량 순위</h4>
								<span><span id="currentDateView"></span> 기준</span>
							</div>
							<div class="middle1_boxes mt-1">
								<div class="middle1_box">
									<div class="d-flex align-items-center">
										<div class="middle1_icon">
											<span class="material-icons-sharp">looks_one</span>
										</div>
									</div>
									<div class="middle1_text">
										<h4 id="product_1_name"></h4>
										<span id="product_1_sold"></span>
										<p id="product_1_cost"></p>
									</div>
								</div>
								<div class="middle1_box">
									<div class="d-flex align-items-center">
										<div class="middle1_icon" style="background-color: #f2d0a9;">
											<span class="material-icons-sharp">looks_two</span>
										</div>
									</div>
									<div class="middle1_text">
										<h4 id="product_2_name"></h4>
										<span id="product_2_sold"></span>
										<p id="product_2_cost"></p>
									</div>
								</div>
								<div class="middle1_box">
									<div class="d-flex align-items-center">
										<div class="middle1_icon" style="background-color: #f1e3d3;">
											<span class="material-icons-sharp">looks_3</span>
										</div>
									</div>
									<div class="middle1_text">
										<h4 id="product_3_name"></h4>
										<span id="product_3_sold"></span>
										<p id="product_3_cost"></p>
									</div>
								</div>
							</div>
						</div>
						<div>
							<div class="middle1_head">
								<h4 class="middle_head">누적 상품판매 비율</h4>
								<span><span id="currentDateView"></span> 기준</span>
							</div>
							<div id="myChart"></div>
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
		const side3 = document.querySelector('#side3');

		let sideArr = [ side1, side2, side3];

		for (let i = 0; i < sideArr.length; i++) {
			if (sideArr[i].classList.contains('active')) {
				sideArr[i].classList.remove('active')
			}
		}

		sideArr[1].classList.add('active')

		let currentMonth = new Date().getMonth() + 1;
		let currentYear = new Date().getFullYear();
		let monthVal = '';
		if (currentMonth < 10) {
			monthVal = currentYear + '-0' + currentMonth;
		} else {
			monthVal = currentYear + '-' + currentMonth;
		}

		let currentMonthViews = document.querySelectorAll('#currentMonthView');
		for (let i = 0; i < currentMonthViews.length; i++) {
			currentMonthViews.item(i).innerText = currentMonth;
		}

		let currentDate = new Date().getDate();
		let today = currentYear + '.' + currentMonth + '.' + currentDate;
		let currentDateView = document.querySelectorAll('#currentDateView');
		for (let i = 0; i < currentDateView.length; i++) {
			currentDateView.item(i).innerText = today;
		}

		let data1 = [];
		let data2 = [];

		
		const product_1_name = document.querySelector('#product_1_name');
		const product_1_sold = document.querySelector('#product_1_sold');
		const product_1_cost = document.querySelector('#product_1_cost');
		
		const product_2_name = document.querySelector('#product_2_name');
		const product_2_sold = document.querySelector('#product_2_sold');
		const product_2_cost = document.querySelector('#product_2_cost');
		
		const product_3_name = document.querySelector('#product_3_name');
		const product_3_sold = document.querySelector('#product_3_sold');
		const product_3_cost = document.querySelector('#product_3_cost');
		
		const product_name = [product_1_name, product_2_name, product_3_name];
		const product_sold = [product_1_sold, product_2_sold, product_3_sold];
		const product_cost = [product_1_cost, product_2_cost, product_3_cost];
		
		
		$(window).on('load', function() {
			setTimeout(removeLoader, 500); //wait for page load PLUS two seconds.
		});

		function removeLoader() {
			$("#loadingDiv").fadeOut(100, function() {
				// fadeOut complete. Remove the loading div
				$("#loadingDiv").remove(); //makes page more lightweight 
			});
		}
		
		const currentSales = document.querySelector('#currentSales');
		const currentCost = document.querySelector('#currentCost');
		const yearlySales = document.querySelector('#yearlySales');
		const diffSales = document.querySelector('#diffSales');
		const diffCost = document.querySelector('#diffCost');
		
		$(document)
				.ready(
						function() {
							$
									.ajax({
										url : '${pageContext.request.contextPath}/businessMain/productStat',
										data : {
											month : monthVal,
										},
										type : 'get',
										success : function(data) {
											/* console.log(data) */
											for (let i = 0; i < data.length; i++) {
												let data11 = [];
												data11
														.push(data[i].productName);
												data11
														.push(parseInt(data[i].productSold));
												data1.push(data11);
											}
											/* console.log(data1); */

											// Chart2
											Highcharts
													.chart(
															'myChart2',
															{
																chart : {
																	type : 'column'
																},
																title : {
																	align : 'center',
																	text : ''
																},
																accessibility : {
																	announceNewData : {
																		enabled : true
																	}
																},
																xAxis : {
																	type : 'category'
																},
																yAxis : {
																	title : {
																		text : '판매수량'
																	}

																},
																legend : {
																	enabled : false
																},
																plotOptions : {
																	series : {
																		borderWidth : 0,
																		dataLabels : {
																			enabled : true,
																			format : '{point.y}'
																		}
																	}
																},
																colors : [
																		'#d88c9a',
																		'#f2d0a9',
																		'#f1e3d3',
																		'#99c1b9',
																		'#8e7dbe',
																		'#f79256',
																		'#fbd1a2' ],
																series : [ {
																	name : "판매량",
																	colorByPoint : true,
																	data : data1
																} ]
															});
											/* 끝 */

										}

									})

							$
									.ajax({
										url : '${pageContext.request.contextPath}/businessMain/productList',
										type : 'get',
										success : function(data) {
											console.log(data)
											for (let i = 0; i < data.length; i++) {
												let data11 = [];
												data11
														.push(data[i].productName);
												data11
														.push(parseInt(data[i].productSold));
												data2.push(data11);
											}
											
											for(let i = 0; i < 3; i++){
												product_name[i].innerText = data[i].productName;
												product_sold[i].innerText = parseInt(data[i].productSold).toLocaleString('en-US') + '개';
												product_cost[i].innerText = '생산원가 : ' + parseInt(data[i].productCost).toLocaleString('en-US') + '원';
											}
											
											// Highchart
											Highcharts
													.chart(
															"myChart",
															{
																chart : {
																	plotBackgroundColor : null,
																	plotBorderWidth : null,
																	plotShadow : false,
																	type : "pie",
																	width : 500,
																	height : 320,
																},
																title : {
																	text : "",
																},
																tooltip : {
																	pointFormat : "{series.name}: <b>{point.percentage:.1f}%</b>",
																},
																accessibility : {
																	point : {
																		valueSuffix : "%",
																	},
																},
																plotOptions : {
																	pie : {
																		allowPointSelect : true,
																		cursor : "pointer",
																		dataLabels : {
																			enabled : true,
																			format : "<b>{point.name}</b>: {point.percentage:.1f} %",
																		},
																	},
																},
																colors : [ '#d88c9a', '#f2d0a9', '#f1e3d3',
																		'#99c1b9', '#8e7dbe', '#f79256', '#fbd1a2' ],
																series : [ {
																	name : "판매비율",
																	colorByPoint : true,
																	data : data2
																		,
																}, ],
															});
											
										}

									})
									
									$
									.ajax({
										url : '${pageContext.request.contextPath}/businessMain/salesStat',
										data : {
											month : selectMonth.value,
										},
										type : 'get',
										success : function(data) {
											console.log(data)
										
											currentSales.innerText = data.currentSales.toLocaleString('en-US') + '원';
											currentCost.innerText = data.currentCost.toLocaleString('en-US') + '원';
											yearlySales.innerText = data.yearlySales.toLocaleString('en-US') + '원';
											diffSales.innerText = '전월대비 +' + (data.currentSales - data.recentSales).toLocaleString('en-US') + '원';
											diffCost.innerText = '전월대비 +' + (data.currentCost - data.recentCost).toLocaleString('en-US') + '원';
											/* 끝 */

										}

									})
						})

		const selectMonth = document.getElementById('select_month');
		selectMonth
				.addEventListener(
						"change",
						function() {
							/* console.log(selectMonth.value.substring(5, 6)); */
							if (selectMonth.value.substring(5, 6) == 0) {
								currentMonth = selectMonth.value
										.substring(6, 7);
							} else {
								currentMonth = selectMonth.value
										.substring(5, 7);
							}
							let currentMonthViews = document
									.querySelectorAll('#currentMonthView');
							for (let i = 0; i < currentMonthViews.length; i++) {
								currentMonthViews.item(i).innerText = currentMonth;
							}

							$
									.ajax({
										url : '${pageContext.request.contextPath}/businessMain/productStat',
										data : {
											month : selectMonth.value,
										},
										type : 'get',
										success : function(data) {
											data1 = [];
											/* console.log(data) */
											for (let i = 0; i < data.length; i++) {
												let data11 = [];
												data11
														.push(data[i].productName);
												data11
														.push(parseInt(data[i].productSold));
												data1.push(data11);
											}
											/* console.log(data1); */

											// Chart2
											Highcharts
													.chart(
															'myChart2',
															{
																chart : {
																	type : 'column'
																},
																title : {
																	align : 'center',
																	text : ''
																},
																accessibility : {
																	announceNewData : {
																		enabled : true
																	}
																},
																xAxis : {
																	type : 'category'
																},
																yAxis : {
																	title : {
																		text : '판매수량'
																	}

																},
																legend : {
																	enabled : false
																},
																plotOptions : {
																	series : {
																		borderWidth : 0,
																		dataLabels : {
																			enabled : true,
																			format : '{point.y}'
																		}
																	}
																},
																colors : [
																		'#d88c9a',
																		'#f2d0a9',
																		'#f1e3d3',
																		'#99c1b9',
																		'#8e7dbe',
																		'#f79256',
																		'#fbd1a2' ],
																series : [ {
																	name : "판매량",
																	colorByPoint : true,
																	data : data1
																} ]
															});
											/* 끝 */

										}

									})
									
									$
									.ajax({
										url : '${pageContext.request.contextPath}/businessMain/salesStat',
										data : {
											month : selectMonth.value,
										},
										type : 'get',
										success : function(data) {
											console.log(data)
										
											currentSales.innerText = data.currentSales.toLocaleString('en-US') + '원';
											currentCost.innerText = data.currentCost.toLocaleString('en-US') + '원';
											yearlySales.innerText = data.yearlySales.toLocaleString('en-US') + '원';
											diffSales.innerText = '전월대비 +' + (data.currentSales - data.recentSales).toLocaleString('en-US') + '원';
											diffCost.innerText = '전월대비 +' + (data.currentCost - data.recentCost).toLocaleString('en-US') + '원';
											/* 끝 */

										}

									})
						})
	</script>
</body>
</html>