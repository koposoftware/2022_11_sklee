package kr.ac.kopo.loan.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.business.vo.LedgerVO;
import kr.ac.kopo.loan.service.LoanServiceImpl;
import kr.ac.kopo.loan.vo.ApplyLoanVO;
import kr.ac.kopo.loan.vo.BankAccountVO;
import kr.ac.kopo.loan.vo.LoanProductVO;
import kr.ac.kopo.loan.vo.LoanVO;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class LoanController {

	@Autowired
	private LoanServiceImpl loanServiceImpl;

	// 대출상품검색 페이지
	@RequestMapping("/loanProduct")
	public String loanProduct(Model model) {

		int count = loanServiceImpl.selectCountLoanProduct();
		model.addAttribute("count", count);
		return "loan/loanProduct";
	}

	// 대출상품리스트 조회하기
	@ResponseBody
	@RequestMapping("/loanProduct/getAllLoanList")
	public List<LoanProductVO> getAllLoanList() {

		int startNum = 1;
		int endNum = 5;
		List<LoanProductVO> list = loanServiceImpl.selectLoantProductList(startNum, endNum);

		return list;
	}

	// 대출상품리스트 조회하기 2
	@ResponseBody
	@RequestMapping("/loanProduct/getNextloanList")
	public List<LoanProductVO> getNextloanList(HttpServletRequest request) {
		int startNum = Integer.parseInt(request.getParameter("num"));
		int endNum = startNum + 4;

		return loanServiceImpl.selectLoantProductList(startNum, endNum);
	}

	// 대출상품검색 상세페이지
	@RequestMapping("/loanProduct/detail/{loanProductCode}")
	public String loanProductDetail(@PathVariable("loanProductCode") String loanProductCode, Model model) {

		model.addAttribute("loanProductCode", loanProductCode);
		return "loan/loanProductDetail";
	}

	// 비대면 대출신청 상세페이지
	@RequestMapping("/applyLoan/{loanProductCode}")
	public String applyLoan(@PathVariable("loanProductCode") String loanProductCode, Model model) {

		System.out.println(loanProductCode);
		model.addAttribute("loanProductCode", loanProductCode);
		return "loan/applyLoan";
	}

	// 대출신청하기
	@PostMapping("/applyLoan/signup")
	public String applyLoanSignup(MemberVO memberVO, ApplyLoanVO applyLoanVO, HttpSession session) {

		System.out.println(applyLoanVO);

		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		memberVO.setCompName(loginVO.getCompName());
		applyLoanVO.setCompName(loginVO.getCompName());
		System.out.println(memberVO);

		loanServiceImpl.insertLoanApply(applyLoanVO);
		loanServiceImpl.updateMember(memberVO);

		return "loan/confirmLoan";
	}

	// 계좌조회
	@ResponseBody
	@RequestMapping("/applyLoan/selectAccount")
	public List<BankAccountVO> selectAccount(HttpSession session) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		return loanServiceImpl.selectFirmAccount(loginVO.getCompName());
	}

	// 대출상품 상세 조회
	@ResponseBody
	@RequestMapping("/loanProduct/Detail/{loanProductCode}")
	public LoanProductVO getLoanProductDetail(@PathVariable("loanProductCode") String loanProductCode) {

		return loanServiceImpl.selectLoanProductDetail(loanProductCode);
	}

	// 대출상품 상세 검색
	@ResponseBody
	@RequestMapping("/loanProduct/Search")
	public List<LoanProductVO> searchLoanProduct(HttpServletRequest request) {

		String search = request.getParameter("search");

		return loanServiceImpl.searchLoanProduct(search);
	}

	// 검색된 수 조회
	@ResponseBody
	@RequestMapping("/loanProduct/SearchCount")
	public int searchLoanCount(HttpServletRequest request) {

		String search = request.getParameter("search");

		return loanServiceImpl.searchLoanCount(search);
	}

	// 대출상품 상세 검색 2
	@ResponseBody
	@RequestMapping("/loanProduct/Search2")
	public List<LoanProductVO> searchKeyword(HttpServletRequest request) {

		String search = request.getParameter("search");

		return loanServiceImpl.searchKeyword(search);
	}

	// 검색된 수 조회 2
	@ResponseBody
	@RequestMapping("/loanProduct/SearchCount2")
	public int searchLoanCount2(HttpServletRequest request) {

		String search = request.getParameter("search");

		return loanServiceImpl.searchKeywordCount(search);
	}

	// 대출 계좌조회 페이지
	@RequestMapping("/viewLoanAccount")
	public String viewLoanAccount(Model model) {

		return "loan/viewLoanAccount";
	}

	// 대출신청목록 조회
	@ResponseBody
	@RequestMapping("/viewLoanApplication")
	public List<LoanVO> selectLoanAccountApply(HttpSession session) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		return loanServiceImpl.selectLoanAccountApply(loginVO.getCompName());
	}

	// 대출승인 목록 조회
	@ResponseBody
	@RequestMapping("/viewConfirmLoan")
	public List<LoanVO> selectConfirmLoanAccount(HttpSession session) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		return loanServiceImpl.selectConfirmLoanAccount(loginVO.getCompName());
	}
}
