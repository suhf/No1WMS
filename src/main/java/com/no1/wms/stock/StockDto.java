package com.no1.wms.stock;

import lombok.Data;

@Data
public class StockDto {
	
	private int id;
	private int warehouse_id;
	private int product_id;
	private int quantity;
	private boolean activation;
}
