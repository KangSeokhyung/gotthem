package kr.co.gotthem.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gotthem.notice.bean.NoticeBean;
import kr.co.gotthem.notice.service.NoticeService;

@Controller
public class NoticeController {
	private NoticeService noticeService;
	
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	@RequestMapping(value = "/notice.gt", method = RequestMethod.GET)
	public ModelAndView noticeBoard(ModelAndView mav, HttpServletRequest request) {	
		List<NoticeBean> mlist = null;
		
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
		
		
		final int ROW_PER_PAGE = 10; // 페이지당 레코드 출력 갯수
		int begin = (pageNo - 1) * ROW_PER_PAGE;
		int end = pageNo * ROW_PER_PAGE;
		mlist = noticeService.noticeListSelect(begin, end);// 시작 페이지와 끝 페이지를 조건으로 리스트 가져오기
		System.out.println("mlist" + mlist);
		int totalRows = noticeService.countRow(); // 전체 게시물 갯수
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
		mav.setViewName("board/notice");
		System.out.println("mlist는 : "+mlist);

		return mav;
	}
	@RequestMapping(value = "/createContent.gt", method = RequestMethod.GET)
	public ModelAndView createContent(ModelAndView mav, HttpServletRequest request) {	
		mav.setViewName("board/createContent");
		return mav;
	}
	@RequestMapping(value = "/createContent.gt", method = RequestMethod.POST)
	public ModelAndView createContentSuccess(ModelAndView mav, HttpServletRequest request, NoticeBean bean) {	
		noticeService.createContent(bean);
		mav.setViewName("redirect:/notice.gt");
		return mav;
	}
	@RequestMapping(value = "/contentDetail.gt", method = RequestMethod.GET)
	public ModelAndView ContentDetail(ModelAndView mav, HttpServletRequest request,@RequestParam int not_no) {	
		noticeService.addHit(not_no);
		NoticeBean bean = noticeService.selectContent(not_no);
		mav.addObject("content",bean);
		mav.setViewName("board/ContentDetail");
		return mav;
	}
	@RequestMapping(value = "/contentDelete.gt", method = RequestMethod.GET)
	public ModelAndView contentDelete(ModelAndView mav, HttpServletRequest request, @RequestParam int not_no) {	
		noticeService.contentDelete(not_no);
		mav.setViewName("redirect:/notice.gt");
		return mav;
	}
	@RequestMapping(value = "/contentUpdate.gt", method = RequestMethod.POST)
	public ModelAndView contentUpdate(ModelAndView mav, HttpServletRequest request, NoticeBean bean,@RequestParam int not_no) {	
		noticeService.contentUpdate(bean);
		mav.setViewName("redirect:/contentDetail.gt?not_no="+not_no);
		return mav;
	}
}
	