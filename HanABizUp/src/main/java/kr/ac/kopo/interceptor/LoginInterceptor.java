package kr.ac.kopo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.ac.kopo.member.vo.MemberVO;

@Component
public class LoginInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String dest = request.getRequestURI();
		dest=dest.substring(request.getContextPath().length());
		
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		session.setAttribute("dest", dest);
		if(loginVO == null) {
			//로그인 안 된 경우
			
			response.sendRedirect(request.getContextPath() + "/signin");
			return false;
		}else {
			//로그인된 경우
			return true;
		}
	}
}
