package kr.ac.kopo.business.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.business.service.BusinessServiceImpl;
import kr.ac.kopo.business.vo.AccountingCodeVO;
import kr.ac.kopo.business.vo.AccountingPeriodVO;
import kr.ac.kopo.business.vo.AssetsVO;
import kr.ac.kopo.business.vo.BalanceSheetVO;
import kr.ac.kopo.business.vo.IncomeStatementVO;
import kr.ac.kopo.business.vo.KeywordSearchVO;
import kr.ac.kopo.business.vo.LedgerVO;
import kr.ac.kopo.business.vo.ProductCostVO;
import kr.ac.kopo.business.vo.ProductVO;
import kr.ac.kopo.business.vo.RevenueVO;
import kr.ac.kopo.business.vo.SalesStatVO;
import kr.ac.kopo.business.vo.SellingExpensesVO;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class BusinessController {

	@Autowired
	private BusinessServiceImpl businessServiceImpl;

	// 총계정 원장 보기 페이지
	@RequestMapping("/ledger")
	public String businessMain(HttpSession session, Model model) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		int count = businessServiceImpl.selectLedgerCount(loginVO.getCompName());

		model.addAttribute("loginVO", loginVO);
		model.addAttribute("count", count);
		return "business/ledger";
	}

	// 매출과 비용 등록 페이지
	@RequestMapping("/revenueCost")
	public String revenueCost(HttpSession session, Model model) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		model.addAttribute("loginVO", loginVO);

		return "business/revenueCost";
	}

	// 상품 리스트 조회
	@ResponseBody
	@RequestMapping("/revenueCost/productList")
	public List<ProductVO> productList(HttpSession session) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		return businessServiceImpl.selectAllProduct(loginVO.getCompName());
	}

	// 상품등록
	@PostMapping("/revenueCost/addProduct")
	public String addProduct(ProductVO productVO) {

		businessServiceImpl.insertProduct(productVO);
		return "redirect:/revenueCost";
	}

	// 매출 분개 저장 후 결과 확인
	@RequestMapping("/revenueCost/addRevenueLedger")
	public String addRevenueLedger(RevenueVO revenueVO, ProductCostVO productCostVO,
			SellingExpensesVO sellingExpensesVO, AssetsVO assetsVO, HttpSession session) {

		int row = -1;
		int rowc = -1;
		for (int i = 0; i < revenueVO.getRevenueList().size(); i++) {
			if (revenueVO.getRevenueList().get(i).getLedgerDate() != null) {
//				System.out.println(revenueVO.getRevenueList().get(i));
				row++;
				rowc++;
			}
		}

		for (int i = 0; i < productCostVO.getProductCostList().size(); i++) {
			if (productCostVO.getProductCostList().get(i).getLedgerDate() != null) {
//				System.out.println(productCostVO.getProductCostList().get(i));
				row++;
			}
		}

		for (int i = 0; i < sellingExpensesVO.getSellingExpensesList().size(); i++) {
			if (sellingExpensesVO.getSellingExpensesList().get(i).getLedgerDate() != null) {
//				System.out.println(sellingExpensesVO.getSellingExpensesList().get(i));
				row++;
			}
		}

		for (int i = 0; i < assetsVO.getAssetsList().size(); i++) {
			if (assetsVO.getAssetsList().get(i).getLedgerDate() != null) {
//				System.out.println(assetsVO.getAssetsList().get(i));
				row++;
			}
		}

		session.setAttribute("row", row);

		businessServiceImpl.insertRevenue(revenueVO);
		businessServiceImpl.insertProductCost(productCostVO);
		businessServiceImpl.insertSellingExpenses(sellingExpensesVO);
		businessServiceImpl.insertAssets(assetsVO);

		return "business/confirmLedger";
	}

	// 분개결과 확인 및 수정
	@RequestMapping("/confirmLedger")
	public String confirmLedger() {

		return "business/confirmLedger";
	}

	// 분개결과 확인 및 수정 데이터
	@ResponseBody
	@RequestMapping("/confirmLedger/getLedgerList")
	public List<LedgerVO> getLedgerList(HttpSession session) {

		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		int row = (int) session.getAttribute("row");
		List<LedgerVO> list = businessServiceImpl.confirmLedger(loginVO.getCompName(), row);

		return list;
	}

	// 총계정원장 조회하기
	@ResponseBody
	@RequestMapping("/ledger/getAllLedgerList")
	public List<LedgerVO> getAllLedgerList(HttpSession session) {

		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		int startNum = 1;
		int endNum = 10;
		List<LedgerVO> list = businessServiceImpl.allLedger(loginVO.getCompName(), startNum, endNum);

		return list;
	}

	// 다음 총계정원장 조회하기
	@ResponseBody
	@RequestMapping("/ledger/getNextLedgerList")
	public List<LedgerVO> getNextLedgerList(HttpSession session, HttpServletRequest request) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		int startNum = Integer.parseInt(request.getParameter("num"));
		int endNum = startNum + 9;

		return businessServiceImpl.allLedger(loginVO.getCompName(), startNum, endNum);
	}

	// 비용코드 조회
	@ResponseBody
	@RequestMapping("/revenueCost/accountingCode")
	public List<AccountingCodeVO> getAllAccountingCode() {
		return businessServiceImpl.selectAllCostCode();
	}

	// 자산코드 조회
	@ResponseBody
	@RequestMapping("/revenueCost/assetsCode")
	public List<AssetsVO> getAllAssetsCode() {
		return businessServiceImpl.selectAllAssetsCode();
	}

	// 자본현황 페이지
	@RequestMapping("/equity")
	public String equity() {

		return "business/equity";
	}

	// 합계잔액시산표 확인 페이지
	@RequestMapping("/ledger/trialBalance")
	public String trialBalanceConfirm(AccountingPeriodVO accountingPeriodVO, Model model, HttpSession session) {

		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		
		//합계잔액시산표 도출 
		businessServiceImpl.insertTrialBalance(loginVO.getCompName(), accountingPeriodVO.getAccountingPeriod(),
				accountingPeriodVO.getStartDate(), accountingPeriodVO.getEndDate());
		// 회계연도 저장
		businessServiceImpl.insertAccountingPeriod(accountingPeriodVO);

		session.setAttribute("accountingPeriodVO", accountingPeriodVO);
		model.addAttribute("accountingPeriodVO", accountingPeriodVO);

		return "business/trialBalance";
	}

	// 합계잔액시산표 페이지
	@RequestMapping("/trialBalance")
	public String trialBalance() {
		return "business/trialBalance";
	}

	// 합계잔액시산표 조회
	@ResponseBody
	@RequestMapping("/ledger/selectTrialBalance")
	public List<AccountingPeriodVO> selectTrialBalance(HttpSession session) {

		AccountingPeriodVO accountingPeriodVO = (AccountingPeriodVO) session.getAttribute("accountingPeriodVO");

		return businessServiceImpl.selectTrialBalance(accountingPeriodVO);
	}

	// 재무상태표 작성 페이지
	@RequestMapping("/ledger/balanceSheet")
	public String makeBalanceSheet(HttpSession session, HttpServletRequest request) {
		AccountingPeriodVO ac = (AccountingPeriodVO) session.getAttribute("accountingPeriodVO");
		String compName = ac.getCompName();
		String accountingPeriod1 = ac.getAccountingPeriod();
		int corporateTax = Integer.parseInt(request.getParameter("corporateTax"));
		String accountingPeriod2 = Integer.parseInt(accountingPeriod1.substring(0, 1)) - 1 + "기";
		System.out.println(accountingPeriod2);

		// 손익계산서 도출
		businessServiceImpl.insertIncomeStatement(compName, corporateTax, accountingPeriod1);
		// 재무상태표 도출 1
		businessServiceImpl.insertBalanceSheet1(compName, corporateTax, accountingPeriod1);
		// 재무상태표 도출 2
		businessServiceImpl.insertBalanceSheet2(compName, accountingPeriod1, accountingPeriod2);

		return "redirect:/balanceSheet";
	}

	// 재무상태표 페이지
	@RequestMapping("/balanceSheet")
	public String balanceSheetPage() {
		return "business/balanceSheet";
	}

	// 재무상태표 페이지 (손익계산서)
	@ResponseBody
	@RequestMapping("/ledger/incomeStatement")
	public IncomeStatementVO selectIncomeStatement(HttpSession session) {

		AccountingPeriodVO ac = (AccountingPeriodVO) session.getAttribute("accountingPeriodVO");

		return businessServiceImpl.selectIncomeStatement(ac);
	}

	// 재무상태표 페이지 (재무상태표)
	@ResponseBody
	@RequestMapping("/ledger/balanceSheetView")
	public BalanceSheetVO balanceSheetView(HttpSession session) {

		AccountingPeriodVO ac = (AccountingPeriodVO) session.getAttribute("accountingPeriodVO");

		return businessServiceImpl.selectBalanceSheet(ac);
	}

	// 판매현황 조회 페이지
	@RequestMapping("/businessMain")
	public String businessMain() {
		return "business/businessMain";
	}

	// 월별 판매 현황 조회
	@ResponseBody
	@RequestMapping("/businessMain/productStat")
	public List<ProductVO> selectProductStat(HttpSession session, HttpServletRequest request) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		String month = request.getParameter("month");
		System.out.println(month);

		return businessServiceImpl.selectProductStat(loginVO.getCompName(), month);
	}

	// 상품 리스트 조회
	@ResponseBody
	@RequestMapping("/businessMain/productList")
	public List<ProductVO> selectProductList(HttpSession session, HttpServletRequest request) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		return businessServiceImpl.selectProductList(loginVO.getCompName());
	}

	// 모든 재무상태표 조회
	@ResponseBody
	@RequestMapping("/businessMain/getAllBalanceSheet")
	public List<BalanceSheetVO> getAllBalanceSheet(HttpSession session) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		return businessServiceImpl.selectAllBalanceSheet(loginVO.getCompName());
	}

	// 모든 재무상태표 조회(관리자용)
	@ResponseBody
	@RequestMapping("/businessMain/getAllBalanceSheet2")
	public List<BalanceSheetVO> getAllBalanceSheet2(HttpSession session, HttpServletRequest request) {

		String compName = request.getParameter("compName");

		return businessServiceImpl.selectAllBalanceSheet(compName);
	}

	// 모든 손익계산서 조회
	@ResponseBody
	@RequestMapping("/businessMain/getAllIncomeStatement")
	public List<IncomeStatementVO> getAllIncomeStatement(HttpSession session) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		return businessServiceImpl.selectAlIncomeStatement(loginVO.getCompName());
	}

	// 월별 판매 현황 조회
	@ResponseBody
	@RequestMapping("/businessMain/salesStat")
	public SalesStatVO selectSalesStat(HttpSession session, HttpServletRequest request) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		String compName = loginVO.getCompName();
		String month = request.getParameter("month");
		String year = month.substring(0, 4);
		String curMonth = month.substring(5, 7);
		String recMonth = "";
		if (Integer.parseInt(curMonth) <= 10) {
			recMonth = '0' + String.valueOf(Integer.parseInt(curMonth) - 1);
		} else {
			recMonth = String.valueOf(Integer.parseInt(curMonth) - 1);
		}
		System.out.println(year + ' ' + curMonth + ' ' + recMonth);

		return businessServiceImpl.selectSalesStat(year, curMonth, recMonth, compName);
	}

	// 최근 재무상태표 페이지 조회
	@ResponseBody
	@RequestMapping("/ledger/recentBalanceSheet")
	public BalanceSheetVO recentBalanceSheet(HttpSession session) {
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		return businessServiceImpl.selectRecentBalanceSheet(loginVO.getCompName());
	}

	// 선택한 회계기간의 재무상태표 조회
	@ResponseBody
	@RequestMapping("/ledger/balanceSheetView2")
	public BalanceSheetVO selectBalanceSheet2(HttpSession session, HttpServletRequest request) {

		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		AccountingPeriodVO ac = new AccountingPeriodVO();
		ac.setCompName(loginVO.getCompName());

		String accountingPeriod = request.getParameter("accountingPeriod");
		ac.setAccountingPeriod(accountingPeriod);

		return businessServiceImpl.selectBalanceSheet(ac);
	}

	// 회계항목 검색기능
	@ResponseBody
	@RequestMapping("/ledger/searchAccoountingKeyword")
	public KeywordSearchVO searchAccoountingKeyword(HttpServletRequest request) {
		String searchKeyword = request.getParameter("searchKeyword");
		return businessServiceImpl.searchAccountingKeyword(searchKeyword);
	}
}
