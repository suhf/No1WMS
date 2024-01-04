package com.no1.wms.stock;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.no1.wms.stock.StockDto;

@Controller
public class StockController {
	
	@Autowired
	StockService service;
	
	// 재고 리스트 출력
	@GetMapping("stock/list")
	public String list(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
					   @RequestParam(name = "search", defaultValue = "") String search,
					   @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = service.count(searchn, search);
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		
		//스톡서비스로 재고 리스트 출력 메서트 작성
		List<StockDto> dto = service.stockList(searchn, search, perPage);
		m.addAttribute("list", dto);
		
		int pageNum = 4;//보여질 페이지 번호 수
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수
	
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if (end > totalPages) {
			end = totalPages;
		}
		m.addAttribute("begin", begin);
		m.addAttribute("end", end);
		m.addAttribute("pageNum", pageNum);
		m.addAttribute("totalPages", totalPages);
		
		return "stock/list";
	}
				
	
	// 재고 상세페이지
	@PostMapping("stock/read/{id}")
	public String read(@PathVariable UUID id, Model m) {
		
		//스톡서비스로 재고 상세페이지 출력 메서드 작성
		StockDto dto = service.stockOne(id);
		m.addAttribute("dto", dto);
		return "stock/read/";
	}
	
	
	// 수정 - 폼
//	@GetMapping("/stock/update/{id}")
//	public String update(@PathVariable UUID id, Model m) {
//		StockDto dto = service.updateStock(id);
//		m.addAttribute("dto", dto);
//		return "stock/update";
//	}
	
}
