package kr.ac.kopo.member.service;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberService {

	//로그인
	public MemberVO confirmLogin(MemberVO member);
	
}
