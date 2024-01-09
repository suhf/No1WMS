package com.no1.wms.product;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.no1.wms.category.CategoryDto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Alias("ProductDto")
public class ProductDto {
	
	private String id;
	private String name;
	private String company_name;
	private String kan_code;
	private String vendor_id;
	private Date registration_date;
	private String manager_id;
	private boolean activation;
	
	
	
	
	
}
