package com.no1.wms.base;

import com.no1.wms.stock.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class MainPageController {

    @Autowired
    StockService service;

	@GetMapping("/main")
    public String mainPage(@RequestParam(name = "searchn2", defaultValue = "0") int searchn2,
                           @RequestParam(name = "search2", defaultValue = "") String search2,
                           @RequestParam(name = "p2", defaultValue = "1") int p2, Model m) {

        int perPage2 = 5; // 한 페이지에 보일 글의 갯수
        int startRow2 = (p2 - 1) * perPage2;

        List<Map<String, Object>> dto2 = service.list2(searchn2, search2, startRow2 ,perPage2);
        m.addAttribute("slist2", dto2);
        System.out.println("리스트 확인 : : " + dto2);
    	return "base/main";
    }
}
