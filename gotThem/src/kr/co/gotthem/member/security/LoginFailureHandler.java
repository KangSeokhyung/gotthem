package kr.co.gotthem.member.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse res, AuthenticationException auth)
			throws IOException, ServletException {
		System.out.println("인증실패");
		String errMsg = "로그인에 실패하셨습니다. 회원정보를 확인하여 주세요";
		
		req.setAttribute("errMsg",errMsg);
		req.getRequestDispatcher("/WEB-INF/views/member/mlogin.jsp").forward(req, res);
	}
}