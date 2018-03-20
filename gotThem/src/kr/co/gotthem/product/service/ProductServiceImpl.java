package kr.co.gotthem.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

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
	public List<ProductBean> listProduct() {
		return productDao.listProduct();
	}

	@Override
	public List searchList(Model model, String searchParent, int pageNo) {

		final int rowPerPage = 10;
		int beginList = (pageNo - 1) * rowPerPage;
		
		if (searchParent == null) {
			searchParent = "";
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("beginList", beginList);
		map.put("search", searchParent);
		List searchList = productDao.searchList(map);

		// 전체 게시물 수
		int totalRows = productDao.searchListCount(searchParent);
		
		Map<String, String> row = new HashMap<String, String>();
		List addressList = new ArrayList();
		for (int i = 0; i < searchList.size(); i++) {
			row = (Map) searchList.get(i);
			String address = (String) row.get("mem_address");
			
			StringTokenizer st = new StringTokenizer(address, "/");
			String post = st.nextToken();
			String addr1 = st.nextToken();
			String addr2 = st.nextToken();
			
			String mem_address = addr1 + " " + addr2;
			row.put("mem_address", mem_address);
		}
		
		Map rowParse = new HashMap();
		List searchParseList = new ArrayList();
		
		if (searchList.size() == 0) {
			StringTokenizer st = new StringTokenizer(searchParent, " ");
			
			while (st.hasMoreTokens()) {
				String search = st.nextToken();
				map.put("search", search);
				searchList = productDao.searchList(map);
				
				for (int i = 0; i < searchList.size(); i++) {
					rowParse = (Map) searchList.get(i);
					if (!searchParseList.contains(rowParse)) {
						searchParseList.add(rowParse);
					}
				}
			}
			totalRows = searchParseList.size();
			
			for (int i = 0; i < searchParseList.size(); i++) {
				row = (Map) searchParseList.get(i);
				String address = (String) row.get("mem_address");
				
				StringTokenizer st1 = new StringTokenizer(address, "/");
				String post = st1.nextToken();
				String addr1 = st1.nextToken();
				String addr2 = st1.nextToken();
				
				String mem_address = addr1 + " " + addr2;
				row.put("mem_address", mem_address);
			}
			
			model.addAttribute("searchList", searchParseList);
		}
		
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
		model.addAttribute("totalRows", totalRows);
		model.addAttribute("search", searchParent);
		model.addAttribute("searchList", searchList);
		
		return null;
	}

	@Override
	public List productInfo(int mem_no, String category) {
		return productDao.productInfo(mem_no, category);
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
	public ProductBean productDetail(int pro_code) {
		return productDao.productDetail(pro_code);
	}

}
