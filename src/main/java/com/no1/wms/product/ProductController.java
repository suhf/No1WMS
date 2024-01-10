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
	public void list(@RequestParam(name = "p", defaultValue = "1") int p, Model m) {

		// 서비스로 카테고리 목록 불러오는 메서드 작성
		List<ProductDto> dto = productservice.productList(p);
		
		System.out.println(dto.get(0).getId());
		System.out.println(dto.get(0).getName());
		System.out.println(dto.get(0).getCompany_name());
		System.out.println(dto.get(0).getKan_code());
		System.out.println(dto.get(0).getVendor_id());
		System.out.println(dto.get(0).getRegistration_date());
		System.out.println(dto.get(0).getManager_id());
		System.out.println(dto.get(0).getAccountDto());
		System.out.println(dto.get(0).getVendorDto().getName());
		System.out.println(dto.get(0).getVendorDto().getPresident_name());
		System.out.println(dto.get(0).getAccountDto().getName());
		System.out.println(dto.get(0).getCategoryDto().getCls_nm_1());
		System.out.println(dto.get(0).getCategoryDto().getCls_nm_2());
		System.out.println(dto.get(0).getCategoryDto().getCls_nm_3());
		System.out.println(dto.get(0).getCategoryDto().getCls_nm_4());
		
		
		//m.addAttribute("list", dto);
		//return "/";
	}
	
	
	
}
