package com.no1.wms.stock;

import java.util.UUID;

import lombok.Data;

@Data
public class StockDto {
	
	private UUID id;
	private int warehouse_id;
	private int product_id;
	private int quantity;
	private boolean activation;
}
