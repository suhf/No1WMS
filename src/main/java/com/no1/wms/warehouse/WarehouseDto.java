package com.no1.wms.warehouse;

import com.no1.wms.product.ProductDto;
import com.no1.wms.stock.StockDto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WarehouseDto {
	
	private String id;
	private String name;
	private int capacity;
	private int currentCapacity;
	private String managerId;
	private String address;
	private boolean activation;

	private List<ProductDto> productDto;
	private List<StockDto> stockDto;
}
