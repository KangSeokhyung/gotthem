package kr.co.gotthem.product.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.service.MemberService;
import kr.co.gotthem.product.bean.ProductBean;
import kr.co.gotthem.product.bean.SearchBean;
import kr.co.gotthem.product.service.ProductService;

@Controller
public class ProductController {
	private ProductService productService;
	private MemberService memberService;
	private MongoTemplate mongoTemplate;
	
	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value = "/stock.st", method = RequestMethod.GET)
	public String stock(Model model, @RequestParam int pageNo) throws Exception {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		MemberBean memberInfo = memberService.memberInfo(mem_id);
		int pro_memno = memberInfo.getMem_no();

		productService.plist(model, pro_memno, pageNo);
		return "product/stock";
	}

	@RequestMapping(value = "/detail.st", method = RequestMethod.GET)
	protected ModelAndView handleRequestInternal(HttpServletRequest req, @RequestParam int pageNo) throws Exception {

		ModelAndView mav = new ModelAndView();
		int code = ServletRequestUtils.getIntParameter(req, "code");
		ProductBean bean = productService.findCode(code);
		mav.setViewName("product/detail");
		mav.addObject("pro", bean);
		mav.addObject("pageNo", pageNo);

		return mav;
	}

	@RequestMapping(value = "/update.st", method = RequestMethod.GET)
	protected ModelAndView movieUpdateForm(HttpServletRequest req, ModelAndView mav, @RequestParam int pageNo) {
		ProductBean bean = productService.findCode(Integer.parseInt(req.getParameter("code")));
		mav.setViewName("product/update");
		mav.addObject("pro", bean);
		mav.addObject("pageNo", pageNo);

		return mav;
	}

	@RequestMapping(value = "/update.st", method = RequestMethod.POST)
	protected ModelAndView updateProcess(@ModelAttribute ProductBean bean, HttpServletRequest req,
			@RequestParam MultipartFile file, @RequestParam int pageNo) throws Exception {

		InputStream inputStream = null;
		OutputStream outputStream = null;

		// 업로드된 파일을 임의의 경로로 이동한다
		String fileName = file.getOriginalFilename();
		bean.setPro_img(fileName);
		if (bean.getPro_img() == null || bean.getPro_img() == "") {
			bean.setPro_img(req.getParameter("pro_img"));
		} else {
			try {

				inputStream = file.getInputStream();

				File newFile = new File("D:\\outupload/" + fileName);
				if (!newFile.exists()) {
					newFile.createNewFile();
				}
				outputStream = new FileOutputStream(newFile);

				int read = 0;
				byte[] bytes = new byte[1024 * 1024];

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

		String code = req.getParameter("pro_code");
		productService.updatePro(bean);
		return new ModelAndView("redirect:/detail.st?pageNo=" + pageNo + "&code=" + code);
	}

	@RequestMapping(value = "/delete.st", method = RequestMethod.POST)
	protected ModelAndView deleteProcess(HttpServletRequest req, @RequestParam int pageNo) {

		int code = Integer.parseInt(req.getParameter("pro_code"));
		productService.deletePro(code);
		ModelAndView mav = new ModelAndView("redirect:/stock.st?pageNo=" + pageNo);

		return mav;
	}

	@RequestMapping(value = "/insert.st", method = RequestMethod.GET)
	protected ModelAndView handleRequestInternal(ModelAndView mav, @RequestParam int pageNo) throws Exception {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();

		MemberBean bean = memberService.memberInfo(mem_id);
		mav.setViewName("product/insert");
		mav.addObject("pro", bean);
		mav.addObject("pageNo", pageNo);

		return mav;
	}

	@RequestMapping(value = "/insert.st", method = RequestMethod.POST)
	public ModelAndView handleRequestInternal(HttpServletRequest req, @RequestParam int pageNo,
			@ModelAttribute ProductBean bean, @RequestParam MultipartFile file) throws Exception {
		int pro_memno = (Integer.parseInt(req.getParameter("mem_no")));

		InputStream inputStream = null;
		OutputStream outputStream = null;

		// 업로드된 파일을 임의의 경로로 이동한다
		String fileName = file.getOriginalFilename();
		bean.setPro_img(fileName);
		if (bean.getPro_img() == null || bean.getPro_img() == "") {
			bean.setPro_img("no_img.jpg");
		} else {
			try {

				inputStream = file.getInputStream();

				File newFile = new File("D:\\outupload/" + fileName);
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

		bean.setPro_memno(pro_memno);
		productService.insertPro(bean);
		ModelAndView mav = new ModelAndView("redirect:/stock.st?pageNo=" + pageNo);

		return mav;
	}

	@RequestMapping(value = "/relatedSearch.gt", method = RequestMethod.POST)
	public void relatedSearch(Model model, String search, HttpServletResponse response) throws IOException {
		Query query = new Query();
		query.addCriteria(Criteria.where("search").regex(search));
		
		// 맵으로 돌릴 필요 없이 리스트를 맵 형태로 받는게 좋을 듯하다. 나중에 수정해보기
		List<SearchBean> list = mongoTemplate.find(query, SearchBean.class, "relatedsearch");
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < list.size(); i++) {
			map.put("search"+ i, list.get(i).getSearch());
		}
		
		String jsonData = new ObjectMapper().writeValueAsString(map);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println(jsonData);
	}
	
	@RequestMapping(value = "/searchList.gt", method = RequestMethod.GET)
	public String searchList(Model model, @RequestParam String search, @RequestParam int pageNo) {
		productService.searchList(model, search, pageNo);
					
		return "product/searchList";
	}
	
	@RequestMapping(value = "/productSearch.gt", method = RequestMethod.POST, produces="text/plain; charset=utf-8")
	@ResponseBody
	public String productSearch(Model model, @RequestParam String productSearch, int mem_no) throws JsonGenerationException, JsonMappingException, IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productSearch", productSearch);
		map.put("mem_no", mem_no);
		
		List productList = productService.productSearchList(map);
		String jProductList = new ObjectMapper().writeValueAsString(productList);
		
		return jProductList;
	}
	
	@RequestMapping(value = "/productDetail.gt")
	public String productDetail(Model model, ProductBean productInfo, String sto_name) {
		
		productInfo = productService.productDetail(productInfo.getPro_code());
		
		model.addAttribute("productInfo", productInfo);
		model.addAttribute("sto_name", sto_name);
		
		return "product/productDetail";
	}
	
	@RequestMapping(value = "/selectSearch.st", method = RequestMethod.GET)
	public ModelAndView selectSearch(ModelAndView mav, String select, String search,
			@RequestParam(defaultValue="1") int pageNo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		MemberBean memberInfo = memberService.memberInfo(mem_id);
		int pro_memno = memberInfo.getMem_no();
		
		List<ProductBean> plist = null;
		
		final int ROW_PER_PAGE = 10; // 페이지당 레코드 출력 갯수
		int begin = (pageNo - 1) * ROW_PER_PAGE;
		int end = pageNo * ROW_PER_PAGE;
		
		plist = productService.proSelectSearch(begin, select, search, pro_memno);
		System.out.println();
		
		int totalRows = plist.size(); // 전체 게시물 갯수
		int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);

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
		mav.addObject("plist", plist);
		mav.setViewName("product/stock");
		
		return mav;
	}
}
