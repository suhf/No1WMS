package com.no1.wms.stock;

import com.no1.wms.product.ProductDto;
import com.no1.wms.warehouse.WarehouseDto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StockDto {
	
	private String id;
	private String warehouseId;
	private String productId;
	private int quantity;
	private boolean activation;

	private int quantityAdjustment;
}
