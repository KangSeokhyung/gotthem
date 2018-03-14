package kr.co.gotthem.product.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.service.MemberService;
import kr.co.gotthem.product.bean.ProductBean;
import kr.co.gotthem.product.service.ProductService;

@Controller
public class ProductController {
	
	private ProductService productService;
	private MemberService memberService;

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
		MemberBean memberInfo =  memberService.memberInfo(mem_id);
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
		mav.addObject("pro",bean);
		mav.addObject("pageNo",pageNo);
		
		return mav;
	}
	
	@RequestMapping(value="/update.st", method=RequestMethod.GET)
	protected ModelAndView movieUpdateForm(HttpServletRequest req, ModelAndView mav, @RequestParam int pageNo){
		ProductBean bean = productService.findCode(Integer.parseInt(req.getParameter("code")));
		mav.setViewName("product/update");
		mav.addObject("pro",bean);
		mav.addObject("pageNo",pageNo);
		
		return mav;
	}
	@RequestMapping(value="/update.st", method=RequestMethod.POST)
	protected ModelAndView updateProcess(@ModelAttribute ProductBean bean, HttpServletRequest req,
			@RequestParam MultipartFile file, @RequestParam int pageNo) throws Exception {
		
		InputStream inputStream = null;
		OutputStream outputStream = null;

		// 업로드된 파일을 임의의 경로로 이동한다
		String fileName = file.getOriginalFilename();
		bean.setPro_img(fileName);
		if(bean.getPro_img()== null || bean.getPro_img()=="" ) {
			bean.setPro_img(req.getParameter("pro_img"));
		}else {
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
		
		String code = req.getParameter("pro_code");
		productService.updatePro(bean);
		return new ModelAndView("redirect:/detail.st?pageNo="+pageNo+ "&code="+code);
	}
	
	@RequestMapping(value="/delete.st", method=RequestMethod.POST)
	protected ModelAndView deleteProcess(HttpServletRequest req, @RequestParam int pageNo){
		
		int code = Integer.parseInt(req.getParameter("pro_code"));
		productService.deletePro(code);
		ModelAndView mav = new  ModelAndView("redirect:/stock.st?pageNo="+pageNo);
		
		return mav;
	}
	
	@RequestMapping(value="/insert.st", method=RequestMethod.GET)
	protected ModelAndView handleRequestInternal(ModelAndView mav, @RequestParam int pageNo) throws Exception {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		
		MemberBean bean = memberService.memberInfo(mem_id);		
		mav.setViewName("product/insert");
		mav.addObject("pro",bean);
		mav.addObject("pageNo",pageNo);
		
		return mav;
	}
	
	@RequestMapping(value="/insert.st", method=RequestMethod.POST)
	public ModelAndView handleRequestInternal(HttpServletRequest req, @RequestParam int pageNo,
			@ModelAttribute ProductBean bean, @RequestParam MultipartFile file) throws Exception {
		int pro_memno = (Integer.parseInt(req.getParameter("mem_no")));
		
		InputStream inputStream = null;
		OutputStream outputStream = null;

		// 업로드된 파일을 임의의 경로로 이동한다
		String fileName = file.getOriginalFilename();
		bean.setPro_img(fileName);
		if(bean.getPro_img()== null || bean.getPro_img()=="" ) {
			bean.setPro_img("no_img.jpg");
		}else {
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
		ModelAndView mav = new ModelAndView("redirect:/stock.st?pageNo="+pageNo);

		return mav;
	}

	
}
