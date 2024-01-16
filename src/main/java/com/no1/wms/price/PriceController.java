package com.no1.wms.price;

import java.util.List;

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

import com.no1.wms.category.CategoryDto;
import com.no1.wms.product.ProductDto;
import com.no1.wms.product.ProductService;



@Controller
@RequestMapping("/price")
public class PriceController {

	@Autowired
	PriceService priceService;
	@Autowired
	ProductService productService;
	
	@GetMapping("/list")
	public String list(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
			   			@RequestParam(name = "search", defaultValue = "") String search,
			   			@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		
		
		int count = priceService.count2(searchn, search);
		
		int perPage = 15; // 한 페이지에 보일 글의 개수
		int startRow = (page - 1) * perPage;
		
		List<PriceDto> dto = priceService.priceList3(searchn, search, startRow ,perPage);
		
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
		
		
		
		return "/price/list";
		
	}
	
	
	// 생성 - 폼
	@PostMapping("/create")
	public String create() {
		return "price/create";
	}
		
		
	// 생성 - Ajax
	@PostMapping("/create_process")
	@ResponseBody
	public boolean createProcess(PriceDto dto) {
		int i = priceService.createProcess(dto);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	// 상세페이지
	@PostMapping("/read")
	public String read(String id, Model m) {
		// 선택한 id를 바탕으로 원하는 상세정보 출력하는 메서드 작성
		PriceDto dto = priceService.selectById(id);
		m.addAttribute("dto", dto);
		return "price/read";
	}

	// 수정 폼
	@PostMapping("/update")
	public String update(String id, Model m) {
		PriceDto dto = priceService.selectById(id);
		m.addAttribute("dto", dto);
		return "price/update";
	}
	
	// 수정 - Ajax
	@PutMapping("/update_process")
	@ResponseBody
	public boolean update_process(PriceDto dto) {
		int i = priceService.updateById(dto);
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
		int i = priceService.deactivateById(id);
		if(i == 1) {
			return true;
		}else {
			return false;
		}
	}
	
	//모달화면
	@PostMapping("/show_modal")
	public ModelAndView categoryShowModal(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
				@RequestParam(name = "search", defaultValue = "") String search,
				@RequestParam(name = "p", defaultValue = "1") int page, ModelAndView m, String name) {
		int count = productService.count(searchn, search);
		
		int perPage = 10; // 한 페이지에 보일 글의 개수
		int startRow = (page - 1) * perPage;
		
		List<ProductDto> dto = productService.productList(searchn, search, startRow ,perPage);
		
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
	
	
	
	
}
