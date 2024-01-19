package com.no1.wms.excel;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.no1.wms.vendor.VendorDto;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import com.no1.wms.category.CategoryDto;




@Service
public class ExcelDownlodeUtils {
	
	//마지막 List<CategoryDto> dto 이부분을 수정해서 만들어야함.
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
		
		Workbook workbook = new XSSFWorkbook();
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

	//엑셀 폼 파일 다운로드 
	//엑셀 폼은 직접 만들어서 src/main/webapp/excelfiles/excelform 이 경로의 폴더안에 넣으면 됩니다.
	//확장자는 .xlsx로 해주세요.
	//매개변수는 HttpServletResponse response와 파일명 String을 넣으면 되고 파일명은 한글도 가능합니다.
	public void downlodeExcelForm(HttpServletResponse response, String formName) throws IOException {
		String excelfilesDirectory = "src/main/webapp/excelfiles/excelform/";
		
		
		File file = new File(excelfilesDirectory+formName);
		
		try( FileInputStream fis = new FileInputStream(file);
		        BufferedInputStream bis = new BufferedInputStream(fis);
		        OutputStream out = response.getOutputStream()){
			String encodedFilename = URLEncoder.encode(formName, "UTF-8").replaceAll("\\+", "%20");
                    
			response.addHeader("Content-Disposition", "attachment;filename=\""+encodedFilename+"\"");
			response.setContentType("application/vnd.ms-excel");
			// 응답 크기 명시
	        response.setContentLength((int)file.length());
	        int read = 0;
	        while((read = bis.read()) != -1) {
	            out.write(read);
	        }
	        
	        
		}catch(IOException e) {
	        e.printStackTrace();
	    }
		
		
	}




	public void downloadVendorExcelFile(String excelFileName, HttpServletResponse response,
										  String sheetName, String[] columnName, List<VendorDto> dto) {
		String fileName = "";
		try {
			fileName = new String((excelFileName + ".xlsx").getBytes("utf-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");

		Workbook workbook = new XSSFWorkbook();
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
		makeVendorBody(dto,row,sheet,cell,rowNum);

		try {
			workbook.write(response.getOutputStream());
			workbook.close();
		} catch (IOException e) {
			e.printStackTrace();
		}


	}

	public void makeVendorBody(List<VendorDto> listdto, Row row, Sheet sheet,
								 Cell cell, int rowNum) {
		//
		for (int i = 0; i < listdto.size(); i++) {
			row = sheet.createRow(rowNum++);
			VendorDto dto = listdto.get(i);
			cell = row.createCell(0);
			cell.setCellValue(dto.getName());
			cell = row.createCell(1);
			cell.setCellValue(dto.getPresident_name());
			cell = row.createCell(2);
			cell.setCellValue(dto.getAddress());
			cell = row.createCell(3);
			cell.setCellValue(dto.getRegistration_number());
			cell = row.createCell(4);
			cell.setCellValue(dto.getEmail());
			cell = row.createCell(5);
			cell.setCellValue(dto.getPresident_telephone());
			cell = row.createCell(6);
			cell.setCellValue(dto.getVendor_manager());
			cell = row.createCell(7);
			cell.setCellValue(dto.getVendor_manager_telephone());
			cell = row.createCell(8);
			cell.setCellValue(dto.getMain_product());
		}
	}



	public void downloadStockExcelFile(String excelFileName, HttpServletResponse response,
										String sheetName, String[] columnName, List<Map<String, Object>> dto) {
		String fileName = "";
		try {
			fileName = new String((excelFileName + ".xlsx").getBytes("utf-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");

		Workbook workbook = new XSSFWorkbook();
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
		makeStockBody(dto,row,sheet,cell,rowNum);

		try {
			workbook.write(response.getOutputStream());
			workbook.close();
		} catch (IOException e) {
			e.printStackTrace();
		}


	}

	public void makeStockBody(List<Map<String, Object>> listdto, Row row, Sheet sheet,
							   Cell cell, int rowNum) {
		//
		for (int i = 0; i < listdto.size(); i++) {
			row = sheet.createRow(rowNum++);
			Map<String, Object> dto = listdto.get(i);
			cell = row.createCell(0);
			cell.setCellValue((String) dto.get("productName"));
			cell = row.createCell(1);
			cell.setCellValue((String) dto.get("cls_nm_4"));
			cell = row.createCell(2);
			cell.setCellValue((String) dto.get("warehouseName"));
			cell = row.createCell(3);
			cell.setCellValue((String) dto.get("quantity"));

		}
	}








}
