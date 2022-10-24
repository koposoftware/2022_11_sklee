package kr.ac.kopo;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.ac.kopo.business.dao.BusinessDAO;
import kr.ac.kopo.business.vo.AccountingPeriodVO;
import kr.ac.kopo.business.vo.ProductCostVO;
import kr.ac.kopo.business.vo.ProductVO;
import kr.ac.kopo.business.vo.RevenueVO;
import kr.ac.kopo.financial.dao.FinancialDAO;
import kr.ac.kopo.loan.dao.LoanDAO;
import kr.ac.kopo.manager.dao.ManagerDAO;

@WebAppConfiguration
@SpringBootTest
class StartupqApplicationTests {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private FinancialDAO financialDAO;

	@Autowired
	private LoanDAO loanDAO;

	@Autowired
	private BusinessDAO businessDAO;
	
	@Autowired
	private ManagerDAO managerDAO;

	@Test
	void contextLoads() {
	}

	@Test
	public void myBatisT() {
		assertNotNull(sqlSessionTemplate);
	}

//	@Test
//	public void selectBalanceSheet() {
//		
//		BalanceSheetVO bs = new BalanceSheetVO();
//		
//		bs.setCompName("모두의 타이머");
//		
//		System.out.println(financialDAO.selectRecentBs(bs));
////		System.out.println(financialDAO.selectFiscalYears(bs));
//	}

	@Test
	public void test() {

		String compName = "모두의 타이머";
		String empNo = "H221015";
		String loanCode1 = "LP001";
		String loanCode2 = "";
		String searchKeyword = "책상";
		System.out.println(businessDAO.searchAccountingKeyword(searchKeyword));

	}

}
