package com.no1.wms.category;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@Alias("CategoryDto")
public class CategoryDto {
		
	private String kan_code;
	private String cls_nm_1;
	private String cls_nm_2;
	private String cls_nm_3;
	private String cls_nm_4;
	@Builder.Default
	private Boolean activation = true;
}
