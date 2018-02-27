package kr.co.gotthem.product.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gotthem.product.bean.SearchBean;
import kr.co.gotthem.product.service.ProductService;

@Controller
public class ProductController {
	
	private ProductService productService;
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	private MongoTemplate mongoTemplate;
	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
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
	public String searchList(Model model, @RequestParam String search) {
		
		List searchList = productService.searchList(search);
		
		model.addAttribute("searchList", searchList);
		
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
