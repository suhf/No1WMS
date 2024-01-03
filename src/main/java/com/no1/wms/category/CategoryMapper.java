package com.no1.wms.category;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {
	List<CategoryDto> categoryList(Map<String, Object> m);
	CategoryDto selectByKanCode(String kan_code);
	int createProcess(CategoryDto dto);
	
	
	
}
