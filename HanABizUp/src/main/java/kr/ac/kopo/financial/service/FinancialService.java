package kr.ac.kopo.financial.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ac.kopo.financial.vo.AccountingPeriod2VO;
import kr.ac.kopo.financial.vo.CalFirmEtcVO;
import kr.ac.kopo.financial.vo.CalFirmVO;
import kr.ac.kopo.financial.vo.FinanceStatVO;
import kr.ac.kopo.financial.vo.FirmValueVO;

public interface FinancialService {

	// 기업가치 계산기 1
	public void insertCalFirm(CalFirmVO calFirmVO);

	// 기업가치 계산기 2
	public void insertFirmValue(CalFirmEtcVO calFirmEtcVO);

	// 기업가치 불러오기
	public FirmValueVO selectFirmValue(String compName);

	// 회계기간 조회하기
	public List<AccountingPeriod2VO> selectAllAccountingPeriod(String compName);

	// 재무제표 통계 조회
	public FinanceStatVO selectFinancialStat(String compName, String accountingPeriod1, String accountingPeriod2);

	// 유동성 자산 감소 여부 조회
	public int selectLiquidity(String compName);

}
