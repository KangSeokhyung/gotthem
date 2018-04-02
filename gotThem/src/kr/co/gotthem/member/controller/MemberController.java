package kr.co.gotthem.member.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.basket.service.BasketService;
import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.mail.MailService;
import kr.co.gotthem.member.service.MemberService;
import kr.co.gotthem.product.bean.ProductBean;
import kr.co.gotthem.product.service.ProductService;

@Controller
public class MemberController {
	 
	private MemberService memberService;
	private MailService mailService;
	private ProductService productService;
	private BasketService basketService;
	
	public void setBasketService(BasketService basketService) {
		this.basketService = basketService;
	}
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Autowired
	public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }

	@RequestMapping(value = "/kakaoLogin.gt", method = RequestMethod.POST)
	public void kakaoLogin(ModelAndView mav, MemberBean memberBean,
			@RequestParam("kakao_id") String id, @RequestParam("kakao_name") String name,
			@RequestParam("kakao_email") String email, @RequestParam("kakao_token") String token, HttpServletResponse response, HttpSession session) throws Exception {
		System.out.println(id + name + email);
		System.out.println(memberBean);
		session.setAttribute("token", token);
		System.out.println(session.getAttribute("token"));
		int result = memberService.duplCheck(email);
		memberBean.setMem_id(email);
		memberBean.setMem_pw(id);
		memberBean.setMem_name(name);
		memberBean.setMem_email(email);
		if (result == 0) {
			System.out.println("아이디 없음");
			memberService.kakaoJoin(memberBean);
		} else {
			System.out.println("아이디 존재");
		}
		System.out.println("아웃문 실행전");
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<form action='login.gt' id='kakaoLogin' method='post'>");
        out.println("<input type='hidden' name='mem_id' value='" + memberBean.getMem_id() + "'>");
        out.println("<input type='hidden' name='mem_pw' value='" + memberBean.getMem_pw() + "'>");
        out.println("</form>");
        out.println("<script type='text/javascript'>");
        out.println("kakaoLogin.submit();");
        out.println("</script>");
	}
    
	@RequestMapping(value = "/login.gt", method = RequestMethod.GET)
	public String login(HttpSession session, HttpServletRequest request, 
			ProductBean product, BasketBean basketBean,
			@RequestParam (required=false) String prevUrl,
			@RequestParam (required=false) String mem_no, 
			@RequestParam (required=false) String search,
			@RequestParam (defaultValue="NO") String gubun,
			@RequestParam (required=false) String checkOne) {
		
		String referer = request.getHeader("referer");
		String path = request.getScheme() + "://"
				+ request.getServerName() + ":"
				+ request.getServerPort()
				+ request.getContextPath()+"/";
		String url = null;
		StringTokenizer st = null;
		String qs = null;
		String prevUrl2 = null;
		
		prevUrl2 = referer.substring(path.length());
		session.setAttribute("prevUrl", prevUrl2);
		
		if (prevUrl2.length() < 2) {
			session.removeAttribute("prevUrl");
		}
		
		if (search != null) {
			url = referer.substring(path.length());
			st = new StringTokenizer(url, "&");
			qs = st.nextToken();
			prevUrl = qs + "&search=" + search; 
			
			session.setAttribute("prevUrl", prevUrl);
		}
		
		if (prevUrl != null && mem_no != null) {  
			session.setAttribute("prevUrl", 
					prevUrl+"?mem_no=" + mem_no +
					"&pro_code=" + product.getPro_code());
		}
		
		if (gubun.equals("pdPage")) {
			session.setAttribute("prevUrl", 
					prevUrl+"?&pro_code=" + product.getPro_code() +
					"&pro_stock=" + product.getPro_stock() + 
					"&gubun=" + gubun);
		} 
		
		if (prevUrl != null && prevUrl.equals("listBasket.gt")) {
			session.setAttribute("prevUrl", prevUrl);
		}
		
		if (prevUrl != null && prevUrl.equals("selectDetailForward.gt")) {
			session.setAttribute("prevUrl", prevUrl);
		}
		
		return "member/mlogin";
	}
	
	@RequestMapping(value = "/logout.gt", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {		
		session.invalidate();
		System.out.println("회원 로그아웃");
		return "redirect:index.jsp";
	}
	
	@RequestMapping(value = "/join.gt", method = RequestMethod.GET)
	public String memberJoin() {	
		return "member/join";
	}
	
	@RequestMapping(value = "/joinSccess.gt", method = RequestMethod.POST)
	public String joinSccess(HttpServletRequest request, MemberBean memberBean, 
			@RequestParam(defaultValue="joinToMember") String gubun, 
			HttpServletResponse response) throws Exception {
		
		//email 세팅하기
		String emailid = request.getParameter("mem_emailid");
		String emailadd = request.getParameter("mem_emailadd");
		String mem_email = emailid + "@" + emailadd;
		memberBean.setMem_email(mem_email);
		
		//phone 세팅하기
		String mem_phoneFront = request.getParameter("mem_phoneFront");
		String mem_phoneMiddle = request.getParameter("mem_phoneMiddle");
		String mem_phoneLast = request.getParameter("mem_phoneLast");
		String mem_phone = mem_phoneFront + mem_phoneMiddle + mem_phoneLast;
		memberBean.setMem_phone(mem_phone);
		
		//address 세팅하기
		memberBean.setMem_address(request.getParameter("mem_post")+"/"+
		request.getParameter("mem_address1")+"/"+request.getParameter("mem_address2"));
		
		// admin에서 회원가입 시 아이디와 동일한 비밀번호
		if (gubun.equals("joinToAdmin") && gubun != null) {
			memberBean.setMem_pw(memberBean.getMem_id());
			memberService.join(memberBean);
			return "redirect:memcontrol.ad";
		} else {
			System.out.println(memberBean);
			memberService.join(memberBean);
		}
		
		return "redirect:index.gt";
	}
	
	@RequestMapping(value = "/duplCheck.gt", method = RequestMethod.POST)
	public String duplCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String mem_id = request.getParameter("mem_id");
		System.out.println(mem_id);
		int result = 0;
		
		result = memberService.duplCheck(mem_id);
		if (result > 0) {
			System.out.println("아이디 존재");
		} else {
			System.out.println("아이디 없음");
		}
		response.getWriter().write(result + "");
		
		return null;
	}
	
	@RequestMapping(value = "loginfail.gt", method= RequestMethod.GET)
	public ModelAndView lgfail(ModelAndView mav) {
		mav.setViewName("store/fail2");
		return mav;
	}
	
	@RequestMapping(value = "/index.gt", method = RequestMethod.GET)
	public String index() {	
		return "redirect:index.jsp";
	}
	
	@RequestMapping(value = "/gotthemInfo.gt", method = RequestMethod.GET)
	public String gotthemInfo() {	
		return "member/gotthemInfo";
	}
	
	@RequestMapping(value = "/mypage.gt", method = RequestMethod.GET)
	public ModelAndView mypage(ModelAndView mav) {
		mav.setViewName("member/mypage");
		return mav;
	}
	
	@RequestMapping(value = "/mypageMemberInfo.gt", method = RequestMethod.GET)
	public ModelAndView memberInfo(ModelAndView mav) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		MemberBean memberInfo = memberService.memberInfo(mem_id);
		String mem_address = memberInfo.getMem_address();
		StringTokenizer st = new StringTokenizer(mem_address,"/");
		String post = st.nextToken();       
		String address1 = st.nextToken();      
		String address2 = st.nextToken();    
		mav.addObject("mem_post", post);
		mav.addObject("mem_address1", address1);
		mav.addObject("mem_address2", address2);
		mav.addObject("memberInfo", memberInfo);
		mav.setViewName("member/mypageMemberInfo");
		return mav;
	}
	
	@RequestMapping(value = "/mypageMemberModi.gt", method = RequestMethod.GET)
	public ModelAndView memberModi(ModelAndView mav) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		MemberBean memberInfo = memberService.memberInfo(mem_id);
		String mem_address = memberInfo.getMem_address();
		StringTokenizer  st = new StringTokenizer(mem_address,"/");
		String post = st.nextToken();       
		String address1 = st.nextToken();      
		String address2 = st.nextToken();      
		mav.addObject("mem_post", post);
		mav.addObject("mem_address1", address1);
		mav.addObject("mem_address2", address2);
		mav.addObject("memberInfo", memberInfo);
		mav.setViewName("member/mypageMemberModi");
		return mav;
	}
	
	@RequestMapping(value = "/memberModi.gt", method = RequestMethod.POST)
	public String memberUpdate(MemberBean bean, @RequestParam("mem_address1") String address1,
			@RequestParam("mem_address2") String address2, @RequestParam("mem_post") String post) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		bean.setMem_id(mem_id);
		String mem_address = post + "/" + address1 + "/" + address2;
		System.out.println(bean);
		bean.setMem_address(mem_address);
		memberService.memberModifi(bean);
		return "member/mypage";
	}
	
	@RequestMapping(value = "/passChange.gt", method = RequestMethod.GET)
	public ModelAndView passCheck(MemberBean bean, ModelAndView mav) {
		mav.setViewName("member/mypagePWChange");
		return mav;
	}
	
	@RequestMapping(value = "/passChange.gt", method = RequestMethod.POST)
	public ModelAndView passCheckPost(@RequestParam("new_pw") String new_pw, @RequestParam("new_pw2") String new_pw2,
			MemberBean bean, ModelAndView mav, HttpServletResponse response) throws Exception {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		System.out.println("비밀번호 변경하러 왔나~");
		bean.setMem_id(mem_id);
		System.out.println("빈 한번 보자 : " + bean);
		int result = memberService.passCheck(bean);
		System.out.println("비밀번호 체크 : " + result);
		if(result != 1) {
			System.out.println("현재비밀번호가 안 맞을때");
			mav.addObject("resultMsg", "fail1");
			mav.setViewName("member/mypageFailPassChange");
		}else if(!new_pw.equals(new_pw2)){
			System.out.println("새로운 비밀번호와 비밀번호 확인이 안 맞을때");
			mav.addObject("resultMsg", "fail2");
			mav.setViewName("member/mypageFailPassChange");
		}else {
			System.out.println("잘 들어왔네");
			bean.setMem_pw(new_pw);
			int changeResult = memberService.changePasswordReal(bean);
			System.out.println("변경결과"+changeResult);
			if(changeResult != 0) {
				System.out.println("비밀번호 변경이 성공했네");
				mav.addObject("resultMsg", "success");
				mav.setViewName("member/mypage");
			}else {
				mav.addObject("resultMsg", "fail3");
				mav.setViewName("member/mypageFailPassChange");
			}
			
		}
		return mav;
	}
	
	@RequestMapping(value = "/mypageMemberDel.gt", method = RequestMethod.GET)
	public ModelAndView memberDel(ModelAndView mav) {
		mav.setViewName("member/mypageMemberDel");
		return mav;
	}
	
	@RequestMapping(value = "/mypageMemberDel.gt", method = RequestMethod.POST)
	public ModelAndView memberDelete(ModelAndView mav, MemberBean bean, HttpSession  session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		bean.setMem_id(mem_id);
		int result = memberService.memberDelete(bean);
		if(result==1) {	//탈퇴 성공하면
			session.invalidate();
			mav.addObject("resultMsg", "DelSuccess");
			mav.setViewName("../../index");
		}else {
			mav.addObject("resultMsg", "DelFail");
			mav.setViewName("member/memberDelFail");
		}
		return mav;
	}
	
	@RequestMapping(value = "/findIDAndPW.gt", method = RequestMethod.GET)
	public ModelAndView findID(ModelAndView mav) {
		mav.setViewName("member/findIDAndPW");
		return mav;
	}
	
    // 아이디 찾기
    @RequestMapping(value = "/findID.gt", method = RequestMethod.POST)
    public String sendMailId(HttpSession session, @RequestParam("mem_email") String email,
    		@RequestParam("mem_name") String name, RedirectAttributes ra, MemberBean bean) {
    	
        System.out.println(bean);
        MemberBean memberBean =  memberService.findAccount(bean);
        System.out.println(memberBean);
        if (memberBean != null) {
            String subject = "Goththem 아이디 찾기 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 아이디는 " + memberBean.getMem_id() + " 입니다.");
            if(mailService != null) {
            	System.out.println(mailService);
            } else {
            	System.out.println(" 빈거" + mailService);
            }
            boolean mailResult = mailService.send(subject, sb.toString(), "gotthembit@gmail.com", email, null);
            
            System.out.println("이메일 보내기 성공?"+ mailResult);
            
            ra.addFlashAttribute("resultMsg", "1");
        } else {
            ra.addFlashAttribute("resultMsg", "2");
        }
        return "redirect:/findIDAndPW.gt";
    }
 
    
    // 비밀번호 찾기
    @RequestMapping(value = "/findPW.gt", method = RequestMethod.POST)
    public String sendMailPassword(HttpSession session, MemberBean bean, @RequestParam("mem_email") String email, RedirectAttributes ra) {
        String mem_id = bean.getMem_id();
        bean= memberService.login(mem_id);
        if (bean != null) {
            if (!bean.getMem_id().equals(mem_id)) {
                ra.addFlashAttribute("resultMsg", "입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.");
                return "redirect:/findIDAndPW.gt";
            }
            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String password = String.valueOf(ran);
            bean.setMem_pw(password);
            bean.setMem_email(email);
            int pwChangeResult = memberService.changePassword(bean); // 해당 유저의 DB정보 변경
            if(pwChangeResult==1) {
            	String subject = "임시 비밀번호 발급 안내 입니다.";
                StringBuilder sb = new StringBuilder();
                sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
                boolean mailResult = mailService.send(subject, sb.toString(), "gotthembit@gmail.com", email, null);
                System.out.println("이메일 보내기 성공?"+ mailResult);
                ra.addFlashAttribute("resultMsg", "3");
            } else {
                ra.addFlashAttribute("resultMsg", "4");
            }
            
        } else {
        	ra.addFlashAttribute("resultMsg", "5");
        }
        return "redirect:/findIDAndPW.gt";
    }
    
    @RequestMapping(value = "/storeDetail.gt")
	public String storeDetail(Model model, int mem_no, @RequestParam(defaultValue="NO") String gubun) {
    	MemberBean storeInfo = memberService.storeInfo(mem_no);
    	
    	model.addAttribute("mem_no", mem_no);
    	model.addAttribute("storeInfo", storeInfo);
    	if (gubun.equals("OK")) {
    		model.addAttribute("gubun", "OK");
    	}
    	
    	return "store/storeDetail";
	}
    
    @RequestMapping(value = "/detailForward.gt")
	public String detailForward(Model model, @RequestParam(required=false) String mem_no,
			ProductBean product, BasketBean basketBean, @RequestParam(defaultValue="NO") String gubun,
			HttpServletResponse response) {
    	int pro_stock = product.getPro_stock();
    	product = productService.productDetail(product.getPro_code());
    	
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String mem_id = authentication.getName();
    	
    	String sto_name = memberService.selectStoName(product.getPro_memno());
    	
    	MemberBean memberInfo = memberService.memberInfo(mem_id);  
        int userNo = memberInfo.getMem_no();
    	basketBean.setBas_memno(userNo);
    	basketBean.setBas_procode(product.getPro_code());
    	basketBean.setBas_proname(product.getPro_name());
    	basketBean.setBas_procategory(product.getPro_category());
    	basketBean.setBas_prostock(1);
    	basketBean.setBas_proprice(product.getPro_price());
    	basketBean.setBas_proimg(product.getPro_img());
    	basketBean.setSto_name(sto_name);
    	
    	if (gubun.equals("pdPage")) {
    		basketBean.setBas_prostock(pro_stock);
        }
    	List<BasketBean> listBasket = null;
        int count = basketService.countBasket(product.getPro_code(), basketBean.getBas_memno());
        if (count == 0) {
        	 basketService.insertBasket(basketBean);      	 
        	 System.out.println("첫 상품 장바구니 인서트");
        	 listBasket = basketService.listBasket(userNo);
      	    
        } else {    // 있으면 update, 동일 상품 존재시 기존 수량에 새로운 수량 더하기
        	basketService.updateBasket(basketBean);
			System.out.println("존재하는 상품 인서트");
        	listBasket = basketService.listBasket(userNo);
        }
        
        Cookie cookie = new Cookie("confirm", "OK");
    	cookie.setMaxAge(10);  
    	cookie.setPath("/");
    	response.addCookie(cookie);
        
        if (gubun.equals("pdPage")) {
        	model.addAttribute("pro_code", product.getPro_code());
        	return "redirect:/productDetail.gt";
        } else {
        	model.addAttribute("mem_no", mem_no);
        	model.addAttribute("gubun", "OK");
        }
    	
    	return "redirect:/storeDetail.gt";
	}
    
    @RequestMapping(value = "/selectDetailForward.gt")
	public String selectDetailForward(Model model,
			HttpServletResponse response, HttpSession session,
			ProductBean product, BasketBean basketBean, 
			@RequestParam(defaultValue="NO") String gubun) {
    	
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String mem_id = authentication.getName();
    
    	MemberBean memberInfo = memberService.memberInfo(mem_id);  
        int userNo = memberInfo.getMem_no();
        basketBean.setBas_memno(userNo); 
        
        // 세션 제거 필요 (stodetail.gt에서 3개다)
        String sto_name = (String) session.getAttribute("sto_name");
        List checkList = (List) session.getAttribute("checkList");
        String checkOne = (String) session.getAttribute("checkOne");
        
		StringTokenizer st = null;
		String row = null;
		
		if (checkOne != null) { 
			st = new StringTokenizer(checkOne, ",");
			String bas_procode = st.nextToken();
			String bas_proname = st.nextToken();
			String pro_memno = st.nextToken();
			String bas_procategory = st.nextToken();
			String bas_prostock = st.nextToken();
			String bas_proprice = st.nextToken();
			String bas_proimg = st.nextToken();
			
			basketBean.setBas_procode(Integer.parseInt(bas_procode));
			basketBean.setBas_proname(bas_proname);
			basketBean.setBas_procategory(bas_procategory);
			basketBean.setBas_prostock(1);
			basketBean.setBas_proprice(Integer.parseInt(bas_proprice));
			basketBean.setBas_proimg(bas_proimg);
			basketBean.setPro_memno(Integer.parseInt(pro_memno));
			basketBean.setSto_name(sto_name);
			
	        int count = basketService.countBasket(basketBean.getBas_procode(),basketBean.getBas_memno());
	        if (count == 0) {
	        	basketService.insertBasket(basketBean);
	        	System.out.println("첫 상품 장바구니 인서트");
	        } else {
	        	basketService.updateBasket(basketBean);
	        	System.out.println("존재하는 상품 인서트");
	        }
	        
	        model.addAttribute("mem_no", pro_memno);
		} else {
			String pro_memno = null;
			for (int i = 0; i < checkList.size(); i++) {
				row = (String) checkList.get(i);		
				
				st = new StringTokenizer(row, ",");
				
				String bas_procode = st.nextToken();
				String bas_proname = st.nextToken();
				pro_memno = st.nextToken();
				String bas_procategory = st.nextToken();
				String bas_prostock = st.nextToken();
				String bas_proprice = st.nextToken();
				String bas_proimg = st.nextToken();
				
				basketBean.setBas_procode(Integer.parseInt(bas_procode));
				basketBean.setBas_proname(bas_proname);
				basketBean.setBas_procategory(bas_procategory);
				basketBean.setBas_prostock(1);
				basketBean.setBas_proprice(Integer.parseInt(bas_proprice));
				basketBean.setBas_proimg(bas_proimg);
				basketBean.setPro_memno(Integer.parseInt(pro_memno));
				basketBean.setSto_name(sto_name);
				
		        int count = basketService.countBasket(basketBean.getBas_procode(),basketBean.getBas_memno());
		        if (count == 0) {
		        	basketService.insertBasket(basketBean);
		        	System.out.println("첫 상품 장바구니 인서트");
		        } else {
		        	basketService.updateBasket(basketBean);
		        	System.out.println("존재하는 상품 인서트");
		        }
			}
			model.addAttribute("mem_no", pro_memno);
		}
    	
		Cookie cookie = new Cookie("confirm", "OK2");
    	cookie.setMaxAge(10);  
    	cookie.setPath("/");
    	response.addCookie(cookie);
    	
    	return "redirect:/storeDetail.gt";
    }
    
	@RequestMapping(value = "/sessionSet.gt")
	@ResponseBody
	public void sessionSet(HttpSession session, String sto_name,
			@RequestParam (required=false) String checkOne,
			@RequestParam (required=false, value="checkList[]") List checkList) {
    	if (checkOne != null && !(checkOne.equals(""))) {
    		session.setAttribute("checkOne", checkOne);
    		session.setAttribute("sto_name", sto_name);
    	} 
    	session.setAttribute("checkList", checkList);
    	session.setAttribute("sto_name", sto_name);
    }
	
    @RequestMapping(value = "/productList.gt")
	public String productList(Model model, int mem_no, String category, String sto_name) {
    	List productInfo = productService.productInfo(mem_no, category);
		model.addAttribute("productInfo", productInfo);
		model.addAttribute("sto_name", sto_name);
		
		return "product/productTable";
	}
}
