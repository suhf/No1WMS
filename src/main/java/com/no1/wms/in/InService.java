package com.no1.wms.in;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InService {
	
	@Autowired
	InMapper mapper;
	
	public List<InDto> inList(int searchn, String search, int start, int perPage){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", perPage);
		
		return mapper.inList(m);
	}
	
	public int count(int searchn, String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return mapper.count(m);
	};//카운터
	
	public int createProcess(InDto dto) {
		return mapper.createProcess(dto);
	}
	
	public int createProcess2(InDto dto) {
		return mapper.createProcess2(dto);
	}
	
	public InDto selectById (String id) {
		return mapper.selectById(id);
	}
	
	public int updateById(InDto dto) {
		return mapper.updateById(dto);
	}
	
	public int checkIfExistsStock(InDto dto) {
		return mapper.checkIfExistsStock(dto);
	}
	
	public int updateStockProcess(InDto dto) {
		return mapper.updateStockProcess(dto);
	}
	
	public int createStockProcess(InDto dto) {
		return mapper.createStockProcess(dto);
	}
	
}
