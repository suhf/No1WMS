package com.no1.wms.vendor;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor

@Alias("VendorDto")
public class VendorDto {
	
	private String id;
	private String name;
	private String president_name;
	private String address;
	private String registration_number;
	private String email;
	private String president_telephone;
	private String vendor_manager;
	private String vendor_manager_telephone;
	private String main_product;
	private String manager_id;
	private boolean activation;
}
