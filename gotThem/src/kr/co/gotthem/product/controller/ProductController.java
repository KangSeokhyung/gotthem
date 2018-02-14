package kr.co.gotthem.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gotthem.product.bean.ProductBean;
import kr.co.gotthem.product.service.ProductService;
import kr.co.gotthem.store.controller.StoreController;

@Controller
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	private ProductService productService;

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		
		List result = productService.plist();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("store/stock");
		mav.addObject("plist",result);
		
		return mav;
	}

}
