package com.no1.wms.stock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StockController {
	
	@Autowired
	StockService service;
	
	// 재고 리스트 출력
	@GetMapping("stock/list")
	public String list(@RequestParam(name = "p", defaultValue = "1")int p, Model m) {
		

		
		//스톡서비스로 재고 리스트 출력 메서트 작성
		List<StockDto> dto = service.stockList(p);
		m.addAttribute("list", dto);
		return "stock/list";
	}
				
	
	// 재고 상세페이지
	@PostMapping("stock/read/{id}")
	@ResponseBody
	public String read(@PathVariable String id, Model m) {
		
		//스톡서비스로 재고 상세페이지 출력 메서드 작성
		StockDto dto = service.
	}
}
