package com.no1.wms.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productservice;
	
	@GetMapping("/product/list")
	public String list(@RequestParam(name = "p", defaultValue = "1") int p, Model m) {

		// 서비스로 카테고리 목록 불러오는 메서드 작성
		List<ProductDto> dto = productservice.productList(p);
		m.addAttribute("list", dto);
		return "product/list";
	}
	
	
	
}
