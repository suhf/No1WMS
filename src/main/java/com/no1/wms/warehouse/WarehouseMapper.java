package com.no1.wms.warehouse;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;


@Mapper
public interface WarehouseMapper {
	
	int count(Map<String, Object> m);//검색 글 갯수
	
	List<Object> list(Map<String, Object> m);

	int updateWarehouse(WarehouseDto dto);
	
	int createWarehouse(WarehouseDto dto);
	
	WarehouseDto warehouseOne(String id);

	int deleteWarehouse(String id);

	
	
}
