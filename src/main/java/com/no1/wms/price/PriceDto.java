package com.no1.wms.price;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.no1.wms.account.AccountDto;
import com.no1.wms.product.ProductDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Alias("PriceDto")
public class PriceDto {

	private String id;//id
	private String price;//가격
	private Date registration_date;//등록날짜
	private String manager_id;//담당자
	private String product_id; //제품 아이디
	private boolean activation;//활성화
	
	private ProductDto productDto;
	private AccountDto accountDto;
	
}
