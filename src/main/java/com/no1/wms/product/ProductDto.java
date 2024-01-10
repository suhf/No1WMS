package com.no1.wms.product;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.no1.wms.account.AccountDto;
import com.no1.wms.category.CategoryDto;
import com.no1.wms.vendor.VendorDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("ProductDto")
public class ProductDto {
	
	private String id;//id
	private String name;//제품명
	private String company_name;//회사명
	private String kan_code;//분류코드
	private String vendor_id;//거래처 id
	private Date registration_date;//등록날짜
	private String manager_id;//담당자
	private boolean activation;//활성화
	
	private VendorDto vendorDto;
	private AccountDto accountDto;
	private CategoryDto categoryDto;
	
	
}
