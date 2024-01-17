package com.no1.wms.out;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;


@Mapper
public interface ProductOutMapper {
	
	int count(Map<String, Object> m);//검색 글 갯수

	List<Map<String, Object>> list(Map<String, Object> m);




	int outUpdate(ProductOutDto dto);
	int updateStock(ProductOutDto dto);

	int updateWarehouse(ProductOutDto dto);

	int outNowUpdate(ProductOutDto dto);
	int updateWarehousePlus(ProductOutDto dto);

	int updateWarehouseDeleteStock(ProductOutDto dto);
	
	int createOut(ProductOutDto dto);

	Map<String, Object> outOne(String id);

	int deleteOut(ProductOutDto dto);

	int outNow(ProductOutDto dto);

	List<Map<String, Object>> stockSelect(Map<String, Object> m);

	int stockCount(Map<String, Object> m);//검색 글 갯수




	
	
}
