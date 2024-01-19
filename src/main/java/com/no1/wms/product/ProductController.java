package com.no1.wms.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.no1.wms.account.AccountDto;
import com.no1.wms.account.AccountService;
import com.no1.wms.category.CategoryDto;
import com.no1.wms.category.CategoryService;
import com.no1.wms.price.PriceDto;
import com.no1.wms.vendor.VendorDto;
import com.no1.wms.vendor.VendorService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	ProductService productService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	VendorService service;
	@Autowired
	AccountService accountService;
	
	
	/*
	@GetMapping("list")
	public String list(@RequestParam(name = "p", defaultValue = "1") int p, Model m) {

		// 서비스로 카테고리 목록 불러오는 메서드 작성
		List<ProductDto> dto = productService.productList(p);
		m.addAttribute("list", dto);
		return "/product/list";
	}
	*/
	@GetMapping("/list")
	public String list(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
			   			@RequestParam(name = "search", defaultValue = "") String search,
			   			@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		
		
		int count = productService.count(searchn, search);
		
		int perPage = 15; // 한 페이지에 보일 글의 개수
		int startRow = (page - 1) * perPage;
		
		List<ProductDto> dto = productService.productList(searchn, search, startRow ,perPage);
		
		m.addAttribute("list", dto);
		m.addAttribute("start", startRow + 1);
		
		int pageNum = 5;//보여질 페이지 번호 수
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if (end > totalPages) {
			end = totalPages;
		}
		
		m.addAttribute("searchn",searchn);
		m.addAttribute("search",search);
		m.addAttribute("begin", begin);
		m.addAttribute("end", end);
		m.addAttribute("pageNum", pageNum);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("p" , page);
		return "/product/list";
		
	}
	
	
	
	// 생성 - 폼
	@PostMapping("/create")
	public String create() {	
		return "/product/create";
	}
	
	// 생성 - Ajax
	@PostMapping("/create_process")
	@ResponseBody
	public boolean createProcess(ProductDto dto) {
		int i = productService.createProcess(dto);
		if (i == 1) {
			return true;
		} else {
			return false;
		}	
	}
	
	// 상세페이지
	@PostMapping("/read")
	public String read(String id, Model m) {
		ProductDto dto = productService.selectById(id);
		m.addAttribute("dto", dto);
		return "product/read";
	}
	// 수정 폼
	@PostMapping("/update")
	public String update(String id, Model m) {
		ProductDto dto = productService.selectById(id);
		m.addAttribute("dto", dto);
		return "product/update";
	}
	
	// 수정 - Ajax
	@PutMapping("/update_process")
	@ResponseBody
	public boolean update_process(ProductDto dto) {
		int i = productService.updateById(dto);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	
	// 삭제
	@DeleteMapping("/delete")
	@ResponseBody
	public boolean delete(String id) {
		int i = productService.deactivateById(id);
		if(i == 1) {
			return true;
		}else {
			return false;
		}
	}
	
	
	//모달화면
	@PostMapping("/show_modal")
	public ModelAndView categoryShowModal(@RequestParam(name = "searchn", defaultValue = "4") int searchn,
				@RequestParam(name = "search", defaultValue = "") String search,
				@RequestParam(name = "p", defaultValue = "1") int page, ModelAndView m, String name) {
		int count = categoryService.count(searchn, search);
		
		int perPage =9; // 한 페이지에 보일 글의 개수
		int startRow = (page - 1) * perPage;
		
		List<CategoryDto> dto = categoryService.categoryList2(searchn, search, startRow ,perPage);
		
		m.addObject("list", dto);
		m.addObject("start", startRow + 1);
		
		int pageNum = 5;//보여질 페이지 번호 수
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if (end > totalPages) {
			end = totalPages;
		}
		m.addObject("searchn",searchn);
		m.addObject("search",search);
		m.addObject("begin", begin);
		m.addObject("end", end);
		m.addObject("pageNum", pageNum);
		m.addObject("totalPages", totalPages);
		m.addObject("p" , page);
		m.setViewName(name);
		return m;
	}
	
	
	
	

	@PostMapping("/show_modal2")
	public ModelAndView vendorShowModal(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
					   @RequestParam(name = "search", defaultValue = "") String search,
					   @RequestParam(name = "p", defaultValue = "1") int page, ModelAndView m, String name) {

		int count = service.count(searchn, search);
		
		int perPage = 9; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		
		//스톡서비스로 재고 리스트 출력 메서트 작성
		List<VendorDto> dto = service.list(searchn, search, startRow ,perPage);


		m.addObject("vlist", dto);
		m.addObject("start", startRow + 1);
		
		int pageNum = 5;//보여질 페이지 번호 수
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수
	
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if (end > totalPages) {
			end = totalPages;
		}
		m.addObject("searchn", searchn);
		m.addObject("search", search);
		m.addObject("begin", begin);
		m.addObject("end", end);
		m.addObject("pageNum", pageNum);
		m.addObject("totalPages", totalPages);
		m.addObject("p" , page);
		m.setViewName(name);
		
		return m;
	}
	
	
	
	
	
	
	
	
	
	
	
}
