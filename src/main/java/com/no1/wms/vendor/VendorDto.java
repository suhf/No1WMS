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
	private String presidentName;
	private String address;
	private String registrationNumber;
	private String email;
	private String presidentTelephone;
	private String vendorManager;
	private String vendorManagerTelephone;
	private String mainProduct;
	private String managerId;
	private boolean activation;
}
