package com.no1.wms.price;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.no1.wms.category.CategoryDto;

@Mapper
public interface PriceMapper {

	List<PriceDto> priceList(Map<String, Object> m);
	int count(Map<String, Object> m);//카운터
	List<PriceDto> priceList2(Map<String, Object> m);//검색기능까지 포함
	int createProcess(PriceDto dto);
}
