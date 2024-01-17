package com.no1.wms.planin;

import com.no1.wms.account.AccountDto;
import com.no1.wms.planin.PlanInService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("planin")
public class PlanInController {
    @Autowired
    PlanInService planinservice;
    
    @GetMapping("/list")
    public ModelAndView list(ModelAndView mav,@RequestParam(defaultValue = "0") int searchn, @RequestParam(defaultValue = "") String search, @RequestParam(defaultValue = "1") int page){
        int perPage = 10;
        int startRow = (page - 1) * perPage;
        int count = planinservice.count(searchn, search, startRow, perPage);



        int pageNum = 4;//보여질 페이지 번호 수
        int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수




        //스톡서비스로 재고 리스트 출력 메서트 작성
        List<AccountDto> list = planinservice.selectAll(searchn, search, startRow, perPage);

        int begin = (page - 1) / pageNum * pageNum + 1;
        int end = begin + pageNum - 1;
        if (end > totalPages) {
            end = totalPages;
        }
        mav.addObject("list", list);
        mav.addObject("end", end);
        mav.addObject("searchn", searchn);
        mav.addObject("search", search);
        mav.addObject("pageNum", pageNum);
        mav.addObject("begin", begin);
        mav.addObject("page", page);
        mav.setViewName("account/list");
        return mav;
    }
	
}