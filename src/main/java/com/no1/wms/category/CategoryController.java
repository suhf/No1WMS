package com.no1.wms.category;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.no1.wms.excel.ExcelUtils;



@Controller
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ExcelUtils excelUtils;
	
	//테스트
	@GetMapping("/category/test")
	public String testPage(Model m) {
		List<CategoryDto> dto = categoryService.selectAllCategory();
		m.addAttribute("dto", dto);

		return "category/test";
	}
	
	// 카테고리 리스트 출력
	@GetMapping("/category/list")
	public String list(@RequestParam(name = "p", defaultValue = "1") int p, Model m) {

		// 서비스로 카테고리 목록 불러오는 메서드 작성
		List<CategoryDto> dto = categoryService.categoryList(p);
		m.addAttribute("list", dto);
		return "category/list";
	}

	// 상세페이지
	@PostMapping("/category/read")
	public String read(String kan_code, Model m) {
		// 선택한 kan_code를 바탕으로 원하는 상세정보 출력하는 메서드 작성
		CategoryDto dto = categoryService.selectByKanCode(kan_code);
		m.addAttribute("dto", dto);
		return "category/read";
	}

	// 생성 - 폼
	@PostMapping("/category/create")
	public String create() {
		return "category/create";
	}
	
	
	// 생성 - Ajax
	@PostMapping("/category/create_process")
	@ResponseBody
	public boolean createProcess(CategoryDto dto) {
		int i = categoryService.createProcess(dto);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}

	// 수정 - 폼
	@PostMapping("/category/update")
	public String update(String kan_code, Model m) {
		CategoryDto dto = categoryService.selectByKanCode(kan_code);
		m.addAttribute("dto", dto);
		return "category/update";
	}
	// 수정 - Ajax

	@PutMapping("/category/update_process")
	@ResponseBody
	public boolean updateProcess(CategoryDto dto) {

		int i = categoryService.updateByKanCode(dto);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}

	// 삭제
	@DeleteMapping("/category/delete/{kan_code}")
	@ResponseBody
	public int delete(@PathVariable String kan_code) {
		int i = categoryService.deactivateByKanCode(kan_code);
		if (i == 1) {
			return i;
		} else {
			// ajax테스트후 결정
			// m.addAttribute("dto", dto);
			return 0;
		}
	}
	
	// 엑셀다운로드테스트
	@GetMapping("/category/download")
	public void downloadExcel(HttpServletResponse response) {
		List<CategoryDto> dto = categoryService.selectAllCategory();
		String excelFileName = "카테고리 테스트 파일";
		String sheetName = "카테고리";
		String[] columnName = {"KAN_CODE","대분류","중분류","소분류","세분류"};
		excelUtils.downloadCategoryExcelFile(excelFileName, response, sheetName, columnName, dto);
		
	}
	
	// KAN코드 중복확인 메서드
	@PostMapping("/category/checkKancode")
	@ResponseBody
	public String chackKancode(String kan_code) {
		String checkkan = categoryService.kanCheck(kan_code);
		return checkkan;
	}
	
	
	
}
