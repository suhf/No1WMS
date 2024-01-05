package com.no1.wms.excel;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;

import com.no1.wms.category.CategoryDto;

import javax.servlet.http.HttpServletResponse;

@Service
public class ExcelUtils {
	
	public void downloadCategoryExcelFile(String excelFileName, HttpServletResponse response,
			String sheetName, String[] columnName, List<CategoryDto> dto) {
		String fileName = "";
		try {
			fileName = new String((excelFileName + ".xlsx").getBytes("utf-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		
		Workbook workbook = new HSSFWorkbook();
		Sheet sheet = workbook.createSheet(sheetName);
		
		Row row = null;
		Cell cell = null;
		int rowNum = 0;
		
		row = sheet.createRow(rowNum);
		for( int i = 0; i <= columnName.length -1; i++ ) {
			cell = row.createCell(i);
			cell.setCellValue(columnName[i]);	
		}
		rowNum += 1;
		//수정부분
		makeCategoryBody(dto,row,sheet,cell,rowNum);
		
		try {
			workbook.write(response.getOutputStream());
			workbook.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}	
	
	public void makeCategoryBody(List<CategoryDto> listdto, Row row, Sheet sheet,
			Cell cell, int rowNum) {
		//
		for (int i = 0; i < listdto.size(); i++) {
			row = sheet.createRow(rowNum++);
			CategoryDto dto = listdto.get(i);
			cell = row.createCell(0);
			cell.setCellValue(dto.getKan_code());
			cell = row.createCell(1);
			cell.setCellValue(dto.getCls_nm_1());
			cell = row.createCell(2);
			cell.setCellValue(dto.getCls_nm_2());
			cell = row.createCell(3);
			cell.setCellValue(dto.getCls_nm_3());
			cell = row.createCell(4);
			cell.setCellValue(dto.getCls_nm_4());
		}
	}

	
}
