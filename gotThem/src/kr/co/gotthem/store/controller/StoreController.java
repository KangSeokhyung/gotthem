package kr.co.gotthem.store.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.gotthem.store.bean.StoreBean;
import kr.co.gotthem.store.service.StroreService;

@Controller
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	private StroreService storeService;

	public void setStoreService(StroreService storeService) {
		this.storeService = storeService;
	}

	@RequestMapping(value = "/storeIndex.ow", method = RequestMethod.GET)
	public String storeIndex() {
		
		
			List<StoreBean> list = new ArrayList<StoreBean>();
			list = storeService.list();
			System.out.println(list);
		
		
		return "store/storeIndex";
	}
	
}
