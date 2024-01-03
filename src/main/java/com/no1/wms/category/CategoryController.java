package com.no1.wms.category;

import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CategoryController {
	
	
		
	// 카테고리 리스트 출력
	@GetMapping("/list")
	public String list() {
		// 서비스로 카테고리 목록 불러오는 메서드 작성
		return "category/list";
	}
		
	// 상세페이지
	@PostMapping("/read/{kan_code}")
	public String read(@PathVariable UUID kan_code) {
		// 선택한 kan_code를 바탕으로 원하는 상세정보 출력하는 메서드 작성
		return "category/read";
	}
	
	// 생성
	@GetMapping("/create")
	public String createform() {
		return "category/create";
	}
	
	@PostMapping("/create")
	public void create(CategoryDto dto) {
		
	}
	
	
	
	
	
}
