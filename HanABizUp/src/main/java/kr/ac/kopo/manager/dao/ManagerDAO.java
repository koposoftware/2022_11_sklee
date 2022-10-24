package kr.ac.kopo.manager.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.ac.kopo.loan.vo.LoanVO;
import kr.ac.kopo.manager.vo.BankerVO;
import kr.ac.kopo.manager.vo.LoanEvalVO;

@Mapper
public interface ManagerDAO {

	// 로그인 은행사원 조회
	public BankerVO selectBanker(BankerVO bankerVO);

	// 대출심사통계
	public LoanEvalVO selectLoanEvalStat(@Param("empNo") String empNo);
	
	// 대출 심사중으로 상태 업데이트
	public void updateLoanStatus(@Param("loanNo") int loanNo);

	//대출 반려
	public void loanRefusal(@Param("loanNo") int loanNo);
	

}
