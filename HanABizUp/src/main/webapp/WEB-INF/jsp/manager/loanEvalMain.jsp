<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>대출심사</title>
<jsp:include page="/WEB-INF/jsp/include/link.jsp" />
<link rel="stylesheet" href="/resources/css/loan.css">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/manager/topMenu2.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/loading3.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="/WEB-INF/jsp/manager/manager_aside.jsp" />
			</div>

			<!-- 대시보드 메인 -->
			<div class="col-md-10 dashboard_main">
				<div class="dashboard_content">
					<div class="dashboard_header">
						<h2>대출관리</h2>
					</div>

					<div class="bs_top">

						<div class="top">
							<div class="d-flex justify-content-around">
								<div class="d-flex justify-content-center align-items-center">
									<div class="top_icon2" style="background-color: #0C6170;">
										<span class="material-icons-sharp">approval</span>
									</div>
								</div>
								<div class="top_text2">
									<h4>심사 진행중</h4>
									<span>신규신청 + 심사중 대출</span>
									<h3>${loanEvalVO.evalLoan }건</h3>
								</div>
							</div>
						</div>
						<div class="top">
							<div class="d-flex justify-content-around">
								<div class="d-flex justify-content-center align-items-center">
									<div class="top_icon2" style="background-color: #37BEB0">
										<span class="material-icons-sharp">account_balance</span>
									</div>
								</div>
								<div class="top_text2">
									<h4>누적 승인금액</h4>
									<span>승인 또는 상환된 대출 기준</span>
									<h3>
										<fmt:formatNumber type="number" maxFractionDigits="3"
											value="${loanEvalVO.evalAmount }" />
										만원
									</h3>
								</div>
							</div>
						</div>
						<div class="top">
							<div class="d-flex justify-content-around">
								<div class="d-flex justify-content-center align-items-center">
									<div class="top_icon2" style="background-color: #A4E5E0;">
										<span class="material-icons-sharp">list</span>
									</div>
								</div>
								<div class="top_text2">
									<h4>누적 심사완료</h4>
									<span>심사완료 + 상환완료</span>
									<h3>${loanEvalVO.evalSum }건</h3>
								</div>
							</div>
						</div>



					</div>
					
					<!-- Progress bar -->
					<div class="progressbar" style="margin-top: 70px;">
						<div class="progress" id="progress"></div>

						<button class="progress-step progress-step-active" data-bs-toggle="tooltip" id="step1"
							data-bs-title="${loanEvalVO.step1 }건" data-bs-placement="top"
							data-bs-custom-class="custom-tooltip3" onclick="javascript:evalLoan2('LP001', '', '0', '신규신청')">신규신청</button>
							<button class="progress-step" data-bs-toggle="tooltip" id="step2"
							data-bs-title="${loanEvalVO.step2 }건" data-bs-placement="top"
							data-bs-custom-class="custom-tooltip3" onclick="javascript:evalLoan2('LP002', '', '1', '심사중')">심사중</button>
						<button class="progress-step" data-bs-toggle="tooltip" id="step3"
							data-bs-title="${loanEvalVO.step3 }건" data-bs-placement="top"
							data-bs-custom-class="custom-tooltip3" onclick="javascript:evalLoan2('LP003', 'LP004', '2', '심사완료')">심사완료</button>
						<button class="progress-step" data-bs-toggle="tooltip" id="step4"
							data-bs-title="${loanEvalVO.step4 }건" data-bs-placement="top"
							data-bs-custom-class="custom-tooltip3" onclick="javascript:evalLoan2('LP005', '','3', '상환완료')">상환완료</button>
					</div>

					<div class="middle2" style="margin-top: 50px;">
						<div class="middle2_head">
							<div class="d-flex justify-content-end align-items-end">
								<h4 class="middle_head" id="stepText">심사완료</h4>
							</div>
							<div class="d-flex justify-content-end"
								style="width: 40%; margin-bottom: 8px;">
								<form class="d-flex" role="search" id="searchLoanForm">
									<input class="form-control me-2" type="search" placeholder="검색"
										aria-label="Search">
									<button class="btn_1" type="submit">
										<span class="material-icons-sharp">search</span>
									</button>
								</form>
							</div>
						</div>
						<table class="table loan_eval_table table-hover">
							<thead>
								<tr>
									<th width="3%">#</th>
									<th width="10%">신청기업</th>
									<th width="8%">신청일자</th>
									<th width="18%">대출종류</th>
									<th width="8%">대출금액</th>
									<th width="8%">담당자</th>
									<th width="6%">진행상황</th>
								</tr>
							</thead>
							<tbody id="loanList3">
							</tbody>
						</table>
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
		
		
		const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
		
       
       function openBS(evt, BS) {
            // Declare all variables
            var i, tabcontent, tablinks;

            // Get all elements with class="tabcontent" and hide them
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }

            // Get all elements with class="tablinks" and remove the class "active"
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }

            // Show the current tab, and add an "active" class to the button that opened the tab
            document.getElementById(BS).style.display = "block";
            evt.currentTarget.className += " active";
        }
       
       function evalLoan(loanNo) {
			console.log(loanNo)
           location.href = "${pageContext.request.contextPath}/manager/detail/" + loanNo;
        }

		
       $(document).ready(function(){
			$
			.ajax({
				url : '${pageContext.request.contextPath}/manager/currentLoanList',
				type : 'get',
				success : function(data) {
					console.log(data)
					$('#loanList3').empty();
					const loanList2 = document.getElementById('loanList3');
					
					for(let i = 0 ; i < data.length; i++){
						let ctr = document.createElement("tr");
						ctr.setAttribute("onclick", "javascript:evalLoan1(" + data[i].loanNo+")")
						
						let ctd = document.createElement("td");
						ctd.innerText = (i+1);
						ctr.appendChild(ctd);
						
						let ctd1 = document.createElement("td");
						ctd1.innerText = data[i].compName;
						ctr.appendChild(ctd1);
						
						let ctd6 = document.createElement("td");
						ctd6.innerText = data[i].applyDate;
						ctr.appendChild(ctd6);
						
						let ctd2 = document.createElement("td");
						ctd2.innerText = data[i].loanCode;
						ctr.appendChild(ctd2);
						
						let ctd3 = document.createElement("td");
						ctd3.innerText = (data[i].loanAmount).toLocaleString('en-US');
						ctr.appendChild(ctd3);
						
						let ctd4 = document.createElement("td");
						ctd4.innerText = data[i].managerName;
						ctr.appendChild(ctd4);
						
						let ctd5 = document.createElement("td");
						let crd = document.createElement("div");
						crd.innerText = data[i].loanStatus;
						crd.setAttribute("class", "statusPill");
						if(data[i].loanStatus == "신청완료"){
							crd.setAttribute("style", "background-color:#F6A21E;");
						} else if(data[i].loanStatus == "승인"){
							crd.setAttribute("style", "background-color:#7A871E;");
						} else if(data[i].loanStatus == "거절"){
							crd.setAttribute("style", "background-color:#F85C70;");
						}
						ctd5.appendChild(crd);
						ctr.appendChild(ctd5);
						
						loanList2.appendChild(ctr);
					}
				}

			})
       })
       

       
       function evalLoan1(loanNo) {
			console.log(loanNo)
           location.href = "${pageContext.request.contextPath}/manager/detail/" + loanNo;
        }
       
       const step1 = document.querySelector('#step1');
		const step2 = document.querySelector('#step2');
		const step3 = document.querySelector('#step3');
		const step4 = document.querySelector('#step4');
		const stepText = document.querySelector('#stepText');
		
		let stepArr = [ step1, step2, step3, step4];
       
       function evalLoan2(statusCode1, statusCode2, stepId, statusText) {
    	   console.log(stepId);
    	   for(let i = 0; i < 4; i++){
    		   if (stepArr[i].classList.contains('progress-step-active')) {
    			   stepArr[i].classList.remove('progress-step-active')
   			}
    	   }
    	   
    	   stepArr[stepId].classList.add('progress-step-active');
    	   $('#stepText').empty();
    	   stepText.innerText = statusText;
          $
			.ajax({
				url : '${pageContext.request.contextPath}/manager/getLoanEvalList',
				type : 'get',
				data:{
					loanCode1 : statusCode1,
					loanCode2 : statusCode2,
				},
				success : function(data) {
					console.log(data)
					$('#loanList3').empty();
					const loanList2 = document.getElementById('loanList3');
					
					for(let i = 0 ; i < data.length; i++){
						let ctr = document.createElement("tr");
						ctr.setAttribute("onclick", "javascript:evalLoan1(" + data[i].loanNo+")")
						
						let ctd = document.createElement("td");
						ctd.innerText = (i+1);
						ctr.appendChild(ctd);
						
						let ctd1 = document.createElement("td");
						ctd1.innerText = data[i].compName;
						ctr.appendChild(ctd1);
						
						let ctd6 = document.createElement("td");
						ctd6.innerText = data[i].applyDate;
						ctr.appendChild(ctd6);
						
						let ctd2 = document.createElement("td");
						ctd2.innerText = data[i].loanCode;
						ctr.appendChild(ctd2);
						
						let ctd3 = document.createElement("td");
						ctd3.innerText = (data[i].loanAmount).toLocaleString('en-US');
						ctr.appendChild(ctd3);
						
						let ctd4 = document.createElement("td");
						ctd4.innerText = data[i].managerName;
						ctr.appendChild(ctd4);
						
						let ctd5 = document.createElement("td");
						let crd = document.createElement("div");
						crd.innerText = data[i].loanStatus;
						crd.setAttribute("class", "statusPill");
						if(data[i].loanStatus == "신청완료"){
							crd.setAttribute("style", "background-color:#F6A21E;");
						} else if(data[i].loanStatus == "승인"){
							crd.setAttribute("style", "background-color:#7A871E;");
						} else if(data[i].loanStatus == "거절"){
							crd.setAttribute("style", "background-color:#F85C70;");
						}
						ctd5.appendChild(crd);
						ctr.appendChild(ctd5);
						
						loanList2.appendChild(ctr);
					}
					
				}

			})
       }

	</script>
</body>
</html>