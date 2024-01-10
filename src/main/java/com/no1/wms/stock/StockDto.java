package com.no1.wms.stock;

import lombok.Data;

@Data
public class StockDto {
	
	private String id;
	private int warehouseId;
	private int productId;
	private int quantity;
	private boolean activation;
}
