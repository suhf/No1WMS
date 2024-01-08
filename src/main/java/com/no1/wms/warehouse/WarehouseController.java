package com.no1.wms.warehouse;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
public class WarehouseController {

	@Autowired
	WarehouseService service;
	
	// 재고 리스트 출력
	@GetMapping("warehouse/list")
	public String list(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
					   @RequestParam(name = "search", defaultValue = "") String search,
					   @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = service.count(searchn, search);
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		
		//스톡서비스로 재고 리스트 출력 메서트 작성
		List<Object> dto = service.list(searchn, search, perPage);
		m.addAttribute("wlist", dto);
		
		int pageNum = 4;//보여질 페이지 번호 수
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수
	
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if (end > totalPages) {
			end = totalPages;
		}
		m.addAttribute("begin", begin);
		m.addAttribute("end", end);
		m.addAttribute("pageNum", pageNum);
		m.addAttribute("totalPages", totalPages);
		
		return "warehouse/list";
	}
				
	
	// 재고 상세페이지
	@PostMapping("warehouse/read/{id}")
	public String read(@PathVariable String id, Model m) {
		//스톡서비스로 재고 상세페이지 출력 메서드 작성
		WarehouseDto dto = service.warehouseOne(id);
		m.addAttribute("dto", dto);
		return "warehouse/read/";
	}

	
	// 수정 - 폼 
	@GetMapping("/warehouse/update/{id}")
	public String update(@PathVariable String id, Model m) {
		WarehouseDto dto = service.warehouseOne(id);
		m.addAttribute("dto", dto);
		return "warehouse/update";
	}


	// 수정 프로세스
	@PutMapping("/warehouse/update_process")
	@ResponseBody
	public String updateProcess(WarehouseDto dto) {
		service.updateWarehouse(dto);
		return "redirect:list";
	}


	// 생성 폼
	@GetMapping("/warehouse/create")
	public String create()
	{
		return "warehouse/create";
	}


	// 생성 프로세스
	@PostMapping("/warehouse/create_process")
	@ResponseBody
	public String createProcess(WarehouseDto dto) {
		service.createWarehouse(dto);
		return "redirect:list";// 글목록
	}


	// 삭제
	@DeleteMapping("/warehouse/delete")
	@ResponseBody
	public int delete(String id) {
		int i = service.deleteWarehouse(id);
		return i;
	}
}
