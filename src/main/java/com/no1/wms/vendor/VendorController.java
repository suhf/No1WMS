package com.no1.wms.vendor;

import com.no1.wms.category.CategoryDto;
import com.no1.wms.excel.ExcelDownlodeUtils;
import com.no1.wms.excel.ExcelRequestManager;
import com.no1.wms.warehouse.WarehouseDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class VendorController {

	@Autowired
	VendorService service;

	@Autowired
	ExcelDownlodeUtils excelDownlodeUtils;
	
	// 재고 리스트 출력
	@GetMapping("vendor/list")
	public String list(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
					   @RequestParam(name = "search", defaultValue = "") String search,
					   @RequestParam(name = "p", defaultValue = "1") int page, Model m) {

		int count = service.count(searchn, search);
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		
		//스톡서비스로 재고 리스트 출력 메서트 작성
		List<VendorDto> dto = service.list(searchn, search, startRow ,perPage);


		m.addAttribute("vlist", dto);
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
		
		return "vendor/list";
	}
				
	
	// 재고 상세페이지
	@PostMapping("vendor/read")
	public String read(String id, Model m) {
		//스톡서비스로 재고 상세페이지 출력 메서드 작성

		VendorDto One = service.vendorOne(id);
		System.out.println("one :: " + One);
		log.debug("One테스트 :: " + One);

		m.addAttribute("One", One);

		return "vendor/read";
	}

	
	// 수정 - 폼 
	@PostMapping("/vendor/update")
	public String update(String id, Model m) {
		VendorDto dto = service.vendorOne(id);
		m.addAttribute("dto", dto);
		return "vendor/update";
	}


	// 수정 프로세스
	@PutMapping("/vendor/update_process")
	@ResponseBody
	public boolean updateProcess(VendorDto dto) {

		int i = service.updateVendor(dto);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}


	// 생성 폼
	@PostMapping("/vendor/create")
	public String create()
	{
		return "vendor/create";
	}


	// 생성 프로세스
	@PostMapping("/vendor/create_process")
	@ResponseBody
	public boolean createProcess(VendorDto dto) {
		int i = service.createVendor(dto);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}


	// 삭제
	@DeleteMapping("/vendor/delete")
	@ResponseBody
	public int delete(String id) {
		int i = service.deleteVendor(id);
		return i;
	}

	// 엑셀다운로드테스트
	@GetMapping("/vendor/downlodeExcelList")
	public void downlodeExcelList(HttpServletResponse response) {
		List<VendorDto> dto = service.selectAll();
		String excelFileName = "거래처 파일";
		String sheetName = "거래처";
		String[] columnName = {"업체명","대표자명","주소","사엄자등록번호","이메일","대표번호","거래처 담당자 이름","거래처 담당자 연락 번호","주요품목"};
		excelDownlodeUtils.downloadVendorExcelFile(excelFileName, response, sheetName, columnName, dto);

	};

	//서식 다운로드
	@GetMapping("/vendor/downlodeVendorForm")
	public void downlodeVendorForm (HttpServletResponse response) throws IOException {
		String vendorFormName = "거래처 데이터 입력 서식.xlsx";
		excelDownlodeUtils.downlodeExcelForm(response, vendorFormName);
	};



	@PostMapping("/vendor/uplodeExcel")
	public String uploadExcel(@ModelAttribute("dto") VendorDto dto , RedirectAttributes redirectAttributes, final MultipartHttpServletRequest multiRequest,
							  HttpServletRequest request, ModelMap model) {

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


				dto.setName(apply.get(i).get("nsme"));
				dto.setPresident_name(apply.get(i).get("president_name"));
				dto.setAddress(apply.get(i).get("address"));
				dto.setRegistration_number(apply.get(i).get("registration_number"));
				dto.setEmail(apply.get(i).get("email"));
				dto.setPresident_telephone(apply.get(i).get("president_telephone"));
				dto.setVendor_manager(apply.get(i).get("vendor_manager"));
				dto.setVendor_manager_telephone(apply.get(i).get("vendor_manager_telephone"));
				dto.setMain_product(apply.get(i).get("main_product"));
				dto.setManager_id(apply.get(i).get("manager_id"));
				dto.setActivation(true);

				service.createProcess(dto);

			}

			resMap.put("res", "ok");
			resMap.put("msg", "업로드 성공");
		} catch (Exception e) {
			System.out.println(e.toString());
			resMap.put("res", "error");
			resMap.put("msg", "업로드 실패");
		}

		redirectAttributes.addFlashAttribute("resMap", resMap);

		return "redirect:/vendor/list";
	};
}
