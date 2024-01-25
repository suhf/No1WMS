package com.no1.wms.excel;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class ExcelRequestManager {
	
	public List<HashMap<String, String>> parseExcelSpringMultiPart
	(Map<String, MultipartFile> files , String KeyStr, int fileKeyParam,String atchFileId ,String storePath,HttpServletRequest request) throws Exception{
	    List<HashMap<String, String>> list = null;

	    int fileKey = fileKeyParam;
	    
	    String storePathString = "";
	    String atchFileIdString = "";
	    
	    // String folder = "D:/excel";
	    String folder = "/excel";
	    
	    if ("".equals(storePath) || storePath == null) {
	        storePathString = folder+"/excelfiles/upload/";
	    } else {
	        storePathString = folder+"/excelfiles/upload/"+storePath;
	    }
	 
	    if (!"".equals(atchFileId) || atchFileId != null) {
	        atchFileIdString = atchFileId;
	    } 
	 
	    File saveFolder = new File(EgovWebUtil.filePathBlackList(storePathString));
	    
	    //폴더 없으면 생성
	    if (!saveFolder.exists() || saveFolder.isFile()) {
	        saveFolder.mkdirs();
	    }
	    
	    Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
	    MultipartFile file;
	    String filePath = "";
	 
	    while (itr.hasNext()) {
	    	//파일 이름을 가져오는데 파일이 여러개일 경우 
	        Entry<String, MultipartFile> entry = itr.next();
	        
	        file = entry.getValue();
	        String orginFileName = file.getOriginalFilename();
	        
	        if ("".equals(orginFileName)) {
	        continue;
	        }
	  
	        //파일의 확장자
	        int index = orginFileName.lastIndexOf(".");
	        String fileExt = orginFileName.substring(index + 1);
	        //파일의 이름 정하기 지정한 KeyStr값과 시간 값과 fileKey를 넣어서 만듬
	        String newName = KeyStr + getTimeStamp() + fileKey;
	 
	        if (!"".equals(orginFileName)) {
	        filePath = storePathString + File.separator + newName+"."+fileExt;
	        file.transferTo(new File(EgovWebUtil.filePathBlackList(filePath)));
	        }
	            list = ExcelManagerXlsx.getInstance().getListXlsxRead(filePath);
	        
	        fileKey++;
	    }    
	    return list;
	}
	
	 private static String getTimeStamp() {
	        long currentTimeMillis = System.currentTimeMillis();
	        Date currentDate = new Date(currentTimeMillis);
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");
	        String formattedTimeStamp = dateFormat.format(currentDate);
	        return formattedTimeStamp;
	    }
	 
	 
}
