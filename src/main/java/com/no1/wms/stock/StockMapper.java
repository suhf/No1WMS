package com.no1.wms.stock;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StockMapper {
	
	List<StockDto> stockList(Map<String, Object> m);
	
}
