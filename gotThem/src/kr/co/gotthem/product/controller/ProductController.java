package kr.co.gotthem.product.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gotthem.product.bean.ProductBean;
import kr.co.gotthem.product.service.ProductService;
import kr.co.gotthem.store.bean.StoreBean;
import kr.co.gotthem.store.controller.StoreController;
import kr.co.gotthem.store.service.StoreService;

@Controller
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	private ProductService productService;
	private StoreService storeService;

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}
	
	@RequestMapping(value = "/stock.st", method = RequestMethod.GET)
	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws Exception {
		// session 나의 회원정보를 가지고 stono 가지고 온다
		//String sto_id = (String) session.getAttribute("sto_id");
		//StoreBean storeInfo =  storeService.FindById(sto_id);
		//int pro_stono = storeInfo.getSto_no();
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String sto_id = authentication.getName();
		
		StoreBean storeInfo =  storeService.FindById(sto_id);
		int pro_stono = storeInfo.getSto_no();
		// 가지고 온 stono를 productSevice의 매개변수로 보낸다.
		// xml 알아서 리스트를 가져오면 받아와서 뿌리면 끝..
		System.out.println("stono = " + pro_stono);
		List<ProductBean> result = productService.plist(pro_stono);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/stock");
		mav.addObject("plist",result);
		
		return mav;
	}
	
	@RequestMapping(value = "/detail.st", method = RequestMethod.GET)
	protected ModelAndView handleRequestInternal(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		int code = ServletRequestUtils.getIntParameter(req, "code");
		System.out.println("code = " + code);
		ProductBean bean = productService.findCode(code);		
		mav.setViewName("product/detail");
		mav.addObject("pro",bean);
		
		return mav;
	}
	
	@RequestMapping(value="/update.st", method=RequestMethod.GET)
	protected ModelAndView movieUpdateForm(HttpServletRequest req, ModelAndView view){
		ProductBean bean = productService.findCode(Integer.parseInt(req.getParameter("code")));
		System.out.println("update.st의 컨트롤"+ bean);
		view.setViewName("product/update");
		view.addObject("pro",bean);
		
		return view;
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
	
}

