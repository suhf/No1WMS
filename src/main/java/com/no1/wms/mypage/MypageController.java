package com.no1.wms.mypage;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.no1.wms.account.AccountDto;
import com.no1.wms.account.AccountService;

@Controller
public class MypageController {

	@Autowired
	AccountService accountService;

	@Autowired
	ImgService imgService;
	
	
	@GetMapping("/mypage")
	public String mypage(Model m, HttpSession session) {

		//HttpSession session = request.getSession();
		AccountDto dto = (AccountDto) session.getAttribute("userData");
		
		//System.out.println(dto.getId());
		
		AccountDto list = accountService.selectById(dto);
		m.addAttribute("list", list);
		
		String id = list.getId();
		
		ClassPathResource resource = new ClassPathResource("/static/img/mypage/profile");
		String storePathString;
		try {
			storePathString = resource.getFile().getAbsolutePath();
			String jpg = storePathString + File.separator + id + "." + "jpg";
			String png = storePathString + File.separator + id + "." + "png";
			String jpeg = storePathString + File.separator + id + "." + "jpeg";
			File existingJpgFile = new File(jpg);
			File existingPngFile = new File(png);
			File existingJpegFile = new File(jpeg);
			
			String imgSrc = "";
			if(existingJpgFile.exists()) {
				imgSrc = "/resources/static/img/mypage/profile/"+ id +".jpg";
				//System.out.println("jpg");
			}else if(existingPngFile.exists()) {
				imgSrc = "/resources/static/img/mypage/profile/"+ id +".png";
				//System.out.println("png");
			}else if(existingJpegFile.exists()) {
				imgSrc = "/resources/static/img/mypage/profile/"+ id +".jpeg";
				//System.out.println("jpeg");
			}else {
				imgSrc = "/resources/static/img/mypage/profile/defaultimg.png";
				//System.out.println("default");
			}
			m.addAttribute("imgSrc", imgSrc);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "mypage/mypage";
	}

	@ResponseBody
	@PutMapping("/mypage/updateUserInfo")
	public boolean updateUserInfo(AccountDto dto) {
		int i = accountService.update(dto);
		System.out.println(i);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	@PostMapping("/mypage/uplodeImg")
	public String imgFileUplode(HttpServletRequest request,HttpSession session , MultipartFile file) {
		//System.out.println(file);
		//HttpSession session = request.getSession();
		AccountDto dto = (AccountDto) session.getAttribute("userData");
		String fileName = dto.getId();
		//System.out.println(fileName);
		imgService.imgFileUplode(request, file, fileName);
		
		return "redirect:/mypage";
	}
	

}
