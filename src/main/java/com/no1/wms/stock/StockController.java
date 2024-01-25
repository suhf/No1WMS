package com.no1.wms.stock;


import com.no1.wms.excel.ExcelDownlodeUtils;
import com.no1.wms.vendor.VendorDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequestMapping("/stock")
public class StockController {

	@Autowired
	StockService service;

	@Autowired
	ExcelDownlodeUtils excelDownlodeUtils;
	
	// 탭 1 재고 리스트 출력
	@GetMapping("/list")
	public String list(@RequestParam(name = "searchn1", defaultValue = "0") int searchn1,
					   @RequestParam(name = "search1", defaultValue = "") String search1,
					   @RequestParam(name = "p1", defaultValue = "1") int p1,
					   @RequestParam(name = "searchn2", defaultValue = "0") int searchn2,
					   @RequestParam(name = "search2", defaultValue = "") String search2,
					   @RequestParam(name = "p2", defaultValue = "1") int p2,
					   Model m) {
		int count = service.count(searchn1, search1);

		int perPage1 = 10; // 한 페이지에 보일 글의 갯수
		int startRow1 = (p1 - 1) * perPage1;

		//스톡서비스로 재고 리스트 출력 메서트 작성
		List<Map<String, Object>> dto1 = service.list(searchn1, search1, startRow1 ,perPage1);
		m.addAttribute("slist1", dto1);

		m.addAttribute("start1", startRow1 + 1);

		int pageNum1 = 5;//보여질 페이지 번호 수
		int totalPages1 = count / perPage1 + (count % perPage1 > 0 ? 1 : 0); // 전체 페이지 수

		int begin1 = (p1 - 1) / pageNum1 * pageNum1 + 1;
		int end1 = begin1 + pageNum1 - 1;
		if (end1 > totalPages1) {
			end1 = totalPages1;
		}
		m.addAttribute("searchn1", searchn1);
		m.addAttribute("search1", search1);
		m.addAttribute("begin1", begin1);
		m.addAttribute("end1", end1);
		m.addAttribute("pageNum1", pageNum1);
		m.addAttribute("totalPages1", totalPages1);
		m.addAttribute("p1" , p1);


		//탭 2
		int count2 = service.count2(searchn2, search2);
		System.out.println("count2 ::" + count2);

		int perPage2 = 10; // 한 페이지에 보일 글의 갯수
		int startRow2 = (p2 - 1) * perPage2;

		//스톡서비스로 재고 리스트 출력 메서트 작성
		List<Map<String, Object>> dto2 = service.list2(searchn2, search2, startRow2 ,perPage2);
		System.out.println("dto ::" + dto2);

		m.addAttribute("slist2", dto2);

		m.addAttribute("start2", startRow2 + 1);

		int pageNum2 = 5;//보여질 페이지 번호 수
		int totalPages2 = count2 / perPage2 + (count2 % perPage2 > 0 ? 1 : 0); // 전체 페이지 수

		int begin2 = (p2 - 1) / pageNum2 * pageNum2 + 1;
		int end2 = begin2 + pageNum2 - 1;
		if (end2 > totalPages2) {
			end2 = totalPages2;
		}
		m.addAttribute("searchn2", searchn2);
		m.addAttribute("search2", search2);
		m.addAttribute("begin2", begin2);
		m.addAttribute("end2", end2);
		m.addAttribute("pageNum2", pageNum2);
		m.addAttribute("totalPages2", totalPages2);
		m.addAttribute("p2" , p2);

		
		return "stock/list";
	}


				
	
	// 재고 상세페이지
	@PostMapping("/read")
	public String read(@RequestParam String id, Model m) {
		//스톡서비스로 재고 상세페이지 출력 메서드 작성
		Map<String, Object> dto = service.stockOne(id);
		m.addAttribute("dto", dto);
		return "stock/read";
	}

	
	// 수정 - 폼 
	@PostMapping("/update")
	public String update(String id, Model m) {
		Map<String, Object>  dto = service.stockOne(id);
		m.addAttribute("dto", dto);
		return "stock/update";
	}


	// 수정 프로세스
	@PutMapping("/update_process")
	@ResponseBody
	public boolean updateProcess(StockDto dto) {

		int i = service.updateStock(dto);
		if (i == 1) {
			service.updateWarehouse(dto);
			return true;
		} else {
			return false;
		}
	}



	// 생성 폼
	@PostMapping("/create")
	public String create() {
		return "stock/create";
	}


	// 생성 - Ajax
	@PostMapping("/create_process")
	@ResponseBody
	public int createProcess(StockDto dto) {
		int c = service.checkandUpdateOrCreateProcess(dto);
			return c;
	}


	// 삭제
	@PutMapping("/delete")
	@ResponseBody
	public int delete(StockDto dto) {
		System.out.println("데이터 :: " + dto);
		int i = service.deleteStock(dto);
		service.updateWarehouseDeleteStock(dto);
		return i;
	}



	@PostMapping("/show_modal")
	public ModelAndView showModal(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
								  @RequestParam(name = "search", defaultValue = "") String search,
								  @RequestParam(name = "p",  defaultValue = "1") int page,
								  @RequestParam String name, ModelAndView mav){

		int perPage = 9; // 한 페이지에 보일 글의 갯수
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
		if(name.equals("product_category_company_search")){
			list = service.productSelect(searchn, search, startRow, perPage);
			count = service.productCount(searchn, search);
		}else if(name.equals("warehouse_capacity_currentCapacity")) {
			list = service.warehousesSelect(searchn, search, startRow, perPage);
			count = service.warehouseCount(searchn, search);
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


	// 리스트 다운로드
	@GetMapping("/downloadExcelList")
	public void downlodeExcelList(HttpServletResponse response) {
		List<Map<String, Object>> dto = service.selectAll();
		System.out.println("엑셀 출력 확인 : : " + dto);
		String excelFileName = "재고 파일";
		String sheetName = "재고";
		String[] columnName = {"제품명","카테고리","창고","재고수"};
		excelDownlodeUtils.downloadStockExcelFile(excelFileName, response, sheetName, columnName, dto);

	};

	@GetMapping("/downloadExcelList2")
	public void downlodeExcelList2(HttpServletResponse response) {
		List<Map<String, Object>> dto = service.selectAll2();
		System.out.println("엑셀 출력 확인 : : " + dto);
		String excelFileName = "부족한 재고 파일";
		String sheetName = "부족한 재고";
		String[] columnName = {"제품명","카테고리","창고","재고수"};
		excelDownlodeUtils.downloadStockExcelFile(excelFileName, response, sheetName, columnName, dto);

	};

	//서식 다운로드
	@GetMapping("/downloadStockForm")
	public void downlodeStockForm (HttpServletResponse response) throws IOException {
		String stockFormName = "재고 데이터 입력 서식.xlsx";
		excelDownlodeUtils.downlodeExcelForm(response, stockFormName);
	};
}



