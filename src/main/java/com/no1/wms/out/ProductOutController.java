package com.no1.wms.out;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequestMapping("/out")
public class ProductOutController {

	@Autowired
	ProductOutService service;
	
	// 출고 리스트 출력
	@GetMapping("/list")
	public String list(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
					   @RequestParam(name = "search", defaultValue = "") String search,
					   @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = service.count(searchn, search);

		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;

		//스톡서비스로 재고 리스트 출력 메서트 작성
		List<Map<String, Object>> dto = service.list(searchn, search, startRow ,perPage);
		m.addAttribute("olist", dto);

		m.addAttribute("start", startRow + 1);

		int pageNum = 5;//보여질 페이지 번호 수
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if (end > totalPages) {
			end = totalPages;
		}
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);
		m.addAttribute("begin", begin);
		m.addAttribute("end", end);
		m.addAttribute("pageNum", pageNum);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("p" , page);

		System.out.println("테스트 : : " + m);


		return "out/list";
	}



	
	// 재고 상세페이지
	@PostMapping("/read")
	public String read(@RequestParam String id, Model m) {
		//스톡서비스로 재고 상세페이지 출력 메서드 작성
		Map<String, Object> dto = service.outOne(id);
		m.addAttribute("dto", dto);
		return "out/read";
	}

	
	// 수정 - 폼 
	@PostMapping("/update")
	public String update(String id, Model m) {
		Map<String, Object>  dto = service.outOne(id);
		m.addAttribute("dto", dto);
		return "out/update";
	}


	// 수정 프로세스
	@PutMapping("/update_process")
	@ResponseBody
	public boolean updateProcess(ProductOutDto dto) {

		int i = service.outUpdate(dto);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}



	// 생성 폼
	@PostMapping("/create")
	public String create() {
		return "out/create";
	}


	// 생성 - Ajax
	@PostMapping("/create_process")
	@ResponseBody
	public boolean createProcess(ProductOutDto dto) {
		System.out.println("테스트 : : " + dto);
		int i = service.createOut(dto);
		if (i != 0) {
			return true;
		} else {
			return false;
		}
	}


	// 삭제
	@DeleteMapping("/delete")
	@ResponseBody
	public int delete(ProductOutDto dto) {
		System.out.println("데이터 :: " + dto);
		int i = service.deleteOut(dto);

		return i;
	}


	//즉시 출고
	@PutMapping("/outNow")
	@ResponseBody
	public boolean outNow(ProductOutDto dto) {
		int i = service.outNowUpdate(dto);
		if (i != 0) {
			service.updateWarehouseDeleteStock(dto);
			return true;
		} else {
			return false;
		}
	}



	@PostMapping("/show_modal")
	public ModelAndView showModal(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
								  @RequestParam(name = "search", defaultValue = "") String search,
								  @RequestParam(name = "p",  defaultValue = "1") int page,
								  @RequestParam String name, ModelAndView mav){

		int perPage = 5; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;

		List<Map<String, Object>> list = null;
		int count = 0;

		//테스트
		System.out.println("name : " + name);
		System.out.println("list : " + list);
		System.out.println("count : " + count);
		System.out.println("mav : " + mav);
		//테스트

		// 모달 선택
		if(name.equals("stock_product_warehouse")){
			list = service.stockSelect(searchn, search, startRow, perPage);
			count = service.stockCount(searchn, search);
		}else if(name.equals("warehouse_capacity_currentCapacity")) {
		}

		mav.addObject("list", list);

		mav.addObject("start", startRow + 1);

		int pageNum = 5;//보여질 페이지 번호 수
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if (end > totalPages) {
			end = totalPages;
		}
		mav.addObject("searchn", searchn);
		mav.addObject("search", search);
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("pageNum", pageNum);
		mav.addObject("totalPages", totalPages);
		mav.addObject("p" , page);

		mav.setViewName(name);

		//테스트
		System.out.println("name : " + name);
		System.out.println("list : " + list);
		System.out.println("count : " + count);
		System.out.println("mav : " + mav);
		//테스트
		return mav;
	}
}
