package com.no1.wms.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
	@Autowired
	CategoryMapper mapper;
	
	public List<CategoryDto> categoryList(int p) {
		// 페이지 넘버 p를 이용해서 장원형님이 만드신 페이징 메서드를 이용해서 
		// String start에 int값 넣고 String end에 int값 넣고 
		// CategoryMapper에 있는 메서드 사용함.
		int start = 0;
		int count = 10;
		
		Map m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", count);
		
		
		
		return mapper.categoryList(m);
	}
	
	public CategoryDto selectByKanCode(String kan_code) {
		return mapper.selectByKanCode(kan_code);
	}
	
	public int createProcess(CategoryDto dto) {
		return mapper.createProcess(dto);
	}
	
	public List<CategoryDto> selectAllCategory() {
		// 테스트용
		return mapper.selectAllCategory();
	}
	
	public int updateByKanCode(CategoryDto dto) {
		return mapper.updateByKanCode(dto);
	}
	
	public int deactivateByKanCode(String kan_code) {
		return mapper.deactivateByKanCode(kan_code);
	}
	public int activateByKanCode(String kan_code) {
		return mapper.activateByKanCode(kan_code);
	}
	
	public String kanCheck(String kan_code) {
		return mapper.kanCheck(kan_code);
	}
	
	public int count(int searchn, String search) {
		
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return mapper.count(m);
	}
	
	public List<CategoryDto> categoryList2(int searchn, String search, int start, int perPage){
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", perPage);

		return mapper.categoryList2(m);
	}
	
	
	
	
	
}
