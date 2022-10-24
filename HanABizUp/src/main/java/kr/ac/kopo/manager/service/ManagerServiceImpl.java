package kr.ac.kopo.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.loan.dao.LoanDAO;
import kr.ac.kopo.loan.vo.LoanVO;
import kr.ac.kopo.manager.dao.ManagerDAO;
import kr.ac.kopo.manager.vo.BankerVO;
import kr.ac.kopo.manager.vo.LoanEvalVO;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerDAO managerDAO;

	@Autowired
	private LoanDAO loanDAO;

	// 로그인 은행사원 확인
	@Override
	public BankerVO selectBanker(BankerVO bankerVO) {
		return managerDAO.selectBanker(bankerVO);
	}

	// 대출심사통계
	@Override
	public LoanEvalVO selectLoanEvalStat(String empNo) {
		return managerDAO.selectLoanEvalStat(empNo);
	}

	// 대출전체 조회
	@Override
	public List<LoanVO> selectAllLoanEval(String empNo) {
		return loanDAO.selectAllLoanEval(empNo);
	}

	// 대출상세 조회
	@Override
	public LoanVO selectLoanEvalDetail(int loanNo) {
		return loanDAO.selectLoanEvalDetail(loanNo);
	}

	// 신규대출리스트 조회
	@Override
	public List<LoanVO> selectNewLoanEval(String empNo) {
		return loanDAO.selectNewLoanEval(empNo);
	}

	// 대출승인
	@Override
	public void updateConfirmLoan(LoanVO loanVO) {
		loanDAO.updateConfirmLoan(loanVO);
	}

	// 대출 심사중으로 상태 업데이트
	@Override
	public void updateLoanStatus(int loanNo) {
		managerDAO.updateLoanStatus(loanNo);
	}

	// 대출 심사중 리스트
	@Override
	public List<LoanVO> selectCurrentLoanEval(String empNo) {
		return loanDAO.selectCurrentLoanEval(empNo);
	}

	// 키워드 검색 리스트
	@Override
	public List<LoanVO> clickLoanEval(String empNo, String loanCode1, String loanCode2) {
		return loanDAO.clickLoanEval(empNo, loanCode1, loanCode2);
	}

	//대출 반려
	@Override
	public void loanRefusal(int loanNo) {
		managerDAO.loanRefusal(loanNo);
	}

	
}
