package kr.co.gotthem.store.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.mail.MailService;
import kr.co.gotthem.member.service.MemberService;

@Controller
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	private MemberService memberService;
	private MailService mailService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Autowired
	public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }
	
	@RequestMapping(value = "/join.st", method = RequestMethod.GET)
	public String join(HttpServletRequest request, HttpSession session) throws Exception{
		
		 /*String dbpw = encoder.saltEncoding(passwd, email);
		 Map<String, String> paramMap = new HashMap<String, String>();
		 paramMap.put("email", email);
		 paramMap.put("passwd", dbpw);
		 int result = dao.insertUser(paramMap);
		 logger.info("result ===> {}", result);		
		
		
		/*int result = memberService.joinStore(stBean);*/
		/*System.out.println(result);*/
	
		return "store/join";
	}
	
	@RequestMapping(value = "/join.st", method = RequestMethod.POST)
	public ModelAndView stjoin(HttpServletRequest request, HttpSession session, ModelAndView mav) throws Exception{
		
		MemberBean stBean = new MemberBean();
		stBean.setSto_permitstatus("승인대기");
		stBean.setMem_id(request.getParameter("mem_id"));
		stBean.setMem_pw(request.getParameter("mem_pw"));
		stBean.setMem_name(request.getParameter("mem_name"));
		stBean.setSto_name(request.getParameter("sto_name"));
		stBean.setMem_phone(request.getParameter("mem_phone"));
		stBean.setMem_address(request.getParameter("mem_addr1") + "/" +
				request.getParameter("mem_addr2") + "/" + request.getParameter("mem_addr3"));
		stBean.setMem_email(request.getParameter("mem_email"));
		
		System.out.println(stBean);	
		
		int result = memberService.stjoin(stBean);
		System.out.println(result);
		if(result==1) {
			System.out.println("값 넣었니?");
			mav.addObject("reMsg","1");
		}
		System.out.println("모델에 들어있는 값  : " + mav.getModel());
		mav.setViewName("store/stLogin");
		return mav;
	}
	
	@RequestMapping(value = "/login.st", method = RequestMethod.GET)
	public String stlogin(HttpServletRequest request, HttpSession session) throws Exception{
		System.out.println("로그인 페이지 진입했다.");
		return "store/stLogin";
	}
	
	@RequestMapping(value = "/logout.st", method = RequestMethod.GET)
	public String stlogout(HttpServletRequest request, HttpSession session) throws Exception{
		session.invalidate();	
		System.out.println("로그아웃 했다.");
		return "store/stLogin";
	}
	
	@RequestMapping(value = "/mystore.st", method = RequestMethod.GET)
	public ModelAndView mystore(ModelAndView mav) throws Exception{
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
		mav.addObject("info", memberInfo);
		mav.setViewName("store/mystore");
		return mav;
	}

	@RequestMapping(value = "/mystoreModi.st", method = RequestMethod.GET)
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
		mav.setViewName("store/mystoreModi");
		return mav;
	}
	
	@RequestMapping(value = "/storeModi.st", method = RequestMethod.POST)
	public String memberUpdate(HttpServletRequest req, MemberBean bean,
			@RequestParam("mem_address1") String address1,@RequestParam("mem_address2") String address2,
			@RequestParam("mem_post") String post, @RequestParam MultipartFile file) {
		
		String mem_address = post + "/" + address1 + "/" + address2;
		bean.setMem_address(mem_address);
		
		InputStream inputStream = null;
		OutputStream outputStream = null;

		// 업로드된 파일을 임의의 경로로 이동한다
		String fileName = file.getOriginalFilename();
		bean.setSto_img(fileName);
		if (bean.getSto_img() == null || bean.getSto_img() == "") {
			bean.setSto_img(req.getParameter("sto_img"));
		} else {
			try {

				inputStream = file.getInputStream();

				File newFile = new File("D:\\outupload/store/" + fileName);
				if (!newFile.exists()) {
					newFile.createNewFile();
				}
				outputStream = new FileOutputStream(newFile);

				int read = 0;
				byte[] bytes = new byte[1024 * 10];

				while ((read = inputStream.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
				}
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		memberService.storeModi(bean);
		return "redirect:/mystore.st";
	}

	
	@RequestMapping(value = "/passCheck.st", method = RequestMethod.GET)
	public ModelAndView passCheck(MemberBean bean, ModelAndView mav) {
		mav.setViewName("store/mystorePWCheck");
		return mav;
	}
	
	@RequestMapping(value = "/passCheck.st", method = RequestMethod.POST)
	public ModelAndView passCheckPost(MemberBean bean, ModelAndView mav, PrintWriter out, HttpServletResponse response)
			throws Exception {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		bean.setMem_id(mem_id);
		String mem_pw = bean.getMem_pw();
		System.out.println(mem_pw);
		int result = memberService.passCheck(bean);

		if(result == 0) {
			response.setContentType("text/html; charset=UTF-8");
			out = response.getWriter();
			out.println("<Script>");
			out.println("alert('비밀번호를 확인해 주세요');");
			out.println("history.go(-1);");
			out.println("</Script>");
			return null;
		}
		System.out.println(result);
		mav.addObject("passCheck", result);
		mav.setViewName("store/changePW");
		return mav;
	}
	
	@RequestMapping(value = "/mystoreDel.st", method = RequestMethod.GET)
	public ModelAndView memberDel(ModelAndView mav, MemberBean bean) {
		mav.setViewName("store/mystoreDel");
		mav.addObject("bean", bean);
		return mav;
	}
	
	@RequestMapping(value = "/mystoreDel.st", method = RequestMethod.POST)
	public ModelAndView memberDelete(ModelAndView mav, MemberBean bean, HttpSession  session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		bean.setMem_id(mem_id);
		int result = memberService.memberDelete(bean);
		if(result==1) {	//탈퇴 성공하면
			session.invalidate();
			System.out.println("해지성공");
			mav.addObject("resultMsg", "DelSuccess");
			mav.setViewName("store/stLogin");
		}else {
			System.out.println("해지실패");
			mav.addObject("resultMsg", "storeDelFail");
			mav.setViewName("store/storeDelFail");
		}
		return mav;
	}
	
	@RequestMapping(value = "/findId.st", method = RequestMethod.GET)
	public ModelAndView findID(ModelAndView mav) {
		mav.setViewName("store/findId");
		return mav;
	}
	
	@RequestMapping(value = "/findPw.st", method = RequestMethod.GET)
	public ModelAndView findPW(ModelAndView mav) {
		mav.setViewName("store/findPw");
		return mav;
	}

	@RequestMapping(value = "loginfail.st", method= RequestMethod.GET)
	public String lgfail(HttpServletRequest request) {
		String id = (String)request.getParameter("sto_id");
		System.out.println(id);
		return "store/fail2";
	}
	
	// 아이디 찾기
    @RequestMapping(value = "/findId.st", method = RequestMethod.POST)
    public ModelAndView sendMailId(HttpSession session, @RequestParam("mem_email") String email,
    		@RequestParam("mem_name") String name, ModelAndView mav, MemberBean bean) {
    	
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
            
            mav.addObject("resultMsg", "1");
        } else {
        	mav.addObject("resultMsg", "2");
        }
        mav.setViewName("store/findId");
        return mav;
    }
    
    // 비밀번호 찾기
    @RequestMapping(value = "/findPw.st", method = RequestMethod.POST)
    public ModelAndView sendMailPassword(HttpSession session, MemberBean bean, @RequestParam("mem_email") String email,
    		ModelAndView mav) {
        String mem_id = bean.getMem_id();
        bean= memberService.login(mem_id);
        if (bean != null) {
            if (!bean.getMem_id().equals(mem_id)) {
                mav.addObject("resultMsg", "6");
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
                mav.addObject("resultMsg", "3");
            } else {
            	mav.addObject("resultMsg", "4");
            }
            
        } else {
        	mav.addObject("resultMsg", "5");
        }
        mav.setViewName("store/findPw");
        return mav;
    }

    @RequestMapping(value = "/passWordChange.st", method= RequestMethod.GET)
	public String passChange(HttpServletRequest request) {
		return "store/changePassWord";
	}
    
    @RequestMapping(value = "/passWordChange.st", method = RequestMethod.POST)
	public ModelAndView passCheckPost(@RequestParam("new_pw1") String new_pw, @RequestParam("new_pw2") String new_pw2,
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
			mav.setViewName("store/changePassWord");
		}else if(!new_pw.equals(new_pw2)){
			System.out.println("새로운 비밀번호와 비밀번호 확인이 안 맞을때");
			mav.addObject("resultMsg", "fail2");
			mav.setViewName("store/changePassWord");
		}else {
			System.out.println("잘 들어왔네");
			bean.setMem_pw(new_pw);
			int changeResult = memberService.changePasswordReal(bean);
			System.out.println("변경결과"+changeResult);
			if(changeResult != 0) {
				System.out.println("비밀번호 변경이 성공했네");
				mav.addObject("resultMsg", "success");
				mav.setViewName("store/stLogin");
			}else {
				mav.addObject("resultMsg", "fail3");
				mav.setViewName("store/changePassWord");
			}
			
		}
		return mav;
	}
}
