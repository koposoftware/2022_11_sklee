<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container d-flex justify-content-end">
	<button id="to_top" onclick="scrollToTop()">
		<span class="material-icons-sharp">keyboard_arrow_up</span>
		<p>TOP</p>
	</button>
</div>

<footer>
	<div class="container">
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