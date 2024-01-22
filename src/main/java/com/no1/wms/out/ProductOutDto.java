package com.no1.wms.out;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductOutDto {
	
	private String id;
	private String product_id;
	private int quantity;
	private String expected_delivery_date;
	private String delivery_date;
	private String warehouse_id;
	private String manager_id;
	private String note;
	private int activation;





}
