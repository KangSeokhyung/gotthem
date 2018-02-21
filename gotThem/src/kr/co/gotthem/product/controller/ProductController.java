package kr.co.gotthem.product.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.gotthem.product.bean.ProductBean;
import kr.co.gotthem.product.service.ProductService;
import kr.co.gotthem.store.bean.StoreBean;


@Controller
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	private ProductService productService;

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@RequestMapping(value = "/procudtIndex.st", method = RequestMethod.GET)
	public String storeIndex() {
		
		System.out.println("procudtIndex왔다");
		List<ProductBean> list = new ArrayList<ProductBean>();
		
		list = productService.listProduct();
		System.out.println("procudtlist" + list);
		
		return "basket/productList";
	}
	
}
