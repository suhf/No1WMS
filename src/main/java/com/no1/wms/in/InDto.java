package com.no1.wms.in;



import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import com.no1.wms.account.AccountDto;
import com.no1.wms.planin.PlanInDto;
import com.no1.wms.product.ProductDto;
import com.no1.wms.warehouse.WarehouseDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Alias("InDto")
public class InDto {
	
	private String id;
	private String group_number;
	private String product_id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date in_date;
	private String quantity;
	private String warehouse_id;
	private String manager_id;
	private String note;
	private boolean activation;//활성화
	private int latest_price;
	
	private PlanInDto planInDto;
	private ProductDto productDto;
	private WarehouseDto warehouseDto;
	private AccountDto accountDto;
	
	

}
