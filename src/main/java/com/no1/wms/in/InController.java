package com.no1.wms.in;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.no1.wms.price.PriceDto;
import com.no1.wms.product.ProductDto;
import com.no1.wms.product.ProductService;
import com.no1.wms.stock.StockService;
import com.no1.wms.warehouse.WarehouseDto;
import com.no1.wms.warehouse.WarehouseService;

@Controller
@RequestMapping("/in")
public class InController {
	
	@Autowired
	InService inService;
	@Autowired
	ProductService productService;
	@Autowired
	StockService stockservice;
	@Autowired
	WarehouseService warehouseService;
	
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
	
	
	@PostMapping("/create_process")
	@ResponseBody
	public boolean createProcess(InDto dto) {
		return inService.chechAndUpdateOrCreateProcess(dto);
	}
	
	@PostMapping("/read")
	public String read(String id, Model m) {
		InDto dto = inService.selectById(id);
		String productId = dto.getProduct_id();
		ProductDto pDto = productService.selectById(productId);
		m.addAttribute("pDto", pDto);
		m.addAttribute("dto", dto);
		return "in/read";
	}
	
	// 수정 폼
		@PostMapping("/update")
		public String update(String id, Model m) {
			InDto dto = inService.selectById(id);
			String productId = dto.getProduct_id();
			String warehouseId = dto.getWarehouse_id();
			ProductDto pDto = productService.selectById(productId);
			WarehouseDto wDto = warehouseService.One(warehouseId);
			m.addAttribute("wDto", wDto);
			m.addAttribute("pDto", pDto);
			m.addAttribute("dto", dto);
			return "in/update";
		}
	
		// 수정 - Ajax
		@PutMapping("/update_process")
		@ResponseBody
		public boolean update_process(InDto dto) {
			int i = inService.updateById(dto);
			if (i == 1) {
				return true;
			} else {
				return false;
			}
		}
	
	
	
	
	
	
	
	
	//모달화면
	@PostMapping("/show_modal_product")
	public ModelAndView productShowModal(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
				@RequestParam(name = "search", defaultValue = "") String search,
				@RequestParam(name = "p", defaultValue = "1") int page, ModelAndView m, String name) {
		int count = productService.count(searchn, search);
		
		int perPage = 10; // 한 페이지에 보일 글의 개수
		int startRow = (page - 1) * perPage;
		
		List<ProductDto> dto = productService.productList(searchn, search, startRow ,perPage);
		
		m.addObject("list", dto);
		m.addObject("start", startRow + 1);
		
		int pageNum = 5;//보여질 페이지 번호 수
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if (end > totalPages) {
			end = totalPages;
		}
		
		m.addObject("searchn",searchn);
		m.addObject("search",search);
		m.addObject("begin", begin);
		m.addObject("end", end);
		m.addObject("pageNum", pageNum);
		m.addObject("totalPages", totalPages);
		m.addObject("p" , page);
		m.setViewName(name);
		return m;
	}
	
	@PostMapping("/show_modal_warehouse")
    public ModelAndView warehouseShowModal(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
                                  @RequestParam(name = "search", defaultValue = "") String search,
                                  @RequestParam(name = "p",  defaultValue = "1") int page,
                                  @RequestParam String name, String product_id, ModelAndView mav){

        int perPage = 5; // 한 페이지에 보일 글의 갯수
        int startRow = (page - 1) * perPage;

        List<Map<String, Object>> list = null;
        int count = 0;

        list = stockservice.warehousesSelect(searchn, search, startRow, perPage);
        count = stockservice.warehouseCount(searchn, search);


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
        return mav;
    }
	
	
	
	
	
	
}
