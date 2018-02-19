package kr.co.gotthem.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.gotthem.admin.service.AdminService;
import kr.co.gotthem.store.bean.StoreBean;
import kr.co.gotthem.store.service.StroreService;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	private AdminService adminService;

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@RequestMapping(value = "/superAdmin.ad", method = RequestMethod.GET)
	public String storeIndex() {
		
		System.out.println("꺅 시발!!!");
		
		return "admin/adminLogin";
	}
	
	@RequestMapping(value = "/control.ad", method = RequestMethod.POST)
	public String control() {
		
		System.out.println("쀼엑!!");
		
		return "admin/controlPage";
	}

}
