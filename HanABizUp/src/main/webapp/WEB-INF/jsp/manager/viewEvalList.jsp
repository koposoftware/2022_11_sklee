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
<title>대출 심사</title>
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
						<h2>대출심사내역</h2>
					</div>
					
					<!-- Progress bar -->
					<div class="progressbar" style="margin-top: 50px;">
						<div class="progress" id="progress"></div>

						<button class="progress-step progress-step-active" data-bs-toggle="tooltip"
							data-bs-title="${loanEvalVO.step1 }건" data-bs-placement="top"
							data-bs-custom-class="custom-tooltip3">신규신청</button>
							<button class="progress-step progress-step-active" data-bs-toggle="tooltip"
							data-bs-title="${loanEvalVO.step2 }건" data-bs-placement="top"
							data-bs-custom-class="custom-tooltip3">심사중</button>
						<button class="progress-step" data-bs-toggle="tooltip"
							data-bs-title="${loanEvalVO.step3 }건" data-bs-placement="top"
							data-bs-custom-class="custom-tooltip3">심사완료</button>
						<button class="progress-step" data-bs-toggle="tooltip"
							data-bs-title="${loanEvalVO.step4 }건" data-bs-placement="top"
							data-bs-custom-class="custom-tooltip3">상환완료</button>
					</div>
						

					<div class="middle2">
						<div class="middle2_head">
							<div class="d-flex justify-content-end align-items-end">
								<h4 class="middle_head">대출심사</h4>
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
									<th width="8%">#</th>
									<th>신청기업</th>
									<th>대출종류</th>
									<th>대출금액</th>
									<th>담당자</th>
									<th>진행상황</th>
								</tr>
							</thead>
							<tbody id="loanList2">
								     
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

		sideArr[1].classList.add('active');
		
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
		
       $(document).ready(function(){
    	   $
			.ajax({
				url : '${pageContext.request.contextPath}/manager/loanList',
				type : 'get',
				success : function(data) {
					console.log(data)
					$('#loanList2').empty();
					const loanList2 = document.getElementById('loanList2');
					
					for(let i = 0 ; i < data.length; i++){
						let ctr = document.createElement("tr");
						ctr.setAttribute("onclick", "javascript:evalLoan(" + data[i].loanNo+")")
						
						let ctd = document.createElement("td");
						ctd.innerText = (i+1);
						ctr.appendChild(ctd);
						
						let ctd1 = document.createElement("td");
						ctd1.innerText = data[i].compName;
						ctr.appendChild(ctd1);
						
						let ctd2 = document.createElement("td");
						ctd2.innerText = data[i].loanCode;
						ctr.appendChild(ctd2);
						
						let ctd3 = document.createElement("td");
						ctd3.innerText = data[i].loanAmount;
						ctr.appendChild(ctd3);
						
						let ctd4 = document.createElement("td");
						ctd4.innerText = data[i].managerName;
						ctr.appendChild(ctd4);
						
						let ctd5 = document.createElement("td");
						ctd5.innerText = data[i].loanStatus;
						ctr.appendChild(ctd5);
						
						loanList2.appendChild(ctr);
					}
					

				}

			})
       })
       
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

	</script>
</body>
</html>