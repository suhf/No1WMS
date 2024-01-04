package com.no1.wms.stock;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface StockMapper {
	
	int count(Map<String, Object> m);//검색 글 갯수
	
	List<StockDto> stockList(Map<String, Object> m);
	
	int updateStock(StockDto dto);
	
	int createStock(StockDto dto);
	
	StockDto stockOne(UUID id);
	
	
}
