package kr.ac.kopo.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.business.dao.BusinessDAO;
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

@Service
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	private BusinessDAO businessDAO;

	// 상품목록 조회
	@Override
	public List<ProductVO> selectAllProduct(String compName) {
		List<ProductVO> list = businessDAO.selectAllProduct(compName);
		return list;
	}

	// 상품등록
	@Override
	public void insertProduct(ProductVO productVO) {
		for (int i = 0; i < productVO.getProductList().size(); i++) {
			if (productVO.getProductList().get(i).getCompName() != null) {
				ProductVO productVO1 = new ProductVO();
				productVO1 = productVO.getProductList().get(i);
				businessDAO.insertProduct(productVO1);
				businessDAO.insertProductLog(productVO1);
			}
		}
	}

	// 매출상황 분개장 등록
	@Override
	public void insertRevenue(RevenueVO revenueVO) {
		for (int i = 0; i < revenueVO.getRevenueList().size(); i++) {
			if (revenueVO.getRevenueList().get(i).getLedgerDate() != null) {
				RevenueVO revenueVO1 = new RevenueVO();
				revenueVO1 = revenueVO.getRevenueList().get(i);
//				System.out.println(revenueVO.getRevenueList().get(i));
				businessDAO.insertRevenue(revenueVO1);
			}
		}
	}

	// 분개장 결과 가져오기
	@Override
	public List<LedgerVO> confirmLedger(String compName, int row) {
		return businessDAO.confirmLedger(compName, row);
	}

	// 모든 분개내용 가져오기
	@Override
	public List<LedgerVO> allLedger(String compName, int startNum, int endNum) {
		return businessDAO.allLedger(compName, startNum, endNum);
	}

	// 생산비용 분개장 등록
	@Override
	public void insertProductCost(ProductCostVO productCostVO) {
		for (int i = 0; i < productCostVO.getProductCostList().size(); i++) {
			if (productCostVO.getProductCostList().get(i).getLedgerDate() != null) {
				ProductCostVO productCostVO1 = new ProductCostVO();
				productCostVO1 = productCostVO.getProductCostList().get(i);
//				System.out.println(productCostVO.getProductCostList().get(i));
				businessDAO.insertProductCost(productCostVO1);
			}
		}

	}

	// 비용코드 조회
	@Override
	public List<AccountingCodeVO> selectAllCostCode() {
		return businessDAO.selectAllCostCode();
	}

	// 판매관리비 분개장 등록
	@Override
	public void insertSellingExpenses(SellingExpensesVO sellingExpensesVO) {
		for (int i = 0; i < sellingExpensesVO.getSellingExpensesList().size(); i++) {
			if (sellingExpensesVO.getSellingExpensesList().get(i).getLedgerDate() != null) {
				SellingExpensesVO sellingExpensesVO1 = new SellingExpensesVO();
				sellingExpensesVO1 = sellingExpensesVO.getSellingExpensesList().get(i);
				System.out.println(sellingExpensesVO.getSellingExpensesList().get(i));
				businessDAO.insertSellingExpenses(sellingExpensesVO1);
			}
		}

	}

	// 자산 분개장 등록
	@Override
	public void insertAssets(AssetsVO assetsVO) {
		for (int i = 0; i < assetsVO.getAssetsList().size(); i++) {
			if (assetsVO.getAssetsList().get(i).getLedgerDate() != null) {
				AssetsVO assetsVO1 = new AssetsVO();
				assetsVO1 = assetsVO.getAssetsList().get(i);
				System.out.println(assetsVO.getAssetsList().get(i));
				businessDAO.insertAssets(assetsVO1);
			}
		}

	}

	// 자산코드 조회
	@Override
	public List<AssetsVO> selectAllAssetsCode() {
		return businessDAO.selectAllAssetsCode();
	}

	// 합계잔액시산표 조회
	@Override
	public List<AccountingPeriodVO> selectTrialBalance(AccountingPeriodVO accountingPeriodVO) {
		// TODO Auto-generated method stub
		return businessDAO.selectTrialBalance(accountingPeriodVO);
	}

	// 손익계산서 도출
	@Override
	public void insertIncomeStatement(String compName, int corporateTax, String accountingPeriod) {
		businessDAO.insertIncomeStatement(compName, corporateTax, accountingPeriod);

	}

	// 손익계산서 조회
	@Override
	public IncomeStatementVO selectIncomeStatement(AccountingPeriodVO accountingPeriodVO) {
		return businessDAO.selectIncomeStatement(accountingPeriodVO);
	}

	// 재무상태표 조회
	@Override
	public BalanceSheetVO selectBalanceSheet(AccountingPeriodVO accountingPeriodVO) {
		// TODO Auto-generated method stub
		return businessDAO.selectBalanceSheet(accountingPeriodVO);
	}

	// 총 계정원장 수 조회
	@Override
	public int selectLedgerCount(String compName) {
		// TODO Auto-generated method stub
		return businessDAO.selectLedgerCount(compName);
	}

	// 매출분개 결과 조회
	@Override
	public List<ProductVO> selectProductStat(String compName, String month) {
		// TODO Auto-generated method stub
		return businessDAO.selectProductStat(compName, month);
	}

	// 상품 판매리스트
	@Override
	public List<ProductVO> selectProductList(String compName) {
		// TODO Auto-generated method stub
		return businessDAO.selectProductList(compName);
	}

	//모든 재무상태표 조회
	@Override
	public List<BalanceSheetVO> selectAllBalanceSheet(String compName) {
		// TODO Auto-generated method stub
		return businessDAO.selectAllBalanceSheet(compName);
	}

	//모든 손익계산서 조회
	@Override
	public List<IncomeStatementVO> selectAlIncomeStatement(String compName) {
		// TODO Auto-generated method stub
		return businessDAO.selectAlIncomeStatement(compName);
	}

	// 매출통계 데이터 
	@Override
	public SalesStatVO selectSalesStat(String year, String curMonth, String recMonth, String compName) {
		return businessDAO.selectSalesStat(year, curMonth, recMonth, compName);
	}

	// 회계기간 등록
	@Override
	public void insertAccountingPeriod(AccountingPeriodVO accountingPeriodVO) {
		businessDAO.insertAccountingPeriod(accountingPeriodVO);
	}

	// 최근 재무제표 검색
	@Override
	public BalanceSheetVO selectRecentBalanceSheet(String compName) {
		return businessDAO.selectRecentBalanceSheet(compName);
	}

	// 회계코드 검색기능
	@Override
	public KeywordSearchVO searchAccountingKeyword(String searchKeyword) {
		return businessDAO.searchAccountingKeyword(searchKeyword);
	}

	// 재무상태표 도출 1
	@Override
	public void insertBalanceSheet1(String compName, int corporateTax, String accountingPeriod) {
		businessDAO.insertBalanceSheet1(compName, corporateTax, accountingPeriod);
	}

	// 재무상태표 도출 2
	@Override
	public void insertBalanceSheet2(String compName, String accountingPeriod1, String accountingPeriod2) {
		businessDAO.insertBalanceSheet2(compName, accountingPeriod1, accountingPeriod2);
	}

	// 합계잔액시산표 도출
	@Override
	public void insertTrialBalance(String compName, String accountingPeriod, String startDate, String endDate) {
		businessDAO.insertTrialBalance(compName, accountingPeriod, startDate, endDate);
	}

	
	

	
}
