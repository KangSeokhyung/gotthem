package kr.co.gotthem.member.security;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*import org.springframework.beans.factory.annotation.Autowired;*/
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.basket.service.BasketService;
import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.service.MemberService;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	
	private MemberService memberService;
	private BasketService basketService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	public void setBasketService(BasketService basketService) {
		this.basketService = basketService;
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication auth)
			throws IOException, ServletException {
		System.out.println("인증됨");
		 UserDetails u = (UserDetails) auth.getPrincipal();
		 String a = u.getUsername();
		 System.out.println("Username은 " + a );

		 MemberBean memberInfo = memberService.memberInfo(a);
		 int userNo = memberInfo.getMem_no();
		 BasketBean basketBean = new BasketBean();
		 basketBean.setBas_memno(userNo);
		 List<BasketBean> listBasket = basketService.listBasket(userNo);
		 HttpSession session = req.getSession();
		 session.setAttribute("count", listBasket.size());
		 
		 res.sendRedirect(req.getContextPath()+"/");
	}

}
