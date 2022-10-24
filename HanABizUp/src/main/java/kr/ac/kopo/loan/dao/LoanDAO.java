package kr.ac.kopo.loan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.ac.kopo.business.vo.SalesStatVO;
import kr.ac.kopo.loan.vo.ApplyLoanVO;
import kr.ac.kopo.loan.vo.BankAccountVO;
import kr.ac.kopo.loan.vo.LoanProductVO;
import kr.ac.kopo.loan.vo.LoanVO;
import kr.ac.kopo.member.vo.MemberVO;

@Mapper
public interface LoanDAO {

	// 상품목록 조회
	public List<LoanProductVO> selectLoantProductList(@Param("startNum") int startNum, @Param("endNum") int endNum);

	// 대출 신청서 저장
	public void insertLoanApply(ApplyLoanVO applyLoanVO);

	// 기업소유 일반계좌 조회
	public List<BankAccountVO> selectFirmAccount(@Param("compName") String compName);

	// 대출상품 상세 조회
	public LoanProductVO selectLoanProductDetail(@Param("loanProductCode") String loanProductCode);

	// 대출상품 검색
	public List<LoanProductVO> searchLoanProduct(@Param("search") String search);

	// 총대출상품 수 조회
	public int selectCountLoanProduct();

	// 검색 된 대출상품 수 조회
	public int searchLoanCount(@Param("search") String search);

	// 대출상품 검색2
	public List<LoanProductVO> searchKeyword(@Param("search") String search);

	// 검색 된 대출상품 수 조회2
	public int searchKeywordCount(@Param("search") String search);

	// 대출 신청 현황조회
	public List<LoanVO> selectLoanAccountApply(@Param("compName") String compName);

	// 대출 승인 현황조회
	public List<LoanVO> selectConfirmLoanAccount(@Param("compName") String compName);

	// 대출리스트 조회1
	public List<LoanVO> selectAllLoanEval(@Param("empNo") String empNo);

	// 신규 대출리스트 조회
	public List<LoanVO> selectNewLoanEval(@Param("empNo") String empNo);

	// 심사중 대출리스트 조회
	public List<LoanVO> selectCurrentLoanEval(@Param("empNo") String empNo);

	// 키워드 검색 대출리스트 조회
	public List<LoanVO> clickLoanEval(@Param("empNo") String empNo, @Param("loanCode1") String loanCode1,
			@Param("loanCode2") String loanCode2);

	// 대출상세 조회
	public LoanVO selectLoanEvalDetail(@Param("loanNo") int loanNo);

	// 대출승인 업데이트
	public void updateConfirmLoan(LoanVO loanVO);

}
