package com.no1.wms.category;


import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.no1.wms.excel.ExcelRequestManager;
import com.no1.wms.excel.ExcelDownlodeUtils;



@Controller
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ExcelDownlodeUtils excelDownlodeUtils;
	
	//테스트
	@GetMapping("/category/test")
	public String testPage(Model m, HttpServletRequest request) {
		

		return "category/test";
	};
	
	// 카테고리 리스트 출력
	@GetMapping("/category/list")
	public String list(@RequestParam(name = "searchn", defaultValue = "4") int searchn,
			   			@RequestParam(name = "search", defaultValue = "") String search,
			   			@RequestParam(name = "p", defaultValue = "1") int page, Model m) {

		int count = categoryService.count(searchn, search);
		
		int perPage = 15; // 한 페이지에 보일 글의 개수
		int startRow = (page - 1) * perPage;
		
		List<CategoryDto> dto = categoryService.categoryList2(searchn, search, startRow ,perPage);
		
		m.addAttribute("list", dto);
		m.addAttribute("start", startRow + 1);
		
		int pageNum = 5;//보여질 페이지 번호 수
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if (end > totalPages) {
			end = totalPages;
		}
		
		m.addAttribute("searchn",searchn);
		m.addAttribute("search",search);
		m.addAttribute("begin", begin);
		m.addAttribute("end", end);
		m.addAttribute("pageNum", pageNum);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("p" , page);
		
		
		// 서비스로 카테고리 목록 불러오는 메서드 작성
		//List<CategoryDto> dto = categoryService.categoryList(page);
		//m.addAttribute("list", dto);
		return "category/list";
	};

	// 상세페이지
	@PostMapping("/category/read")
	public String read(String kan_code, Model m) {
		// 선택한 kan_code를 바탕으로 원하는 상세정보 출력하는 메서드 작성
		CategoryDto dto = categoryService.selectByKanCode(kan_code);
		m.addAttribute("dto", dto);
		return "category/read";
	};

	// 생성 - 폼
	@PostMapping("/category/create")
	public String create() {
		return "category/create";
	};
	
	
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
	};

	// 수정 - 폼
	@PostMapping("/category/update")
	public String update(String kan_code, Model m) {
		CategoryDto dto = categoryService.selectByKanCode(kan_code);
		m.addAttribute("dto", dto);
		return "category/update";
	};
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
	};

	// 삭제
	@DeleteMapping("/category/delete")
	@ResponseBody
	public boolean delete(String kan_code) {
		int i = categoryService.deactivateByKanCode(kan_code);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	};
	
	// 엑셀다운로드테스트
	@GetMapping("/category/downloadTest")
	public void downloadExcelTest(HttpServletResponse response) {
		List<CategoryDto> dto = categoryService.selectAllCategory();
		String excelFileName = "카테고리 테스트 파일";
		String sheetName = "카테고리";
		String[] columnName = {"KAN_CODE","대분류","중분류","소분류","세분류"};
		excelDownlodeUtils.downloadCategoryExcelFile(excelFileName, response, sheetName, columnName, dto);
		
	};
	
	// KAN코드 중복확인 메서드
	@PostMapping("/category/checkKancode")
	@ResponseBody
	public String chackKancode(String kan_code) {
		String checkkan = categoryService.kanCheck(kan_code);
		return checkkan;
	};
	
	//카테고리 검색 모달
	@GetMapping("/category/categorysearch")
	public String categorySearch(@RequestParam(name = "searchn", defaultValue = "4") int searchn,
   								@RequestParam(name = "search", defaultValue = "") String search,
   								@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		
		int count = categoryService.count(searchn, search);
		
		int perPage = 10; // 한 페이지에 보일 글의 개수
		int startRow = (page - 1) * perPage;
		
		List<CategoryDto> dto = categoryService.categoryList2(searchn, search, startRow ,perPage);
		
		m.addAttribute("list", dto);
		m.addAttribute("start", startRow + 1);
		
		int pageNum = 5;//보여질 페이지 번호 수
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if (end > totalPages) {
			end = totalPages;
		}
		m.addAttribute("searchn",searchn);
		m.addAttribute("search",search);
		m.addAttribute("begin", begin);
		m.addAttribute("end", end);
		m.addAttribute("pageNum", pageNum);
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("p" , page);
		
		return "modal/categorysearch";
	};
	
	@GetMapping("/category/downlodeCategoryForm")
	public void downlodeCategoryForm (HttpServletResponse response) throws IOException{
		String categoryFormName = "카테고리 데이터 입력 서식.xlsx";
		excelDownlodeUtils.downlodeExcelForm(response, categoryFormName);		
	};
	
	
	@PostMapping("/category/uplodeExcel")
	public String uploadExcel(@ModelAttribute("dto") CategoryDto dto , RedirectAttributes redirectAttributes,final MultipartHttpServletRequest multiRequest,
	        HttpServletRequest request,ModelMap model) { 
		
		Map<String, Object> resMap = new HashMap<>();
		
		
		try {
	        
			ExcelRequestManager em = new ExcelRequestManager();
		
			// 멀티파트 요청 객체에서 파일 맵을 가져옴
	        final Map<String, MultipartFile> files = multiRequest.getFileMap();
	        //초기화 
	        List<HashMap<String,String>> apply =null;
	        
	        //엑셀파일 가져와서 저장 및 읽기
	        //변수는 멀티파트 요청 객체의 파일맵, 저장할 엑셀파일명 이름에 추가할 숫자(그냥 0으로 해도 됨)
	        //마찬가지로 엑셀파일 명 이름에 추가할 문자열, uplode폴더에 들어갈 폴더명(카테고리같은 파트 이름으로 해주세요)
	        //폴더가 없으면 자동생성되게 해뒀습니다.
	        //마지막으로 HttpServletRequest
	        apply = em.parseExcelSpringMultiPart(files, "테스트파일", 0, "", "category", request);
		
	        for (int i = 0; i < apply.size(); i++) {

	        	dto.setKan_code(apply.get(i).get("cell_0"));
	        	dto.setCls_nm_1(apply.get(i).get("cell_1"));
	        	dto.setCls_nm_2(apply.get(i).get("cell_2"));
	        	dto.setCls_nm_3(apply.get(i).get("cell_3"));
	        	dto.setCls_nm_4(apply.get(i).get("cell_4"));
	        	dto.setActivation(true);
	        	
	        	categoryService.createProcess(dto);
	        	
			}
 
	        resMap.put("res", "ok");
	        resMap.put("msg", "업로드 성공");
	    } catch (Exception e) {
	        System.out.println(e.toString());
	        resMap.put("res", "error");
	        resMap.put("msg", "업로드 실패");
	    }
		
		redirectAttributes.addFlashAttribute("resMap", resMap);
		
		return "redirect:/category/list";
	};
	
	
	

	
	
	
}
