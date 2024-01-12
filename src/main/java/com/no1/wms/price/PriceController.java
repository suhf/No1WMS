package com.no1.wms.price;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.no1.wms.category.CategoryDto;



@Controller
@RequestMapping("/price")
public class PriceController {

	@Autowired
	PriceService priceService;
	
	@GetMapping("/list")
	public String list(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
			   			@RequestParam(name = "search", defaultValue = "") String search,
			   			@RequestParam(name = "p", defaultValue = "1") int page, Model m) {

		int count = priceService.count(searchn, search);
		
		int perPage = 15; // 한 페이지에 보일 글의 개수
		int startRow = (page - 1) * perPage;
		
		List<PriceDto> dto = priceService.priceList2(searchn, search, startRow ,perPage);
		
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
		@PostMapping("/price/create_process")
		@ResponseBody
		public boolean createProcess(PriceDto dto) {
			int i = priceService.createProcess(dto);
			if (i == 1) {
				return true;
			} else {
				return false;
			}
		}
	
	
	
	
	
	
	
	
	
}
