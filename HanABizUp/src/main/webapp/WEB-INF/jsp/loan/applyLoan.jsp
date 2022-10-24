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
					<div class="dashboard_header">
						<h2>기업대출신청</h2>
						<span id="loanName2"></span>
					</div>

					<div class="d-flex justify-content-end" style="margin-bottom: 0px; margin-top: 50px;">
                        <button class="btn_4" data-bs-toggle="modal" data-bs-target="#bizRegModal"><span
                                class="material-icons-sharp" style="margin-right:5px">upload_file</span>사업자등록증
                            업로드</button>
                    </div>

					<div class="firm_cal_head">
						<div class="d-flex">
							<span class="material-icons-sharp" style="margin-right: 5px">arrow_circle_right</span>
							<h4>기본사항</h4>
						</div>
						<p>
							<span style="color: red;">*</span> 표시는 필수 입력사항입니다
						</p>
					</div>
					<form:form
						action="${pageContext.request.contextPath}/applyLoan/signup">
						<div class="firm_cal_check">


							<table class="loan_apply_table">
								<tr>
									<th><span>*</span> 기업명</th>
									<td colspan="3"><input type="text" class="form-control"
										name="compName" value="${loginVO.compName }" disabled></td>
								</tr>
								<tr>
									<th><span>*</span> 사업자등록번호</th>
									<td><input type="text" class="form-control"
										name="compRegno" id="compRegno"></td>
									<th><span>*</span> 설립일자</th>
									<td><input type="text" class="form-control"
										name="compStartDate" id="compStartDate"></td>
								</tr>
								<tr>
									<th><span>*</span> 주소</th>
									<td colspan="3"><input type="text" class="form-control"
										name="compAddr" id="compAddr"></td>
								</tr>
								<tr>
									<th><span>*</span> 대표자 성명</th>
									<td><input type="text" class="form-control" name="ceo" id="ceo"></td>
									<th><span>*</span> 담당자 성명</th>
									<td><input type="text" class="form-control"
										name="managerName" id="managerName"></td>
								</tr>
								<tr>
									<th><span>*</span> 대표자 연락처</th>
									<td><input type="text" class="form-control"
										name="ceoPhone"></td>
									<th><span>*</span> 담당자 연락처</th>
									<td><input type="text" class="form-control"
										name="managerPhone"></td>
								</tr>
								<tr>
									<th><span>*</span> 대표자 이메일</th>
									<td><input type="text" class="form-control"
										name="ceoEmail" id="ceoEmail"></td>
									<th><span>*</span> 담당자 이메일</th>
									<td><input type="text" class="form-control"
										name="managerEmail" id="managerEmail"></td>
								</tr>
							</table>
						</div>

						<div class="firm_cal_head" style="margin-top: 80px;">
							<div class="d-flex">
								<span class="material-icons-sharp" style="margin-right: 5px">arrow_circle_right</span>
								<h4>대출내용</h4>
							</div>
							<p>
								<span style="color: red;">*</span> 표시는 필수 입력사항입니다
							</p>
						</div>

						<div class="firm_cal_check">
							<table class="loan_apply_table">
								<tr>
									<th><span>*</span> 대출종류</th>
									<td colspan="4" id="loanName">
									</td>
									<td class="d-none"><input type="hidden" name="loanCode" id="loanCode"></td>
								</tr>
								<tr>
									<th><span>*</span> 대출신청금액</th>
									<td width="30%" colspan="4"><input type="text" class="form-control"
										name="loanAmount" id="loanAmount"></td>
								</tr>
								<tr>
									<th><span>*</span> 대출금 입금계좌</th>
									<td style="border-right: 2px solid var(--color-light-2);">
										<select class="form-select" name="accountNo"
										id="selectAccountNo">
									</select>
									</td>
									<th><span>*</span> 희망대출기한</th>
									<td><select class="form-select" name="loanTerm" id="loanTerm">
									</select></td>
								</tr>
								<tr>
									<th><span>*</span> 희망대출이자</th>
									<td width="30%"><input type="text" class="form-control"
										name="interestRate" id="interestRate"></td>
									<th><span>*</span> 이자납부일</th>
									<td colspan="2"><select class="form-select"
										name="interestPaydate">
											<option value="1">매달 1일</option>
											<option value="5">매달 5일</option>
											<option value="10">매달 10일</option>
											<option value="15">매달 15일</option>
											<option value="20">매달 20일</option>
											<option value="25">매달 25일</option>
									</select></td>
								</tr>
								<tr>
									<th><span>*</span> 상환방법</th>
									<td><select class="form-select" name="loanPayType"
										id="loanPayTypeSelect">
											<option value="LM001">원금만기일시상환</option>
											<option value="LM002">원리금균등상환</option>
											<option value="LM003">원금균등상환</option>
									</select></td>
									<td><button class="btn_5" data-bs-toggle="modal"
											data-bs-target="#interestModal" type="button" onclick="javascript:calculateInterest()">
											<span class="material-icons-sharp" style="margin-right: 5px;">calculate</span>월상환금
											비교
										</button></td>
								</tr>
							</table>

						</div>

						<div class="firm_cal_head" style="margin-top: 80px;">
							<div class="d-flex" style="margin-bottom: 10px;">
								<span class="material-icons-sharp" style="margin-right: 5px">arrow_circle_right</span>
								<h4>대출약관동의</h4>
							</div>
						</div>

						<div class="firm_cal_check">
							<div class="applyCheck">
								<div class="d-flex justify-content-center align-items-center">
									<input class="form-check-input" type="checkbox" id=""
										style="margin-right: 10px;">
									<p>은행여신거래기본약관에 동의합니다.</p>
								</div>
								<a href="#" class="downloadApply"> <img
									src="/resources/img/pdf-file.png" alt="">
									<p>은행여신거래기본약관(기업용)</p>
								</a>
							</div>
							<div class="applyCheck">
								<div class="d-flex justify-content-center align-items-center">
									<input class="form-check-input" type="checkbox"
										style="margin-right: 10px;">
									<p>여신거래약정서에 동의합니다.</p>
								</div>
								<a href="#" class="downloadApply"> <img
									src="/resources/img/pdf-file.png" alt="">
									<p>여신거래약정서(기업용)</p>
								</a>
							</div>
							<div class="applyCheck">
								<div class="d-flex justify-content-center align-items-center">
									<input class="form-check-input" type="checkbox"
										style="margin-right: 10px;">
									<p>기업대출상품설명서를 읽고 이해했으며 동의합니다.</p>
								</div>
								<a href="#" class="downloadApply"> <img
									src="/resources/img/pdf-file.png" alt="">
									<p>기업대출상품설명서</p>
								</a>
							</div>
							<div class="applyCheck">
								<div class="d-flex justify-content-center align-items-center">
									<input class="form-check-input" type="checkbox"
										style="margin-right: 10px;">
									<p>재무상태표 열람에 동의합니다.</p>
								</div>
								<a href="#" class="downloadApply"> <img
									src="/resources/img/pdf-file.png" alt="">
									<p>열람동의서</p>
								</a>
							</div>
						</div>


						<div class="d-flex justify-content-center mt-5"
							style="margin-bottom: 0px;">
							<button class="btn_2">
								<span class="material-icons-sharp" style="margin-right: 5px">approval</span>신청하기
							</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>


	    <!-- 이자계산기 Modal -->
    <div class="modal fade" id="interestModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="d-flex justify-content-end">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        style="margin-right: 20px; margin-top:15px;"></button>
                </div>
                <div class="modal-body d-flex flex-column align-items-center">
                    <h4 class="modal_title">
                        <div class=" modal_icon">
                            <span class="material-icons-sharp" style="font-size:30px; margin-right: 5px;">calculate</span>상환방법별 상환금 비교
                        </div>
                    </h4>

                    <div class="interest_modal_table">
                       
                        <div class="interest_modal_header">
                            <p>* 대출기간: <span id="cal_term" style="color: #008485;"></span></p>
                            <p>* 원금: <span id="cal_amount" style="color: #008485;"></span></p>
                            <p>* 이자율: <span id="cal_rate" style="color: #008485;"></span></p>
                        </div>
                        <table class="rc_table text-center" style="width: 600px;">
                            <tr>
                                <th>개월</th>
                                <th>원금만기일시상환</th>
                                <th>원리금균등상환</th>
                                <th>원금균등상환</th>
                            </tr>
                            <tbody id="compareInterest">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
     <!-- 사업자등록증 입력 Modal -->
    <div class="modal fade" id="bizRegModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="d-flex justify-content-end">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        style="margin-right: 20px; margin-top:15px;"></button>
                </div>
                <div class="modal-body d-flex flex-column align-items-center">
                    <h4 class="modal_title">사업자등록증 업로드</h4>


                    <form action="${pageContext.request.contextPath}/upload" id="uploadBiz" method="post" enctype="multipart/form-data" class="sign-up-form" style="width:90%;">
                        <div class="d-flex flex-column justify-content-center align-items-center" style="width:100%;">
                            <img src="" id="previewImage">
                            <div style="width: 60%;">
                            	<input type="hidden" value="${loanProductCode}" name="loanProductCode"/>
                                <input class="form-control" type="file" name="uploadfile" id="input-image" multiple="multiple">
                            </div>
                            <div class="d-flex justify-content-center" style="width:100%; margin-top: 20px;">
                                <input type="button" value="파일 업로드" class="btn_2" style="margin-top: 10px;" id="registerBiz">
                            </div>
                        </div> 
                    </form>
                </div>
            </div>
        </div>
    </div>

	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	<jsp:include page="/WEB-INF/jsp/include/script.jsp" />

	<script>
		const side1 = document.querySelector('#side1');

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

		const selectAccountNo = document.querySelector('#selectAccountNo');

		$(document)
				.ready(
						function() {
							$
									.ajax({
										url : '${pageContext.request.contextPath}/applyLoan/selectAccount',
										type : 'get',
										success : function(data) {
											/* console.log(data) */
											$('#selectAccountNo').empty();
											for (let i = 0; i < data.length; i++) {
												let cto = document
														.createElement("option");
												cto.setAttribute("value",
														data[i].accountNo);
												cto.innerText = data[i].accountNo;
												selectAccountNo
														.appendChild(cto);
											}

										}

									})
									
									$.ajax({
				url : '${pageContext.request.contextPath}/loanProduct/Detail/' + "${loanProductCode}",
				type : 'get',
				success : function(data) {
					console.log(data);
					const loanCode = document.querySelector('#loanCode');
					const loanName = document.querySelector('#loanName');
					const loanName2 = document.querySelector('#loanName2');
					const interestRate = document.querySelector('#interestRate');
					const loanTerm = document.querySelector('#loanTerm');
					
					loanCode.setAttribute("value", data.loanProductCode);
					loanName.innerText = data.detail;
					loanName2.innerText = data.detail;
					interestRate.setAttribute("value", data.interestLow);
					console.log(data.loanTermB);
					for(let i = 0 ; i < data.loanTermB; i++){
						let cro = document.createElement("option");
						cro.setAttribute("value", (i+1)*12);
						cro.innerText = (i+1) + '년';
						loanTerm.appendChild(cro);
					}
					
					
					
				
				}

			})
			
			if("${fileName}" != ""){				
			$.ajax({
				url : '${pageContext.request.contextPath}/clovaOCR/' + "${fileName}",
				type : 'get',
				success : function(data) {
					let list = JSON.parse(data);
					/* console.log(list); */
					/* console.log(list.images[0].fields); */
					let str = '';
					for(let i = 0 ; i < list.images[0].fields.length; i++){
					/* console.log(list.images[0].fields[i].inferText); */
						str = str + list.images[0].fields[i].inferText + ' ';
					}
					/* console.log(str); */
					console.log(str.split(': '));
					let str2 = str.split(': ');
					console.log(str2[1].split(' ')[0]);
					
					const compRegno = document.getElementById('compRegno');
					compRegno.setAttribute("value",str2[1].split(' ')[0]);
					
					const ceo = document.getElementById('ceo');
					ceo.setAttribute("value",str2[3].split(' ')[0]);
					
					const managerName = document.getElementById('managerName');
					managerName.setAttribute("value",str2[3].split(' ')[0]);
					
					
					const compStartDate = document.getElementById('compStartDate');
					let compStartDateStr = str2[4].split(' ')[0].substring(0,4) + '-' + str2[4].split(' ')[1] + '-' + str2[4].split(' ')[3]
					compStartDate.setAttribute("value",compStartDateStr);
					
					let compAddrStr = '';
					for(let i = 0 ; i < (str2[6].split(' ').length-2); i++){
						compAddrStr = compAddrStr + str2[6].split(' ')[i] + ' ';
					}
					
					const compAddr = document.getElementById('compAddr');
					compAddr.setAttribute("value",compAddrStr);
					
					const ceoEmail = document.getElementById('ceoEmail');
					ceoEmail.setAttribute("value",str2[11].split(' ')[0]);
					
					const managerEmail = document.getElementById('managerEmail');
					managerEmail.setAttribute("value",str2[11].split(' ')[0]);
					
					
				
				}

			})
			}
			
			
						})

						
        function readImage(input) {

            // 인풋 태그에 파일이 있는 경우
            if (input.files && input.files[0]) {

                // 이미지 파일인지 검사 (생략)

                // FileReader 인스턴스 생성
                const reader = new FileReader()

                // 이미지가 로드가 된 경우
                reader.onload = e => {
                    const previewImage = document.getElementById("previewImage")
                    // console.log(e.target.result)
                    previewImage.src = e.target.result;
                }

                // reader가 이미지 읽도록 하기
                reader.readAsDataURL(input.files[0])
            }
        }

        // input file에 change 이벤트 부여
        const inputImage = document.getElementById("input-image")
        inputImage.addEventListener("change", e => {
            readImage(e.target)
        })
        
       const registerBiz = document.getElementById("registerBiz");
        registerBiz.addEventListener("click", function(){
        	
        	
        	const uploadBiz = document.getElementById("uploadBiz");
        	uploadBiz.submit();
        	
        });
		
	</script>
	 <script src="/resources/js/calculateInterest.js"></script>
</body>
</html>