package kr.ac.kopo.manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import kr.ac.kopo.loan.vo.LoanVO;
import kr.ac.kopo.manager.service.ManagerServiceImpl;
import kr.ac.kopo.manager.vo.BankerVO;
import kr.ac.kopo.manager.vo.LoanEvalVO;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class ManagerController {

	@Autowired
	private ManagerServiceImpl managerServiceImpl;

	// 관리자 페이지 메인
	@RequestMapping("/manager")
	public String managerIndex(HttpSession session, Model model) {
		return "manager/index2";
	}

	// 사원 로그인 페이지
	@RequestMapping("/empLogin")
	public String empLogin(HttpSession session, Model model) {
		BankerVO bankerVO1 = new BankerVO();

		model.addAttribute("bankerVO1", bankerVO1);

		return "manager/empLogin";
	}

	// 사원 로그인 확인
	@RequestMapping("/empLogin/confirm")
	public String empLoginConfirm(BankerVO banker, BindingResult result, Model model, HttpSession session) {
		if (result.hasErrors()) {
			return "manager/empLogin";
		} else {

			BankerVO authBanker = managerServiceImpl.selectBanker(banker);

			if (authBanker == null) {
				// 아이디와 비밀번호가 유효하지 않은 경우
				return "manager/empLogin";
			} else {
				// 성공적으로 로그인 한 경우
				model.addAttribute("bankerVO", authBanker);
				session.setAttribute("bankerVO", authBanker);
				return "redirect:/manager/dashboard";
			}
		}
	}

	// 로그아웃
	@RequestMapping("/empLogin/logout")
	public String logout(SessionStatus sessionStatus, HttpSession session) {
		sessionStatus.setComplete();
		session.invalidate();
		return "redirect:/manager";
	}

	// 대출심사관리 페이지
	@RequestMapping("/manager/dashboard")
	public String managerDashboard(HttpSession session, Model model) {

		BankerVO bankerVO = (BankerVO) session.getAttribute("bankerVO");

		LoanEvalVO loanEvalVO = new LoanEvalVO();
		loanEvalVO = managerServiceImpl.selectLoanEvalStat(bankerVO.getEmpNo());
		model.addAttribute("loanEvalVO", loanEvalVO);

		return "manager/loanEvalMain";
	}

	// 대출리스트 조회
	@ResponseBody
	@RequestMapping("/manager/loanList")
	public List<LoanVO> selectAllLoanEval(HttpSession session) {

		BankerVO bankerVO = (BankerVO) session.getAttribute("bankerVO");

		return managerServiceImpl.selectAllLoanEval(bankerVO.getEmpNo());
	}

	// 신규 대출리스트 조회
	@ResponseBody
	@RequestMapping("/manager/newLoanList")
	public List<LoanVO> selectNewLoanEval(HttpSession session) {

		BankerVO bankerVO = (BankerVO) session.getAttribute("bankerVO");

		return managerServiceImpl.selectNewLoanEval(bankerVO.getEmpNo());
	}

	// 심사중 대출리스트 조회
	@ResponseBody
	@RequestMapping("/manager/currentLoanList")
	public List<LoanVO> selectCurrentLoanEval(HttpSession session) {

		BankerVO bankerVO = (BankerVO) session.getAttribute("bankerVO");

		return managerServiceImpl.selectCurrentLoanEval(bankerVO.getEmpNo());
	}

	// 검색 대출리스트 조회
	@ResponseBody
	@RequestMapping("/manager/getLoanEvalList")
	public List<LoanVO> selecCurrentLoanEval(HttpSession session, HttpServletRequest request) {

		BankerVO bankerVO = (BankerVO) session.getAttribute("bankerVO");
		String loanCode1 = request.getParameter("loanCode1");
		String loanCode2 = request.getParameter("loanCode2");

//		System.out.println(loanCode1 + " " + loanCode2);

		return managerServiceImpl.clickLoanEval(bankerVO.getEmpNo(), loanCode1, loanCode2);
	}

	// 대출심사 페이지
	@RequestMapping("/manager/detail/{loanNo}")
	public String managerDashboard(@PathVariable("loanNo") int loanNo, Model model) {

		LoanVO loan = new LoanVO();
		managerServiceImpl.updateLoanStatus(loanNo);
		loan = managerServiceImpl.selectLoanEvalDetail(loanNo);
		model.addAttribute("loan", loan);

		return "manager/loanEvalDetail";
	}

	// 대출 심사내역 조회 페이지
	@RequestMapping("/manager/viewEvalList")
	public String viewEvalList(HttpSession session, Model model) {

		BankerVO bankerVO = (BankerVO) session.getAttribute("bankerVO");

		LoanEvalVO loanEvalVO = new LoanEvalVO();
		loanEvalVO = managerServiceImpl.selectLoanEvalStat(bankerVO.getEmpNo());
		model.addAttribute("loanEvalVO", loanEvalVO);

		return "manager/viewEvalList";
	}

	// 대출심사 승인
	@PostMapping("/manager/confirmLoan")
	public String updateLoanData(HttpServletRequest request, HttpSession session, Model model, LoanVO loanVO) {

		BankerVO bankerVO = (BankerVO) session.getAttribute("bankerVO");

		// 대출계좌 생성
		double random = Math.random();
		int number1 = (int) (random * 1000000);
		String first = "412";
		int number2 = (int) (random * 100000);

		String accountNo = first + "-" + String.valueOf(number1) + "-" + String.valueOf(number2);
		System.out.println(accountNo);
		loanVO.setLoanAccount(accountNo);

		System.out.println(loanVO);
		managerServiceImpl.updateConfirmLoan(loanVO);

		LoanEvalVO loanEvalVO = new LoanEvalVO();
		loanEvalVO = managerServiceImpl.selectLoanEvalStat(bankerVO.getEmpNo());
		model.addAttribute("loanEvalVO", loanEvalVO);

		return "redirect:/manager/dashboard";
	}

	// 대출심사 거절
	@GetMapping("/manager/loanRefusal/{loanNo}")
	public String loanRefusal(HttpServletRequest request, HttpSession session, Model model,@PathVariable("loanNo") String loanNo) {

		System.out.println(loanNo);
		managerServiceImpl.loanRefusal(Integer.parseInt(loanNo));
		return "redirect:/manager/dashboard";
	}
}
