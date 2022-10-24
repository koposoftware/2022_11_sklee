package kr.ac.kopo.member.controller;


import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;


import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;


@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberServiceImpl;
	
	//로그인 페이지
	@RequestMapping("signin")
	public String login(Model model) {
		MemberVO memberVO = new MemberVO();
		MemberVO memberVO1 = new MemberVO();
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("memberVO1", memberVO1);
		return "member/login";
	}
	
	//로그인 확인
	@PostMapping("/login")
	public String loginPost(MemberVO member,BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			return "member/login";
		} else {
			
			MemberVO authMember = memberServiceImpl.confirmLogin(member);
			
			if(authMember == null) {
				//아이디와 비밀번호가 유효하지 않은 경우
				return "member/login";
			}else {
				//성공적으로 로그인 한 경우
				model.addAttribute("loginVO", authMember);
				session.setAttribute("loginVO", authMember);
				return "redirect:/";
			}
		}
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus, HttpSession session) {
		sessionStatus.setComplete();
		session.invalidate();

		return "redirect:/";
	}

		
}