package com.no1.wms.mypage;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.no1.wms.excel.EgovWebUtil;

@Service
public class ImgService {
	
	
	public void imgFileUplode(HttpServletRequest request, MultipartFile imageFile, String fileName) {
			
			String storePathString = "";
			try {
				
				//ClassPathResource resource = new ClassPathResource("/static/img/mypage/profile");
				//storePathString = "D:/static/img/mypage/profile";
				storePathString = "/static/img/mypage/profile";
						//resource.getFile().getAbsolutePath();
				
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
		    String filePath = storePathString + File.separator + newFileName + ".jpg";//+ fileExt;
		    
		    try {
		        // 동일한 파일명이 존재하는지 확인하고 있다면 기존 파일 삭제
				String jpg = storePathString + File.separator + newFileName + "." + "jpg";
				String png = storePathString + File.separator + newFileName + "." + "png";
				String jpeg = storePathString + File.separator + newFileName + "." + "jpeg";
				File existingJpgFile = new File(jpg);
				File existingPngFile = new File(png);
				File existingJpegFile = new File(jpeg);
				
		        String imgSrc = "";
				if(existingJpgFile.exists()) {
					existingJpgFile.delete();
				}else if(existingPngFile.exists()) {
					existingPngFile.delete();
				}else if(existingJpegFile.exists()) {
					existingJpegFile.delete();
				}
 
		        // 이미지를 지정된 경로에 저장
		        imageFile.transferTo(new File(EgovWebUtil.filePathBlackList(filePath)));
		        //System.out.println("Image file saved at: " + filePath);
		        
		    } catch (IOException e) {
		        e.printStackTrace();
		    }	    
		}	
	
}
