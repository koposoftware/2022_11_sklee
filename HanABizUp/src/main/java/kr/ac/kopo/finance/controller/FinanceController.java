package kr.ac.kopo.finance.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.business.vo.AssetsVO;
import kr.ac.kopo.business.vo.ProductCostVO;
import kr.ac.kopo.business.vo.ProductVO;
import kr.ac.kopo.business.vo.RevenueVO;
import kr.ac.kopo.business.vo.SellingExpensesVO;
import kr.ac.kopo.financial.service.FinancialServiceImpl;
import kr.ac.kopo.financial.vo.AccountingPeriod2VO;
import kr.ac.kopo.financial.vo.CalFirmEtcVO;
import kr.ac.kopo.financial.vo.CalFirmVO;
import kr.ac.kopo.financial.vo.FinanceStatVO;
import kr.ac.kopo.financial.vo.FirmValueVO;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class FinanceController {

	@Autowired
	private FinancialServiceImpl financialServiceImpl;

	// 재무분석 페이지
	@RequestMapping("/financeMain")
	public String financeMain(HttpSession session, Model model) {

		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		int liquidity = financialServiceImpl.selectLiquidity(loginVO.getCompName());
		model.addAttribute("liquidity", liquidity);

		return "finance/financeMain";
	}

	// 기업계산 페이지
	@RequestMapping("/calFirmValue")
	public String calculateFirmValue(HttpSession session, Model model) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		model.addAttribute("loginVO", loginVO);
		return "finance/calFirmValue";
	}

	// 기업계산 결과 페이지
	@RequestMapping("/firmValueResult")
	public String firmValueResult(HttpSession session, Model model) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		model.addAttribute("loginVO", loginVO);
		return "finance/firmValueResult";
	}

	// 매출 분개 저장 후 결과 확인
	@PostMapping("/calFirmValue/calculate")
	public String calculateFirmValueNext(CalFirmVO calFirmVO, CalFirmEtcVO calFirmEtcVO, HttpSession session) {

		financialServiceImpl.insertCalFirm(calFirmVO);

		financialServiceImpl.insertFirmValue(calFirmEtcVO);
		System.out.println(calFirmEtcVO);
		return "redirect:/firmValueResult";
	}

	// 기업가치 계산결과 조회
	@ResponseBody
	@RequestMapping("/calFirmValue/result")
	public FirmValueVO getFirmValue(HttpSession session) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		return financialServiceImpl.selectFirmValue(loginVO.getCompName());
	}

	// 기업가치 계산결과 조회(관리자용)
	@ResponseBody
	@RequestMapping("/calFirmValue/result2")
	public FirmValueVO getFirmValue2(HttpSession session, HttpServletRequest request) {
		String compName = request.getParameter("compName");
		return financialServiceImpl.selectFirmValue(compName);
	}

	// 모든 회계기간 조회
	@ResponseBody
	@RequestMapping("/financeMain/accountingPeriod")
	public List<AccountingPeriod2VO> getALlAccountingPeriod(HttpSession session) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		return financialServiceImpl.selectAllAccountingPeriod(loginVO.getCompName());
	}

	// 모든 회계기간 조회(관리자용)
	@ResponseBody
	@RequestMapping("/financeMain/accountingPeriod2")
	public List<AccountingPeriod2VO> getALlAccountingPeriod2(HttpSession session, HttpServletRequest request) {
		String compName = request.getParameter("compName");
		return financialServiceImpl.selectAllAccountingPeriod(compName);

	}

	// 재무제표 통계 조회
	@ResponseBody
	@RequestMapping("/financeMain/balanceSheetStat")
	public FinanceStatVO getbalanceSheetStat(HttpSession session, HttpServletRequest request) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		String accountingPeriod1 = request.getParameter("accountingPeriod");
		String accountingPeriod2 = Integer.parseInt(accountingPeriod1.substring(0, accountingPeriod1.length() - 1)) - 1
				+ "기";
		return financialServiceImpl.selectFinancialStat(loginVO.getCompName(), accountingPeriod1, accountingPeriod2);
	}

	// 유동성 조회
	@ResponseBody
	@RequestMapping("/financeMain/getLiquidity")
	public int getLiquidity(HttpSession session, HttpServletRequest request) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		return financialServiceImpl.selectLiquidity(loginVO.getCompName());
	}
}