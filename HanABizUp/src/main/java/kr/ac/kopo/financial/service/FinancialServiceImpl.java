package kr.ac.kopo.financial.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.financial.dao.FinancialDAO;
import kr.ac.kopo.financial.vo.AccountingPeriod2VO;
import kr.ac.kopo.financial.vo.CalFirmEtcVO;
import kr.ac.kopo.financial.vo.CalFirmVO;
import kr.ac.kopo.financial.vo.FinanceStatVO;
import kr.ac.kopo.financial.vo.FirmValueVO;

@Service
public class FinancialServiceImpl implements FinancialService {
	
	@Autowired
	private FinancialDAO financialDAO;

	// 기업가치 계산기 1
	@Override
	public void insertCalFirm(CalFirmVO calFirmVO) {
		for(int i = 0; i < calFirmVO.getCalFirmList().size(); i++) {
			financialDAO.insertCalFirm(calFirmVO.getCalFirmList().get(i));
		}
		
	}

	// 기업가치 계산기 1
	@Override
	public void insertFirmValue(CalFirmEtcVO calFirmEtcVO) {
		financialDAO.insertFirmValue(calFirmEtcVO);
		
	}

	// 기업가치 불러오기
	@Override
	public FirmValueVO selectFirmValue(String compName) {
		// TODO Auto-generated method stub
		return financialDAO.selectFirmValue(compName);
	}

	// 회계기간 조회하기
	@Override
	public List<AccountingPeriod2VO> selectAllAccountingPeriod(String compName) {
		return financialDAO.selectAllAccountingPeriod(compName);
	}

	// 재무제표 통계 조회하기
	@Override
	public FinanceStatVO selectFinancialStat(String compName, String accountingPeriod1, String accountingPeriod2) {
		return financialDAO.selectFinancialStat(compName, accountingPeriod1, accountingPeriod2);
	}

	// 유동성 감소여부 조회하기
	@Override
	public int selectLiquidity(String compName) {
		return financialDAO.selectLiquidity(compName);
	}
	

}
