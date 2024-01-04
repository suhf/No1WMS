package com.no1.wms.stock;

import java.io.Console;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StockService {
	@Autowired
	StockMapper mapper;
	
	public List<StockDto> stockList(int p){
		
		
		
		int start = 0;
		int end = 0;
		
		Map m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		
		return mapper.stockList(m);
	}
	
}
