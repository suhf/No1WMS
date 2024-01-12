package com.no1.wms.product;

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

import com.no1.wms.category.CategoryDto;
import com.no1.wms.category.CategoryService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	
	@GetMapping("list")
	public String list(@RequestParam(name = "p", defaultValue = "1") int p, Model m) {

		// 서비스로 카테고리 목록 불러오는 메서드 작성
		List<ProductDto> dto = productService.productList(p);
		m.addAttribute("list", dto);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
