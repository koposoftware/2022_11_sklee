package kr.ac.kopo.member.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.member.vo.MemberVO;

@Mapper
public interface MemberDAO {

	// 로그인 회원 조회
	public MemberVO selectCompMember(MemberVO member);

	// 기업 회원정보 업데이트
	public void updateMember(MemberVO memberVO);

}
