package com.no1.wms.base;

import com.no1.wms.account.AccountDto;
import com.no1.wms.account.AccountService;
import com.no1.wms.authority.AuthorityDto;
import com.no1.wms.authority.AuthorityService;
import com.no1.wms.in.InDto;
import com.no1.wms.in.InService;
import com.no1.wms.stock.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BaseController {


    @Autowired
    StockService service;

    @Autowired
    InService inService;
    @GetMapping("/")
    public String mainPage(@RequestParam(name = "searchn2", defaultValue = "0") int searchn2,
                           @RequestParam(name = "search2", defaultValue = "") String search2,
                           @RequestParam(name = "p2", defaultValue = "1") int p2, Model m) {

        int perPage2 = 5; // 한 페이지에 보일 글의 갯수
        int startRow2 = (p2 - 1) * perPage2;

        List<Map<String, Object>> dto2 = service.list2(searchn2, search2, startRow2 ,perPage2);
        m.addAttribute("slist2", dto2);
        System.out.println("리스트 확인 : : " + dto2);


        Date today = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = dateFormat.format(today);

        List<InDto> dto = inService.inListMain(formattedDate);
        m.addAttribute("inDto", dto);

        return "base/main";
    }
    
    


}
