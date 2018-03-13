package kr.co.gotthem.admin.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.service.MemberService;

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value = "/admin.ad", method = RequestMethod.GET)
	public String storeIndex() {
		System.out.println("아에이오우!");
		return "admin/adminLogin";
	}

	@RequestMapping(value = "/control.ad", method = RequestMethod.GET)
	public ModelAndView ccc(ModelAndView mav) {
		System.out.println("최종 관리자 로그인 진입");

		mav.setViewName("admin/controlPage");
		
		return mav;
	}
		
	@RequestMapping(value = "/memcontrol.ad", method = RequestMethod.GET)
	public ModelAndView member(ModelAndView mav, HttpServletRequest request) {
        
		List<MemberBean> mlist = null;
		
		String tempNo = request.getParameter("pageNo");
		int pageNo = 1;
		try {
			pageNo = Integer.parseInt(tempNo);
		} catch (Exception e) {
			// null 이거나, 문자를 숫자로 바꾸려 해서 에러가 나거나 무조건 pageNo=1
		}
		if (request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		
		
		final int ROW_PER_PAGE = 5; // 페이지당 레코드 출력 갯수
		int begin = (pageNo - 1) * ROW_PER_PAGE;
		int end = pageNo * ROW_PER_PAGE;
		mlist = memberService.mlist(begin, end);// 시작 페이지와 끝 페이지를 조건으로 리스트 가져오기
		
		
		int totalRows = memberService.countRow(); // 전체 게시물 갯수
		int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);
		// 전체 페이지 갯수

		final int PAGE_PER_PAGE = 5; // 화면당 페이지 출력 갯수
		int totalRanges = (int) Math.ceil((double) totalPages
				/ PAGE_PER_PAGE); // 전체 Range 갯수
		int currentRange = (int) Math.ceil((double) pageNo / PAGE_PER_PAGE);
		//요청된 pageNo의 현재 range
		int beginPage = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
		int endPage = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
		if (currentRange == totalRanges)
			endPage = totalPages; // currentRange가 맨 마지막 range인 경우

		int prevPage = 0;
		if (currentRange != 1)
			prevPage = (currentRange - 2) * PAGE_PER_PAGE + 1;
		int nextPage = 0;
		if (currentRange != totalRanges)
			nextPage = currentRange * PAGE_PER_PAGE + 1;
		
		mav.addObject("ROW_PER_PAGE", ROW_PER_PAGE);
		mav.addObject("begin", begin); 
		mav.addObject("end", end); 
		mav.addObject("pageNo", pageNo);
		mav.addObject("totalRows", totalRows); 
		mav.addObject("totalPages",totalPages); 
		mav.addObject("totalRanges",totalRanges);
		mav.addObject("currentRange",currentRange);
		mav.addObject("beginPage", beginPage); 
		mav.addObject("endPage", endPage); 
		mav.addObject("prevPage", prevPage);
		mav.addObject("nextPage", nextPage);
		mav.addObject("mlist", mlist);
		mav.setViewName("admin/memberControl");

		return mav;

	}
	
	@RequestMapping(value = "/memmodify.ad", method = RequestMethod.POST)
	public String memmodi(@RequestParam(required=false) String enable,
			MemberBean membean, HttpServletRequest request) {
		
		int approve = 0;

		if(enable.equals("가입")) {
			approve = 1;
		} else {
			approve = 0;
		}
		
		String id = (String)membean.getMem_id();

		membean.setMem_id(request.getParameter("mem_id"));
		membean.setMem_name(request.getParameter("mem_name"));
		membean.setMem_email(request.getParameter("mem_email"));
		membean.setMem_phone(request.getParameter("mem_phone"));
		membean.setMem_address(request.getParameter("mem_addr1")+"/"+
		request.getParameter("mem_addr2")+"/"+request.getParameter("mem_addr3"));
		membean.setEnabled(approve);
		
		memberService.memModi(membean);
		
		return "redirect:memcontrol.ad";
	}

	@RequestMapping(value = "/storecontrol.ad", method = RequestMethod.GET)
	public ModelAndView store(ModelAndView mav, HttpServletRequest request) {
		List<MemberBean> stlist = null;
		
		String tempNo = request.getParameter("pageNo");
		int pageNo = 1;
		try {
			pageNo = Integer.parseInt(tempNo);
		} catch (Exception e) {
			// null 이거나, 문자를 숫자로 바꾸려 해서 에러가 나거나 무조건 pageNo=1
		}
		if (request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		
		
		final int ROW_PER_PAGE = 5; // 페이지당 레코드 출력 갯수
		int begin = (pageNo - 1) * ROW_PER_PAGE;
		int end = pageNo * ROW_PER_PAGE;
		stlist = memberService.stlist(begin);// 시작 페이지와 끝 페이지를 조건으로 리스트 가져오기
		
		
		int totalRows = memberService.stcountRow(); // 전체 게시물 갯수
		int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);
		// 전체 페이지 갯수

		final int PAGE_PER_PAGE = 5; // 화면당 페이지 출력 갯수
		int totalRanges = (int) Math.ceil((double) totalPages
				/ PAGE_PER_PAGE); // 전체 Range 갯수
		int currentRange = (int) Math.ceil((double) pageNo / PAGE_PER_PAGE);
		//요청된 pageNo의 현재 range
		int beginPage = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
		int endPage = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
		if (currentRange == totalRanges)
			endPage = totalPages; // currentRange가 맨 마지막 range인 경우

		int prevPage = 0;
		if (currentRange != 1)
			prevPage = (currentRange - 2) * PAGE_PER_PAGE + 1;
		int nextPage = 0;
		if (currentRange != totalRanges)
			nextPage = currentRange * PAGE_PER_PAGE + 1;
		
		
		mav.addObject("ROW_PER_PAGE", ROW_PER_PAGE);
		mav.addObject("begin", begin); 
		mav.addObject("end", end); 
		mav.addObject("pageNo", pageNo);
		mav.addObject("totalRows", totalRows); 
		mav.addObject("totalPages",totalPages); 
		mav.addObject("totalRanges",totalRanges);
		mav.addObject("currentRange",currentRange);
		mav.addObject("beginPage", beginPage); 
		mav.addObject("endPage", endPage); 
		mav.addObject("prevPage", prevPage);
		mav.addObject("nextPage", nextPage);
		mav.addObject("stlist", stlist);
		mav.setViewName("admin/storeControl");

		return mav;
	}
	
	@RequestMapping(value = "/storemodify.ad", method = RequestMethod.POST)
	public String storemodi(ModelAndView mav, 
		@RequestParam(required=false) String enable, 
		MemberBean mbean, HttpServletRequest request, HttpSession session) {		
		
		int approve = 0;
		
		if(enable.equals("승인완료")) {
			approve = 1;
		} else {
			approve = 0;
		}

		mbean.setMem_id(request.getParameter("mem_id"));
		mbean.setMem_name(request.getParameter("mem_name"));
		mbean.setSto_name(request.getParameter("sto_name"));
		mbean.setMem_email(request.getParameter("mem_email"));
		mbean.setMem_phone(request.getParameter("mem_phone"));
		mbean.setMem_address(request.getParameter("mem_addr1")+"/"+
		request.getParameter("mem_addr2")+"/"+request.getParameter("mem_addr3"));
		mbean.setEnabled(approve);
		
		memberService.memModi(mbean);
	
		return "redirect:storecontrol.ad";

	}
	
}
