package com.no1.wms.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
	
	@Autowired
	ProductMapper mapper;
	
	public List<ProductDto> productList(int p){
		//페이징 완료되면 수정해야함.
		
		int start = 0;
		int count = 10;
		
		Map m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", count);
		
		return mapper.productList(m);
	}
	
}
