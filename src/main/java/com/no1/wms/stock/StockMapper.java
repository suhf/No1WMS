package com.no1.wms.stock;

import com.no1.wms.in.InDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;


@Mapper
public interface StockMapper {
	List<Map<String, Object>> selectAll();
	
	int count(Map<String, Object> m);//검색 글 갯수

	List<Map<String, Object>> list(Map<String, Object> m);


	int count2(Map<String, Object> m);//검색 글 갯수

	List<Map<String, Object>> list2(Map<String, Object> m);


	int updateStock(StockDto dto);

	int updateWarehouse(StockDto dto);

	int updateWarehousePlus(StockDto dto);

	int updateWarehouseDeleteStock(StockDto dto);
	
	int createStock(StockDto dto);

	Map<String, Object> stockOne(String id);

	int deleteStock(StockDto dto);

	List<Map<String, Object>> productSelect(Map<String, Object> m);

	int productCount(Map<String, Object> m);//검색 글 갯수

	List<Map<String, Object>> warehouseSelect(Map<String, Object> m);

	int warehouseCount(Map<String, Object> m);//검색 글 갯수



	int checkIfExistsStock(StockDto dto);
	int updateStockProcess(StockDto dto);
	int createStockProcess(StockDto dto);


	
	
}
