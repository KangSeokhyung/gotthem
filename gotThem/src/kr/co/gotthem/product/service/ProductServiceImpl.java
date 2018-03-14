package kr.co.gotthem.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import kr.co.gotthem.product.bean.ProductBean;
import kr.co.gotthem.product.dao.ProductDao;

public class ProductServiceImpl implements ProductService {

	private ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public List<ProductBean> plist(Model model, int pro_memno, int pageNo) {

		final int rowPerPage = 10;
		int beginList = (pageNo - 1) * rowPerPage;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("beginList", beginList);
		map.put("pro_memno", pro_memno);

		List plist = productDao.plist(map);

		// 전체 게시물 수
		int totalRows = productDao.plistCount(pro_memno);
		// 전체 페이지 번호 수
		int totalPages = (int) Math.ceil((double) totalRows / rowPerPage);

		// 화면 하단에 표시될 페이지의 개수
		final int pagePerPage = 5;

		// 하단에 표시될 페이지의 범위 개수
		int totalRanges = (int) Math.ceil((double) totalPages / pagePerPage);

		// 현재 페이지의 범위 번호
		int currentRange = (int) Math.ceil((double) pageNo / pagePerPage);

		int beginPage = (currentRange - 1) * pagePerPage + 1;
		int endPage = currentRange * pagePerPage;

		if (currentRange == totalRanges) {
			endPage = totalPages;
		}

		int prevPage = 0;
		if (currentRange != 1) {
			prevPage = (currentRange - 2) * pagePerPage + 1;
		}

		int nextPage = 0;
		if (currentRange != totalRanges) {
			nextPage = currentRange * pagePerPage + 1;
		}

		model.addAttribute("pageNo", pageNo);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("prevPage", prevPage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("plist", plist);

		return plist;
	}

	@Override
	public ProductBean findCode(int pro_code) {
		return productDao.findCode(pro_code);
	}

	@Override
	public void updatePro(ProductBean bean) {
		productDao.updatePro(bean);
	}

	@Override
	public void deletePro(int pro_code) {
		productDao.deletePro(pro_code);
	}

	@Override
	public void insertPro(ProductBean bean) {
		productDao.insertPro(bean);
	}

	@Override
	public List searchList(Model model, String search, int pageNo) {

		final int rowPerPage = 10;
		int beginList = (pageNo - 1) * rowPerPage + 1;

		if (search == null) {
			search = "";
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("beginList", beginList);
		map.put("search", search);

		System.out.println(search + "###" + beginList);

		List searchList = productDao.searchList(map);

		// 전체 게시물 수
		int totalRows = productDao.searchListCount(search);
		// 전체 페이지 번호 수
		int totalPages = (int) Math.ceil((double) totalRows / rowPerPage);

		// 화면 하단에 표시될 페이지의 개수
		final int pagePerPage = 5;

		// 하단에 표시될 페이지의 범위 개수
		int totalRanges = (int) Math.ceil((double) totalPages / pagePerPage);

		// 현재 페이지의 범위 번호
		int currentRange = (int) Math.ceil((double) pageNo / pagePerPage);

		int beginPage = (currentRange - 1) * pagePerPage + 1;
		int endPage = currentRange * pagePerPage;

		if (currentRange == totalRanges) {
			endPage = totalPages;
		}

		int prevPage = 0;
		if (currentRange != 1) {
			prevPage = (currentRange - 2) * pagePerPage + 1;
		}

		int nextPage = 0;
		if (currentRange != totalRanges) {
			nextPage = currentRange * pagePerPage + 1;
		}

		model.addAttribute("pageNo", pageNo);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("prevPage", prevPage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("search", search);
		model.addAttribute("searchList", searchList);

		return searchList;
	}

	@Override
	public List productInfo(int mem_no) {
		return productDao.productInfo(mem_no);
	}

	@Override
	public List productSearchList(Map<String, Object> map) {
		return productDao.productSearchList(map);
	}

	@Override
	public ProductBean detailProduct(int pro_code) {
		return productDao.detailProduct(pro_code);
	}

	@Override
	public List<ProductBean> listProduct() {
		return productDao.listProduct();
	}

}
