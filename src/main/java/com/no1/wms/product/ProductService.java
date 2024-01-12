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
	
	public List<ProductDto> productList(int searchn, String search, int start, int perPage){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", perPage);

		return mapper.productList(m);
	}
	
	public int createProcess(ProductDto dto) {
		return mapper.createProcess(dto);
	}
	
	public ProductDto selectById(String id) {
		return mapper.selectById(id);
	}
	
	public int updateById(ProductDto dto) {
		return mapper.updateById(dto);
	}
	
	public int deactivateById(String id) {
		return mapper.deactivateById(id);
	}

	
	public int count(int searchn, String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return mapper.count(m);
	};//카운터
}
