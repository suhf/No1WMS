package com.no1.wms.price;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.no1.wms.category.CategoryDto;
import com.no1.wms.product.ProductDto;

@Service
public class PriceService {

	@Autowired
	PriceMapper mapper;
	
	public List<PriceDto> priceList(int p){
		
		int start = 0;
		int count = 10;
		
		Map m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", count);
		
		return mapper.priceList(m);
	}
	
	//페이징 카운터
	public int count(int searchn, String search) {
		
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return mapper.count(m);
	}
	
	public List<PriceDto> priceList2(int searchn, String search, int start, int perPage){
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", perPage);

		return mapper.priceList2(m);
	}
	
	public List<PriceDto> priceList3(int searchn, String search, int start, int perPage){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", perPage);

		return mapper.priceList3(m);
	}
	
	
	public int createProcess(PriceDto dto) {
		return mapper.createProcess(dto);
	}
	
	public int count2(int searchn, String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return mapper.count2(m);
	};//카운터
	
	public PriceDto selectById(String id) {
		return mapper.selectById(id);
	}
	
	
	public int updateById(PriceDto dto) {
		return mapper.updateById(dto);
	}
	public int deactivateById(String id) {
		return mapper.deactivateById(id);
	}
	
	
	
	
	
}
