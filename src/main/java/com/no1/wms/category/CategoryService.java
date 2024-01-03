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
		int end = 0;
		
		Map m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		
		
		
		return mapper.categoryList(m);
	}
	
	public CategoryDto selectByKanCode(String kan_code) {
		return mapper.selectByKanCode(kan_code);
	}
	
	public int createProcess(CategoryDto dto) {
		mapper.createProcess(dto);
		return 1;
	}
	
	public List<CategoryDto> selectAllCategory() {
		return mapper.selectAllCategory();
	}
	
	
}
