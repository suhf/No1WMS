package com.no1.wms.in;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InMapper {
	List<InDto> inList(Map<String, Object> m);
	List<InDto> inListMain(Map<String, Object> m);
	int count(Map<String, Object> m);
	int createProcess(InDto dto);
	int createProcess2(InDto dto);
	InDto selectById (String id);
	int updateById(InDto dto);
	int checkIfExistsStock(InDto dto);
	int updateStockProcess(InDto dto);
	int createStockProcess(InDto dto);
	int currntStockQuantity(InDto dto);
	int currntInQuantity(InDto dto);
	int updateStockProcessForUpdate(InDto dto);
	int deactivateById(String id);
	String selectWarehouseQuantity(String warehouseId);
	int updateWarehouseQuantity(Map<String, Object> m);
	
	
}
