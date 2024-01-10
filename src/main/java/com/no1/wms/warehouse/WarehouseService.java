package com.no1.wms.warehouse;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.awt.color.ICC_ColorSpace;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class WarehouseService {
	@Autowired
	WarehouseMapper mapper;
	
	public int count(int searchn, String search) {

		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return mapper.count(m);
	}

	
	public List<WarehouseDto> list(int searchn, String search, int start, int perPage){
		
		System.out.println(searchn+search);
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", perPage);

		return mapper.list(m);
		
	}
	
	
	public List<Map<String, Object>> warehouseOne(int searchn, String search, String id, int start, int perPage) {

		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", perPage);
		m.put("id" , id);
		System.out.println(m);

		List<Map<String, Object>> result = mapper.warehouseOne(m);
		log.debug("warehouseOne테스트 :: " + result);
		return result;
	}

	public int warehouseOneCount(int searchn, String search, String id){

		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("id", id);

		log.debug("warehouseOneCount테스트 :: " + m);

		return mapper.warehouseOneCount(m);
	}

	public WarehouseDto One(String id){
		return mapper.One(id);
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
