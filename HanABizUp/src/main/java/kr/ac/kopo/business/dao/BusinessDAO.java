package kr.ac.kopo.business.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
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

@Mapper
public interface BusinessDAO {

	// 상품목록 조회
	public List<ProductVO> selectAllProduct(String compName);

	// 상품 등록
	public void insertProduct(ProductVO productVO);

	// 상품 로그 등록
	public void insertProductLog(ProductVO productVO);

	// 매출정보 분개장에 등록
	public void insertRevenue(RevenueVO revenueVO);

	// 생산비용 분개장에 등록
	public void insertProductCost(ProductCostVO productCostVO);

	// 판매관리비 분개장에 등록
	public void insertSellingExpenses(SellingExpensesVO sellingExpensesVO);

	// 자산 분개장에 등록
	public void insertAssets(AssetsVO assetsVO);

	// 회계기간 등록
	public void insertAccountingPeriod(AccountingPeriodVO accountingPeriodVO);

	// 분개장에 등록된 정보 확인
	public List<LedgerVO> confirmLedger(@Param("compName") String compName, @Param("row") int row);

	// 모든 분개장 내용 조회
	public List<LedgerVO> allLedger(@Param("compName") String compName, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	// 비용 코드 조회
	public List<AccountingCodeVO> selectAllCostCode();

	// 자산 코드 조회
	public List<AssetsVO> selectAllAssetsCode();

	// 합계잔액시산표 조회
	public List<AccountingPeriodVO> selectTrialBalance(AccountingPeriodVO accountingPeriodVO);

	// 합계잔액시산표 도출
	public void insertTrialBalance(@Param("compName") String compName, @Param("accountingPeriod") String accountingPeriod,
			@Param("startDate") String startDate, @Param("endDate") String endDate);

	// 손익계산서 도출
	public void insertIncomeStatement(@Param("compName") String compName, @Param("corporateTax") int corporateTax,
			@Param("accountingPeriod") String accountingPeriod);

	// 재무태표 도출1
	public void insertBalanceSheet1(@Param("compName") String compName, @Param("corporateTax") int corporateTax,
			@Param("accountingPeriod") String accountingPeriod);

	// 재무태표 도출2
	public void insertBalanceSheet2(@Param("compName") String compName,
			@Param("accountingPeriod1") String accountingPeriod1, @Param("accountingPeriod2") String accountingPeriod2);

	// 손익계산서 조회
	public IncomeStatementVO selectIncomeStatement(AccountingPeriodVO accountingPeriodVO);

	// 재무상태표 조회
	public BalanceSheetVO selectBalanceSheet(AccountingPeriodVO accountingPeriodVO);

	// 총 계정원장 수 조회
	public int selectLedgerCount(String compName);

	// 월별 상품판매수량 조회
	public List<ProductVO> selectProductStat(@Param("compName") String compName, @Param("month") String month);

	// 상품 판매리스트
	public List<ProductVO> selectProductList(@Param("compName") String compName);

	// 모든 재무상태표 조회
	public List<BalanceSheetVO> selectAllBalanceSheet(@Param("compName") String compName);

	// 모든 손익계산서 조회
	public List<IncomeStatementVO> selectAlIncomeStatement(@Param("compName") String compName);

	// 매출 통계 데이터
	public SalesStatVO selectSalesStat(@Param("year") String year, @Param("curMonth") String curMonth,
			@Param("recMonth") String recMonth, @Param("compName") String compName);

	// 재무제표 선택하기
	public BalanceSheetVO selectRecentBalanceSheet(@Param("compName") String compName);

	// 분개결과 확인하기
	public List<LedgerVO> selectConfirmLedger(@Param("compName") String compName,
			@Param("ledgerType") String ledgerType, @Param("num") int num);

	// 회계정보 검색 기능
	public KeywordSearchVO searchAccountingKeyword(@Param("searchKeyword") String searchKeyword);

}
