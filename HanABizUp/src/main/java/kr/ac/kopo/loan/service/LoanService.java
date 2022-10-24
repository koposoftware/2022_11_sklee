package kr.ac.kopo.loan.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ac.kopo.loan.vo.ApplyLoanVO;
import kr.ac.kopo.loan.vo.BankAccountVO;
import kr.ac.kopo.loan.vo.LoanProductVO;
import kr.ac.kopo.loan.vo.LoanVO;
import kr.ac.kopo.member.vo.MemberVO;

public interface LoanService {

	// 상품목록 조회
	public List<LoanProductVO> selectLoantProductList(int startNum, int endNum);

	// 대출 신청서 저장
	public void insertLoanApply(ApplyLoanVO applyLoanVO);

	// 기업 회원정보 업데이트
	public void updateMember(MemberVO memberVO);

	// 기업소유 일반계좌 조회
	public List<BankAccountVO> selectFirmAccount(String compName);

	// 대출상품 상세 조회
	public LoanProductVO selectLoanProductDetail(String loanProductCode);

	// 대출상품 검색
	public List<LoanProductVO> searchLoanProduct(String search);

	// 총대출상품 수 조회
	public int selectCountLoanProduct();

	// 검색 된 대출상품 수 조회
	public int searchLoanCount(String search);

	// 대출상품 검색2
	public List<LoanProductVO> searchKeyword(String search);

	// 검색 된 대출상품 수 조회2
	public int searchKeywordCount(String search);

	// 대출 신청 현황조회
	public List<LoanVO> selectLoanAccountApply(String compName);

	// 대출 승인 현황조회
	public List<LoanVO> selectConfirmLoanAccount(String compName);

}
