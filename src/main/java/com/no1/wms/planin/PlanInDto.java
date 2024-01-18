package com.no1.wms.planin;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import com.no1.wms.account.AccountDto;
import com.no1.wms.category.CategoryDto;
import com.no1.wms.product.ProductDto;
import com.no1.wms.vendor.VendorDto;
import com.no1.wms.warehouse.WarehouseDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("PlanInDto")
public class PlanInDto {
	private String groupNumber;
	private String productId;
	private Integer quantity;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date;
	private String vendorId;
	private String managerId;
	private String warehouseId;
	private String qrHash;
	private String url;
	private Boolean clear;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date vendorDate;
	private String other;
	private Boolean activation;
	private Integer viewGroupNumber;
	private String oldProductId;
	private String caName;
	
	private ProductDto productDto;
	private VendorDto vendorDto;
	private AccountDto accountDto;
	private WarehouseDto warehouseDto;
}