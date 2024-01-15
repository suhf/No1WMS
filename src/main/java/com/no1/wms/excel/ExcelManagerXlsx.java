package com.no1.wms.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelManagerXlsx {

	private static ExcelManagerXlsx excelXlsxMng;

	public ExcelManagerXlsx() {
	}

	public static ExcelManagerXlsx getInstance() {
		if (excelXlsxMng == null) {
			excelXlsxMng = new ExcelManagerXlsx();
		}
		return excelXlsxMng;
	}

	public List<HashMap<String, String>> getListXlsxRead(String excel) throws Exception {
    	 
    	List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
    	File file = new File( excel );
    	if( !file.exists() || !file.isFile() || !file.canRead() ) {
    	throw new IOException( excel );
    	}
    	XSSFWorkbook wb = new XSSFWorkbook( new FileInputStream(file) );
    	 
    	//xls시 이용
    	//HSSFWorkbook  wb = new HSSFWorkbook ( new FileInputStream(file) );
    	 
    	int sheetIndex = 0;
    	 
    	try {
    	// 모든 시트 순회
    	for( int i=0; i<1; i++ ) {  
    		XSSFSheet sheet = wb.getSheetAt(sheetIndex);
    	   for( Row row : sheet ) {
    		   // 첫 번째 시트만 사용
    	       if(row.getRowNum() == 0) {
    	    	   continue;
               }
    	       
    	       HashMap<String, String> hMap = new HashMap<String, String>();
    	       String valueStr = ""; 
    	       
    	       int cellLength = (int) row.getLastCellNum();///
    	       
    	       for (int j = 0; j < row.getLastCellNum(); j++) {
    	    	   Cell cell = row.getCell(j);
    	       
    	    	   if (cell == null || cell.getCellType() == CellType.BLANK) {
		    	    valueStr = "";
		    	  }else{
		    	    switch(cell.getCellType()){
		    	        case STRING :
		    	            valueStr = cell.getStringCellValue();
		    	            break;
		    	        case NUMERIC : // 날짜 형식이든 숫자 형식이든 다 CELL_TYPE_NUMERIC으로 인식함.
		    	            if(DateUtil.isCellDateFormatted(cell)){ // 날짜 유형의 데이터일 경우,
		    	                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		    	                String formattedStr = dateFormat.format(cell.getDateCellValue());
		    	                valueStr = formattedStr;
		    	                break;
		    	            }else{ //숫자 데이터일 경우,
		    	                Double numericCellValue = cell.getNumericCellValue();
		    	                if(Math.floor(numericCellValue) == numericCellValue){ // 소수점 이하를 버린 값이 원래의 값과 같다면,,
		    	                    valueStr = numericCellValue.intValue() + ""; // int형으로 소수점 이하 버리고 String으로 데이터 담는다.
		    	                }else{
		    	                    valueStr = numericCellValue + "";
		    	                }
		    	                break;
		    	            }
		    	        case BOOLEAN :
		    	            valueStr = cell.getBooleanCellValue() + "";
		    	            break;
		    	    }
    	         
	    	  }
    	    	// 엑셀의 열 인덱스와 함께 값 매핑    
    	    	   hMap.put("cell_"+j ,valueStr);
	    	           
	    	       }
    	    // 결과 리스트에 추가
	    	      list.add(hMap);
	    	 }
    	   	sheetIndex++;
	    	}
	    	 
    	}catch(Exception ex){
	    	ex.printStackTrace();
	    	}

	return list;
	}

}
