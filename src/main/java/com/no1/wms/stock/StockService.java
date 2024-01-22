package com.no1.wms.stock;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class StockService {
	@Autowired
	StockMapper mapper;
	
	public int count(int searchn, String search) {
		
		System.out.println(searchn+search);
		
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return mapper.count(m);
	}

	
	public List<Map<String, Object>> list(int searchn, String search, int start, int perPage){
		
		System.out.println(searchn+search);
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", perPage);

		List<Map<String, Object>> result = mapper.list(m);
		log.debug("warehouseOne테스트 :: " + result);
		return result;
		
	}

	public int count2(int searchn, String search) {

		System.out.println(searchn+search);

		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return mapper.count2(m);
	}


	public List<Map<String, Object>> list2(int searchn, String search, int start, int perPage){

		System.out.println(searchn+search);

		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", perPage);

		List<Map<String, Object>> result = mapper.list2(m);
		log.debug("warehouseOne테스트 :: " + result);
		return result;

	}

	
	public Map<String, Object> stockOne(String id) {
		return mapper.stockOne(id);
	}
	
	
	public int createStock(StockDto dto) {
		return mapper.createStock(dto);
	}
	
	
	public int updateStock(StockDto dto) {
		return mapper.updateStock(dto);
	}

	public int updateWarehouse(StockDto dto){
		return mapper.updateWarehouse(dto);
	}

	public int updateWarehousePlus(StockDto dto){
		return mapper.updateWarehousePlus(dto);
	}

	public int updateWarehouseDeleteStock(StockDto dto){
		return mapper.updateWarehouseDeleteStock(dto);
	}

	public int deleteStock(StockDto dto) {
		return mapper.deleteStock(dto);
	}


	public List<Map<String, Object>> productSelect(int searchn, String search, int start, int perPage){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", perPage);

		List<Map<String, Object>> productresult = mapper.productSelect(m);

		return productresult;
	}

	public int productCount(int searchn, String search) {


		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return mapper.productCount(m);
	}

	public List<Map<String, Object>> warehousesSelect(int searchn, String search, int start, int perPage){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", perPage);

		List<Map<String, Object>> warehouseresult = mapper.warehouseSelect(m);

		return warehouseresult;
	}

	public int warehouseCount(int searchn, String search) {


		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return mapper.warehouseCount(m);
	}

	public List<Map<String, Object>> selectAll() {
		return mapper.selectAll();
	}


}

