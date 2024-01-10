package com.no1.wms.warehouse;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;


@Mapper
public interface WarehouseMapper {

	List<WarehouseDto> list(Map<String, Object> m);

	int count(Map<String, Object> m);//검색 글 갯수

	List<Map<String, Object>> warehouseOne(Map<String, Object> m);

	int warehouseOneCount(Map<String, Object> m);//검색 글 갯수

	WarehouseDto One(String id);

	int updateWarehouse(WarehouseDto dto);
	
	int createWarehouse(WarehouseDto dto);

	int deleteWarehouse(String id);

	
}
