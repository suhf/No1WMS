package com.no1.wms.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryService categoryService;
	
	// 테스트
	@GetMapping("/category/test")
	public String testpage(Model m) {
		List<CategoryDto> dto = categoryService.selectAllCategory();
		m.addAttribute("dto", dto);
		
		return "category/test";
	}
	
	
	// 카테고리 리스트 출력
	@GetMapping("/category/list")
	public String list(@RequestParam(name="p", defaultValue = "1")int p, Model m) {
		
		// 서비스로 카테고리 목록 불러오는 메서드 작성
		List<CategoryDto> dto = categoryService.categoryList(p);
		m.addAttribute("list", dto);
		return "category/list";
	}
		
	// 상세페이지
	@PostMapping("/category/read/{kan_code}")
	public String read(@PathVariable String kan_code, Model m) {
		// 선택한 kan_code를 바탕으로 원하는 상세정보 출력하는 메서드 작성
		CategoryDto dto = categoryService.selectByKanCode(kan_code);
		m.addAttribute("dto", dto);
		return "category/read";
	}
	
	// 생성 - 폼
	@PostMapping("/category/create")
	public String create() {
		return "category/create";
	}
	
	// 생성 - Ajax
	@PostMapping("/category/create_process")
	public int createProcess(CategoryDto dto, Model m) {
		int i = categoryService.createProcess(dto);
		if(i == 1) {
			return i;
		}else{
			// ajax테스트후 결정
			//m.addAttribute("dto", dto);
			return 0;
		}
	}
	
	
	// 수정 - 폼
	@PostMapping("/category/update/{kan_code}")
	public String update(@PathVariable String kan_code, Model m) {
		CategoryDto dto = categoryService.selectByKanCode(kan_code);
		m.addAttribute("dto", dto);
		return "category/update";
	}
	// 수정 - Ajax
	
	@PostMapping("/category//update_process")
	public int updateProcess(CategoryDto dto, Model m) {
		
		int i = categoryService.createProcess(dto);
		if(i == 1) {
			return i;
		}else{
			// ajax테스트후 결정
			//m.addAttribute("dto", dto);
			return 0;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
