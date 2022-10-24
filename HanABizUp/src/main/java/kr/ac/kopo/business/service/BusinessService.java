package kr.ac.kopo.business.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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

public interface BusinessService {

	// 상품목록 조회
	public List<ProductVO> selectAllProduct(String compName);

	// 상품등록
	public void insertProduct(ProductVO productVO);

	// 매출분개 등록
	public void insertRevenue(RevenueVO revenueVO);

	// 생산비용 분개장에 등록
	public void insertProductCost(ProductCostVO productCostVO);

	// 판매관리비 분개장에 등록
	public void insertSellingExpenses(SellingExpensesVO sellingExpensesVO);

	// 자산 분개장에 등록
	public void insertAssets(AssetsVO assetsVO);

	// 매출분개 결과 조회
	public List<LedgerVO> confirmLedger(String compName, int row);

	// 회계기간 등록
	public void insertAccountingPeriod(AccountingPeriodVO accountingPeriodVO);

	// 매출내역 조회
	public List<LedgerVO> allLedger(String compName, int startNum, int endNum);

	// 비용 코드 조회
	public List<AccountingCodeVO> selectAllCostCode();

	// 자산 코드 조회
	public List<AssetsVO> selectAllAssetsCode();

	// 합계잔액시산표 조회
	public List<AccountingPeriodVO> selectTrialBalance(AccountingPeriodVO accountingPeriodVO);
	
	// 합계잔액시산표 도출
	public void insertTrialBalance(String compName, String accountingPeriod, String startDate, String endDate);

	// 손익계산서 도출
	public void insertIncomeStatement(String compName, int corporateTax, String accountingPeriod);
	
	// 재무상태표 도출
	public void insertBalanceSheet1(String compName, int corporateTax, String accountingPeriod);

	// 재무상태표 도출
	public void insertBalanceSheet2(String compName,String accountingPeriod1, String accountingPeriod2);

	// 손익계산서 조회
	public IncomeStatementVO selectIncomeStatement(AccountingPeriodVO accountingPeriodVO);

	// 재무상태표 조회
	public BalanceSheetVO selectBalanceSheet(AccountingPeriodVO accountingPeriodVO);

	// 계정원장 수 조회
	public int selectLedgerCount(String compName);

	// 월별 상품판매수량 조회
	public List<ProductVO> selectProductStat(String compName, String month);

	// 상품 판매리스트
	public List<ProductVO> selectProductList(String compName);

	// 모든 재무상태표 조회
	public List<BalanceSheetVO> selectAllBalanceSheet(String compName);

	// 모든 손익계산서 조회
	public List<IncomeStatementVO> selectAlIncomeStatement(String compName);

	// 매출 통계 데이터
	public SalesStatVO selectSalesStat(String year, String curMonth, String recMonth, String compName);

	// 재무제표 선택하기
	public BalanceSheetVO selectRecentBalanceSheet(String compName);
	
	// 재무정보 검색
	public KeywordSearchVO searchAccountingKeyword(@Param("searchKeyword") String searchKeyword);
	
}
