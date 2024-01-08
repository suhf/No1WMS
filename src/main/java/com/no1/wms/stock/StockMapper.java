package com.no1.wms.stock;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;


@Mapper
public interface StockMapper {
	
	int count(Map<String, Object> m);//검색 글 갯수
	
	List<Object> list(Map<String, Object> m);
//	List<StockDto> list(Map<String, Object> m);

	int updateStock(StockDto dto);
	
	int createStock(StockDto dto);
	
	StockDto stockOne(String id);

	int deleteStock(String id);

	
	
}
