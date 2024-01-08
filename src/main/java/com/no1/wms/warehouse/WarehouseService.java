package com.no1.wms.warehouse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WarehouseService {
	@Autowired
	WarehouseMapper mapper;
	
	public int count(int searchn, String search) {
		

		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return mapper.count(m);
	}

	
	public List<Object> list(int searchn, String search, int start){
		
		System.out.println(searchn+search);
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", 10);

		return mapper.list(m);
		
	}
	
	
	public WarehouseDto warehouseOne(String id) {
		return mapper.warehouseOne(id);
	}
	
	
	public int createWarehouse(WarehouseDto dto) {
		return mapper.createWarehouse(dto);
	}
	
	
	public int updateWarehouse(WarehouseDto dto) {
		return mapper.updateWarehouse(dto);
	}


	public int deleteWarehouse(String id) {
		return mapper.deleteWarehouse(id);
	}
}
