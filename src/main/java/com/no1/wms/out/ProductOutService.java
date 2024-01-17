package com.no1.wms.out;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class ProductOutService {
	@Autowired
	ProductOutMapper mapper;
	
	public int count(int searchn, String search) {
		

		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return mapper.count(m);
	}

	
	public List<Map<String, Object>> list(int searchn, String search, int start, int perPage){
		

		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", perPage);

		List<Map<String, Object>> result = mapper.list(m);
		return result;
		
	}


	
	public Map<String, Object> outOne(String id) {
		return mapper.outOne(id);
	}
	
	
	public int createOut(ProductOutDto dto) {
		return mapper.createOut(dto);
	}
	


	public int outUpdate(ProductOutDto dto) {
		return mapper.outUpdate(dto);
	}
	public int updateStock(ProductOutDto dto) {
		return mapper.updateStock(dto);
	}

	public int updateWarehouse(ProductOutDto dto){
		return mapper.updateWarehouse(dto);
	}

	public int outNowUpdate(ProductOutDto dto){
		return mapper.outNowUpdate(dto);}

	public int updateWarehousePlus(ProductOutDto dto){
		return mapper.updateWarehousePlus(dto);
	}

	public int updateWarehouseDeleteStock(ProductOutDto dto){
		return mapper.updateWarehouseDeleteStock(dto);
	}

	public int deleteOut(ProductOutDto dto) {
		return mapper.deleteOut(dto);
	}

	public int outNow(ProductOutDto dto) {
		return mapper.outNow(dto);
	}

	public List<Map<String, Object>> stockSelect(int searchn, String search, int start, int perPage){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", perPage);

		List<Map<String, Object>> productresult = mapper.stockSelect(m);

		return productresult;
	}

	public int stockCount(int searchn, String search) {


		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return mapper.stockCount(m);
	}



}

