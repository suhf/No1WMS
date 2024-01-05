package com.no1.wms.stock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StockService {
	@Autowired
	StockMapper mapper;
	
	public int count(int searchn, String search) {
		
		System.out.println(searchn+search);
		
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", 0);
		m.put("perPage", 10000);
		return mapper.count(m);
	}

	
	public List<StockDto> list(int searchn, String search, int start){
		
		System.out.println(searchn+search);
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", 10);
		return mapper.list(m);
		
	}
	
	
	public StockDto stockOne(String id) {
		return mapper.stockOne(id);
	}
	
	
	public int createStock(StockDto dto) {
		return mapper.createStock(dto);
	}
	
	
	public int updateStock(StockDto dto) {
		return mapper.updateStock(dto);
	}


	public int deleteBoard(String id) {
		return mapper.deleteStock(id);
	}
}
