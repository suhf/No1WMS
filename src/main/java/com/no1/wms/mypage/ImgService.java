package com.no1.wms.mypage;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.no1.wms.excel.EgovWebUtil;

@Service
public class ImgService {
	

	@Autowired
	private ServletContext servletContext;
	
	public void imgFileUplode(HttpServletRequest request, MultipartFile imageFile, String fileName) {
			
			String storePathString = "";
			try {
				
		        storePathString = servletContext.getRealPath("/img/mypage/profile/");
		        System.out.println("storePathString : " + storePathString);
		        
				//String path = ResourceUtils.getFile("classpath:static/img/mypage/profile/").toPath().toString();
				//String storePathString = path;
				//System.out.println("storePathString : " + storePathString);
		        
			} catch (Exception e) {
				e.printStackTrace();
			}
			File saveFolder = new File(EgovWebUtil.filePathBlackList(storePathString));
			//폴더 없으면 생성
			if (!saveFolder.exists() || saveFolder.isFile()) {
		        saveFolder.mkdirs();
		    }
			// 원본 파일 이름 가져오기
			String originalFileName = imageFile.getOriginalFilename();
			// 확장자 추출
		    int index = originalFileName.lastIndexOf(".");
		    String fileExt = originalFileName.substring(index + 1);
		    
		    String newFileName = fileName;
		    // 저장될 파일 경로 설정
		    //String filePath = storePathString + File.separator + newFileName + "." + fileExt;
		    String filePath = storePathString + newFileName + "." + fileExt;
		    try {
		        // 동일한 파일명이 존재하는지 확인하고 있다면 기존 파일 삭제
		        File existingFile = new File(filePath);
		        if (existingFile.exists()) {
		            existingFile.delete();
		        }
	
		        // 이미지를 지정된 경로에 저장
		        imageFile.transferTo(new File(EgovWebUtil.filePathBlackList(filePath)));
		        System.out.println("Image file saved at: " + filePath);
		        
		    } catch (IOException e) {
		        e.printStackTrace();
		    }	    
		}	
	
}
