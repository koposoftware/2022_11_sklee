package kr.ac.kopo.manager.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ac.kopo.loan.vo.LoanVO;
import kr.ac.kopo.manager.vo.BankerVO;
import kr.ac.kopo.manager.vo.LoanEvalVO;

public interface ManagerService {

	// 로그인 은행사원 조회
	public BankerVO selectBanker(BankerVO bankerVO);

	// 대출심사통계
	public LoanEvalVO selectLoanEvalStat(String empNo);

	// 대출 조회
	public List<LoanVO> selectAllLoanEval(String empNo);

	// 대출상세조회
	public LoanVO selectLoanEvalDetail(int loanNo);

	// 신규 대출리스트 조회
	public List<LoanVO> selectNewLoanEval(String empNo);

	// 심사중 대출리스트 조회
	public List<LoanVO> selectCurrentLoanEval(String empNo);

	// 대출승인 업데이트
	public void updateConfirmLoan(LoanVO loanVO);

	// 대출 심사중으로 상태 업데이트
	public void updateLoanStatus(int loanNo);

	// 검색 대출리스트 조회
	public List<LoanVO> clickLoanEval(String empNo, String loanCode1, String loanCode2);

	// 대출 반려
	public void loanRefusal(@Param("loanNo") int loanNo);
}
