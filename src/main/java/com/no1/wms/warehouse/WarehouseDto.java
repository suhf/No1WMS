package com.no1.wms.warehouse;

import lombok.Data;

@Data
public class WarehouseDto {
	
	private String id;
	private String name;
	private int capacity;
	private int current_capacity;
	private String manager_id;
	private String address;
	private boolean activation;
}
