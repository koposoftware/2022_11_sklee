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
<title>STARTUPQ | 상품몰</title>
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
					<div class="dashboard_header">
						<h2>대출상품 조회</h2>
					</div>

					<div id="searchLoan">
						<div
							class="d-flex justify-content-center flex-column align-items-center">
							<form class="d-flex" role="search" id="searchLoanForm">
								<input class="form-control me-2" type="search"
									placeholder="기업 대출명을 입력하세요" aria-label="Search" id="searchString">
								<button class="btn_1" type="button" id="searchLoan2">
									<span class="material-icons-sharp">search</span>
								</button>
							</form>
						</div>
						<div class="d-flex flex-column align-items-center">
							<div class="d-flex justify-content-start"
								style="margin-top: 20px;">
								<button class="btn_6" onclick="javascript:keywordSearch('운전')" type="button">#운전자금</button>
								<button class="btn_6" onclick="javascript:keywordSearch('소상공인')" type="button">#소상공인</button>
								<button class="btn_6" onclick="javascript:keywordSearch('상생')" type="button">#상생대출</button>
								<button class="btn_6" onclick="javascript:keywordSearch('보증')" type="button">#보증</button>
								<button class="btn_6" onclick="javascript:keywordSearch('코로나')" type="button">#코로나피해지원</button>
								<button class="btn_6" onclick="javascript:keywordSearch('수출')" type="button">#수출</button>
								
							</div>
							<div class="d-flex justify-content-start"
								style="margin-top: 10px;">
								<button class="btn_6" onclick="javascript:keywordSearch('태양')" type="button">#에너지</button>
								<button class="btn_6" onclick="javascript:keywordSearch('시설')" type="button">#시설자금</button>
								<button class="btn_6" onclick="javascript:keywordSearch('중소기업')" type="button">#중소기업</button>
								<button class="btn_6" onclick="javascript:keywordSearch('소호')" type="button">#소호대출</button>
								<button class="btn_6" onclick="javascript:keywordSearch('판교')" type="button">#판교테크노밸리</button>
							</div>
						</div>

					</div>

					<div class="d-flex flex-column" style="margin-top: 50px;"
						id="viewLoan">
						<div style="border-bottom: 2px solid var(--color-light-2);">
							<h2>
								총 <span style="color: #008485;" id="countLoan"></span>개의 기업대출 상품이 있습니다
							</h2>
						</div>

						<div class="d-flex flex-column" id="loanProductList">
						</div>

					</div>
					<div class="d-flex justify-content-center py-5" id="paginationButtons">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item"><button
										class="page-link prev text-muted">
										<i class="fa-solid fa-angle-left"></i> prev
									</button></li>
								<li class="page-item"><button
										class="page-link getPage c1 text-dark">1</button></li>
								<li class="page-item"><button
										class="page-link getPage c2 text-dark">2</button></li>
								<li class="page-item"><button
										class="page-link getPage c3 text-dark">3</button></li>
								<li class="page-item"><button
										class="page-link getPage c4 text-dark">4</button></li>
								<li class="page-item"><button
										class="page-link getPage c5 text-dark">5</button></li>
								<li class="page-item"><button
										class="page-link next text-muted">
										next <i class="fa-solid fa-angle-right"></i>
									</button></li>
							</ul>
						</nav>
					</div>

				</div>
			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/script.jsp" />

	<script>
		const side1 = document.querySelector('#side1');

		let sideArr = [side1];

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

		let last = parseInt("${count}");
		const countLoan = document.querySelector('#countLoan');
		countLoan.innerText = last;
		
		$(document).ready(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/loanProduct/getAllLoanList',
				type : 'get',
				success : function(data) {
					console.log(data)
					$('#loanProductList').empty();
					const loanProductList = document.querySelector('#loanProductList');
					
					for(let i = 0; i< data.length;i++){
					let ctd = document.createElement("div");
					ctd.classList.add('loan_text');
					
					let ctd1 = document.createElement("div");
					if(data[i].loanProductCode.substring(0, 1) == 'P' ){						
					ctd1.classList.add('firmPill');
					ctd1.innerText = '기업대출';
					} else{
						ctd1.classList.add('sohoPill');
						ctd1.innerText = '소대출';
					}
					ctd.appendChild(ctd1);
					
					let cta = document.createElement("a");
					cta.setAttribute("href", "${pageContext.request.contextPath}/loanProduct/detail/" + data[i].loanProductCode);
					ctd.appendChild(cta);
					
					let ch4 = document.createElement("h4");
					ch4.innerText = data[i].detail;
					cta.appendChild(ch4);
					
					let chp = document.createElement("p");
					chp.innerText = data[i].summary;
					cta.appendChild(chp);

					loanProductList.appendChild(ctd);
					}
					
					/* 끝 */
				}

			})
		})
		
		$('.getPage').click(function(){
	  let numClass = 1+parseInt($(this).text()-1)*5;
    $(document).ready(function () {
      $.ajax({
        type: "get",
        url: "${pageContext.request.contextPath}/loanProduct/getNextloanList",
        data: {
          num: numClass,
        },
        success:function(data){
        	console.log(data);
        	$('#loanProductList').empty();
			const loanProductList = document.querySelector('#loanProductList');

			for(let i = 0; i< data.length;i++){
				let ctd = document.createElement("div");
				ctd.classList.add('loan_text');
				
				let ctd1 = document.createElement("div");
				if(data[i].loanProductCode.substring(0, 1) == 'P' ){						
				ctd1.classList.add('firmPill');
				ctd1.innerText = '기업대출';
				} else{
					ctd1.classList.add('sohoPill');
					ctd1.innerText = '소호대출';
				}
				ctd.appendChild(ctd1);
				
				let cta = document.createElement("a");
				cta.setAttribute("href", "${pageContext.request.contextPath}/loanProduct/detail/" + data[i].loanProductCode);
				ctd.appendChild(cta);
				
				let ch4 = document.createElement("h4");
				ch4.innerText = data[i].detail;
				cta.appendChild(ch4);
				
				let chp = document.createElement("p");
				chp.innerText = data[i].summary;
				cta.appendChild(chp);

				loanProductList.appendChild(ctd);
				}
	/* 끝 */
        } 
        	,error: function () {
          alert("실패");
        },
      });
    });
  

  })
  
  const searchLoan2 = document.getElementById('searchLoan2');
  const searchString = document.getElementById('searchString');
	const paginationButtons = document.getElementById('paginationButtons');
					
		searchLoan2
		.addEventListener(
				"click",
				function() {
					let searchString2 = searchString.value;
					console.log(searchString2);
					paginationButtons.classList.add('d-none');

					 $
							.ajax({
								url : '${pageContext.request.contextPath}/loanProduct/Search',
								data : {
									search : searchString2,
								},
								type : 'get',
								success : function(data) {
									console.log(data);
									
								
									$('#loanProductList').empty();
									for(let i = 0; i< data.length;i++){
										let ctd = document.createElement("div");
										ctd.classList.add('loan_text');
										
										let ctd1 = document.createElement("div");
										if(data[i].loanProductCode.substring(0, 1) == 'P' ){						
										ctd1.classList.add('firmPill');
										ctd1.innerText = '기업대출';
										} else{
											ctd1.classList.add('sohoPill');
											ctd1.innerText = '소호대출';
										}
										ctd.appendChild(ctd1);
										
										let cta = document.createElement("a");
										cta.setAttribute("href", "${pageContext.request.contextPath}/loanProduct/detail/" + data[i].loanProductCode);
										ctd.appendChild(cta);
										
										let ch4 = document.createElement("h4");
										ch4.innerText = data[i].detail;
										cta.appendChild(ch4);
										
										let chp = document.createElement("p");
										chp.innerText = data[i].summary;
										cta.appendChild(chp);

										loanProductList.appendChild(ctd);
										}
							/* 끝 */
									
								}

							})
							
							 $
							.ajax({
								url : '${pageContext.request.contextPath}/loanProduct/SearchCount',
								data : {
									search : searchString2,
								},
								type : 'get',
								success : function(data) {
									console.log(data);
									last = parseInt(data);
									countLoan.innerText = last;
								
							/* 끝 */
									
								}

							})
				})
		
		
  
			const c1 = document.querySelector(".c1");
	const c2 = document.querySelector(".c2");
	const c3 = document.querySelector(".c3");
	const c4 = document.querySelector(".c4");
	const c5 = document.querySelector(".c5");
	const next = document.querySelector(".next");
	const prev = document.querySelector(".prev");
	
								
						const rows_per_page = 5; //1 페이지 당 보여지는 글의 수
	const btn_num = 5; //Pagination 버튼 수
	let pages = Math.floor(last / (rows_per_page * btn_num)); //pagination 수
	lastPage = parseInt(
	  Math.ceil((last % (rows_per_page * btn_num)) / rows_per_page)
	);
	let arr2 = [c1, c2, c3, c4, c5];

	if (last > rows_per_page * btn_num) {
	  //페이지 뒤로 넘기는 함수
	  function nextPage() {
	    if (parseInt(c5.innerText) < pages * 5) {
	      for (let i = 0; i < 5; i++) {
	        arr2[i].innerText = parseInt(arr2[i].innerText) + 5;
	      }
	    } else if (parseInt(c5.innerText) == pages * 5) {
	      for (let i = 0; i < 5; i++) {
	        arr2[i].innerText = parseInt(arr2[i].innerText) + 5;
	      }
	      for (let i = lastPage; i < 5; i++) {
	        arr2[i].classList.add("d-none");
	      }
	      //console.log(c5.innerText);
	    }
	  }

	  //페이지 앞으로 넘기는 함수
	  function prevPage() {
	    if (parseInt(c1.innerText) > 1 && c5.innerText <= btn_num * pages) {
	      for (let i = 0; i < 5; i++) {
	        arr2[i].innerText = parseInt(arr2[i].innerText) - 5;
	      }
	    } else if (parseInt(c5.innerText) == btn_num * (pages + 1)) {
	      for (let i = lastPage; i < 5; i++) {
	        arr2[i].classList.remove("d-none");
	        arr2[i].innerText = parseInt(arr2[i].innerText);
	      }
	      for (let i = 0; i < 5; i++) {
	        arr2[i].innerText = parseInt(arr2[i].innerText) - 5;
	      }
	    }
	  }
	} else {
	  for (let i = lastPage; i < 5; i++) {
	    arr2[i].classList.add("d-none");
	  }
	}

	next.addEventListener("click", nextPage);
	prev.addEventListener("click", prevPage);

	function keywordSearch(search11) {
		  console.log(String(search11));
		  
		  let searchString2 = search11;
		  paginationButtons.classList.add('d-none');
		  
		  $
			.ajax({
				url : '${pageContext.request.contextPath}/loanProduct/Search2',
				data : {
					search : searchString2,
				},
				type : 'get',
				success : function(data) {
					console.log(data);
					
				
					$('#loanProductList').empty();
					for(let i = 0; i< data.length;i++){
						let ctd = document.createElement("div");
						ctd.classList.add('loan_text');
						
						let ctd1 = document.createElement("div");
						if(data[i].loanProductCode.substring(0, 1) == 'P' ){						
						ctd1.classList.add('firmPill');
						ctd1.innerText = '기업대출';
						} else{
							ctd1.classList.add('sohoPill');
							ctd1.innerText = '소호대출';
						}
						ctd.appendChild(ctd1);
						
						let cta = document.createElement("a");
						cta.setAttribute("href", "${pageContext.request.contextPath}/loanProduct/detail/" + data[i].loanProductCode);
						ctd.appendChild(cta);
						
						let ch4 = document.createElement("h4");
						ch4.innerText = data[i].detail;
						cta.appendChild(ch4);
						
						let chp = document.createElement("p");
						chp.innerText = data[i].summary;
						cta.appendChild(chp);

						loanProductList.appendChild(ctd);
						}
			/* 끝 */
					
				}

			})
			
			$
							.ajax({
								url : '${pageContext.request.contextPath}/loanProduct/SearchCount2',
								data : {
									search : searchString2,
								},
								type : 'get',
								success : function(data) {
									console.log(data);
									last = parseInt(data);
									countLoan.innerText = last;
								
							/* 끝 */
									
								}

							})
		}
			
	</script>
</body>
</html>