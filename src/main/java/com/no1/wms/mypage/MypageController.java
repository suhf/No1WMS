package com.no1.wms.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String mypage(Model m, HttpServletRequest request) {

		HttpSession session = request.getSession();
		AccountDto dto = (AccountDto) session.getAttribute("userData");

		AccountDto list = accountService.selectById(dto);
		m.addAttribute("list", list);

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
	public String imgFileUplode(HttpServletRequest request, MultipartFile file) {
		System.out.println(file);
		HttpSession session = request.getSession();
		AccountDto dto = (AccountDto) session.getAttribute("userData");
		String fileName = dto.getId();
		System.out.println(fileName);
		imgService.imgFileUplode(request, file, fileName);
		
		return "redirect:/mypage";
	}
	

}
