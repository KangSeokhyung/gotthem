package kr.co.gotthem.member.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*import org.springframework.beans.factory.annotation.Autowired;*/
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication auth)
			throws IOException, ServletException {
		System.out.println("인증됨");
		UserDetails u = (UserDetails) auth.getPrincipal();
		String a = u.getUsername();
		System.out.println("Username은 " + a );

		HttpSession session = req.getSession();
		  
		String prevUrl = (String) session.getAttribute("prevUrl");
		if (prevUrl != null) {
			session.removeAttribute("prevUrl");
			res.sendRedirect(prevUrl);
		} else {
			res.sendRedirect(req.getContextPath()+"/");
		}
	}
}
