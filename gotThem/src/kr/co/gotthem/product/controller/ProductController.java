package kr.co.gotthem.product.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.servlet.ModelAndView;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.service.MemberService;
import kr.co.gotthem.product.bean.ProductBean;
import kr.co.gotthem.product.bean.SearchBean;
import kr.co.gotthem.product.service.ProductService;
import kr.co.gotthem.store.controller.StoreController;

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
	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws Exception {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		
		MemberBean memberInfo =  memberService.memberInfo(mem_id);
		int pro_stono = memberInfo.getMem_no();
		
		System.out.println("stono = " + pro_stono);
		List<ProductBean> result = productService.plist(pro_stono);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/stock");
		mav.addObject("plist",result);
		
		return mav;
	}
	
	@RequestMapping(value = "/detail.st", method = RequestMethod.GET)
	protected ModelAndView handleRequestInternal(HttpServletRequest req) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		int code = ServletRequestUtils.getIntParameter(req, "code");
		System.out.println("code = " + code);
		ProductBean bean = productService.findCode(code);
		mav.setViewName("product/detail");
		mav.addObject("pro",bean);
		
		return mav;
	}
	
	@RequestMapping(value="/update.st", method=RequestMethod.GET)
	protected ModelAndView movieUpdateForm(HttpServletRequest req, ModelAndView mav){
		ProductBean bean = productService.findCode(Integer.parseInt(req.getParameter("code")));
		System.out.println("update.st의 컨트롤"+ bean);
		mav.setViewName("product/update");
		mav.addObject("pro",bean);
		
		return mav;
	}
	@RequestMapping(value="/update.st", method=RequestMethod.POST)
	protected ModelAndView updateProcess(@ModelAttribute ProductBean bean, HttpServletRequest req){
		
		productService.updatePro(bean);
		
		String code = req.getParameter("pro_code");
		System.out.println(code);
		return new ModelAndView("redirect:/detail.st?code="+code);
	}
	
	@RequestMapping(value="/delete.st", method=RequestMethod.POST)
	protected ModelAndView deleteProcess(HttpServletRequest req){
		
		int code = Integer.parseInt(req.getParameter("pro_code"));
		System.out.println(code);
		productService.deletePro(code);
		
		return new ModelAndView("redirect:/stock.st");
	}
	
	@RequestMapping(value="/insert.st", method=RequestMethod.GET)
	protected ModelAndView handleRequestInternal(HttpServletRequest req, ModelAndView mav,
			HttpSession session) throws Exception {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		
		MemberBean bean = memberService.memberInfo(mem_id);		
		mav.setViewName("product/insert");
		mav.addObject("pro",bean);
		
		return mav;
	}
	
	@RequestMapping(value="/insert.st", method=RequestMethod.POST)
	protected ModelAndView handleRequestInternal(HttpServletRequest req, ProductBean bean) throws Exception {
		
		System.out.println(req.getParameter("mem_no"));
		int pro_stono = (Integer.parseInt(req.getParameter("mem_no")));
		
		bean.setPro_memno(pro_stono);
		productService.insertPro(bean);
		
		return new ModelAndView("redirect:/stock.st");
	}
	
	@RequestMapping(value = "/relatedSearch.gt", method = RequestMethod.POST)
	public void relatedSearch(Model model, String search, HttpServletResponse response) throws IOException {
		Query query = new Query();
		query.addCriteria(Criteria.where("search").regex("^" + search));
		
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
		System.out.println(productList);
		String jProductList = new ObjectMapper().writeValueAsString(productList);
		
		return jProductList;
	}
}
