package com.no1.wms.category;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {
	List<CategoryDto> categoryList(Map<String, Object> m);//검색기능 미포함
	CategoryDto selectByKanCode(String kan_code);
	int createProcess(CategoryDto dto);
	List<CategoryDto> selectAllCategory();
	int updateByKanCode(CategoryDto dto);
	int deactivateByKanCode(String kan_code);
	int activateByKanCode(String kan_code);
	String kanCheck(String kan_code);
	
	int count(Map<String, Object> m);//카운터
	List<CategoryDto> categoryList2(Map<String, Object> m);//검색기능까지 포함
	
	
}
