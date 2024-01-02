package com.no1.wms.category;

import java.util.UUID;

import lombok.Data;

@Data
public class CategoryDto {
	
	private UUID kan_code;
	private String cls_nm_1;
	private String cls_nm_2;
	private String cls_nm_3;
	private String cls_nm_4;
	private boolean activation;
	
}
