package kr.ac.kopo.loan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.loan.dao.LoanDAO;
import kr.ac.kopo.loan.vo.ApplyLoanVO;
import kr.ac.kopo.loan.vo.BankAccountVO;
import kr.ac.kopo.loan.vo.LoanProductVO;
import kr.ac.kopo.loan.vo.LoanVO;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

@Service
public class LoanServiceImpl implements LoanService {
	
	@Autowired
	private LoanDAO loanDAO;
	
	@Autowired
	private MemberDAO memberDAO;

	// 대출상품목록 조회
	@Override
	public List<LoanProductVO> selectLoantProductList(int startNum, int endNum) {
		return loanDAO.selectLoantProductList(startNum, endNum);
	}

	//대출신청서 등록
	@Override
	public void insertLoanApply(ApplyLoanVO applyLoanVO) {
		loanDAO.insertLoanApply(applyLoanVO);
	}

	//회원정보 업데이트
	@Override
	public void updateMember(MemberVO memberVO) {
		memberDAO.updateMember(memberVO);
	}

	// 기업소유 모든 계좌 조회
	@Override
	public List<BankAccountVO> selectFirmAccount(String compName) {
		// TODO Auto-generated method stub
		return loanDAO.selectFirmAccount(compName);
	}

	//대출상세페이지 조회
	@Override
	public LoanProductVO selectLoanProductDetail(String loanProductCode) {
		return loanDAO.selectLoanProductDetail(loanProductCode);
	}

	// 대출상품 검색
	@Override
	public List<LoanProductVO> searchLoanProduct(String search) {
		return loanDAO.searchLoanProduct(search);
	}

	//대출상품 수 조회
	@Override
	public int selectCountLoanProduct() {
		return loanDAO.selectCountLoanProduct();
	}

	//검색된 대출상품 수 조회
	@Override
	public int searchLoanCount(String search) {
		return loanDAO.searchLoanCount(search);
	}

	//대출상품 수 조회 2
	@Override
	public List<LoanProductVO> searchKeyword(String search) {
		return loanDAO.searchKeyword(search);
	}

	// 검색 된 대출상품 수 조회2
	@Override
	public int searchKeywordCount(String search) {
		return loanDAO.searchKeywordCount(search);
	}

	// 대출신청현황 확인
	@Override
	public List<LoanVO> selectLoanAccountApply(String compName) {
		return loanDAO.selectLoanAccountApply(compName);
	}

	// 대출승인현황 조회
	@Override
	public List<LoanVO> selectConfirmLoanAccount(String compName) {
		return loanDAO.selectConfirmLoanAccount(compName);
	}

	
	
	


	

}
