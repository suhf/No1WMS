package com.no1.wms.vendor;

import com.no1.wms.warehouse.WarehouseDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;


@Mapper
public interface VendorMapper {
	List<VendorDto> selectAll();
	List<VendorDto> list(Map<String, Object> m);

	int count(Map<String, Object> m);//검색 글 갯수

	VendorDto vendorOne(String id);

	int updateVendor(VendorDto dto);
	
	int createVendor(VendorDto dto);

	int deleteVendor(String id);

	
}
