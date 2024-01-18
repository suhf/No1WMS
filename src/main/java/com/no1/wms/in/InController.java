package com.no1.wms.in;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/in")
public class InController {
	
	@Autowired
	InService inService;
	
	@GetMapping("/list")
	//@ResponseBody
	public String list(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
   			@RequestParam(name = "search", defaultValue = "") String search,
   			@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		
		int count = inService.count(searchn, search);
		
		int perPage = 15;
		int startRow = (page - 1) * perPage;
		
		List<InDto> dto = inService.inList(searchn, search, startRow, perPage);
		
		int pageNum = 5;//보여질 페이지 번호 수
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if (end > totalPages) {
			end = totalPages;
		}
		
		m.addAttribute("list", dto);
		m.addAttribute("start", startRow + 1);
		m.addAttribute("searchn",searchn);
		m.addAttribute("search",search);
		m.addAttribute("begin", begin);
		m.addAttribute("end", end);
		m.addAttribute("pageNum", pageNum);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("p" , page);
		
		
		return "/in/list";
		
	}
	@PostMapping("/create")
	public String create() {
		return "in/create";
	}
	
	
	
}
