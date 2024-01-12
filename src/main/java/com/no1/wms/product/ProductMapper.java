package com.no1.wms.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
	
	List<ProductDto> productList(Map<String, Object> m);
	int createProcess(ProductDto dto);
	ProductDto selectById(String id);
	int updateById(ProductDto dto);
	int deactivateById(String id);
	
}
