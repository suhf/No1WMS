package com.no1.wms.authority;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthorityController {
    @Autowired
    AuthorityService authorityService;


    @GetMapping("/test/tt")
    public ModelAndView test(ModelAndView mav){
        //AuthorityDto dto = authorityService.selectById("94690a18-a933-11ee-b9dd-0242ac110006");

        //System.out.println(dto.getName());

        mav.setViewName("test/testlayout");
        return mav;
    }
    @GetMapping("/tt")
    public ModelAndView test2(ModelAndView mav){
        //AuthorityDto dto = authorityService.selectById("94690a18-a933-11ee-b9dd-0242ac110006");

        //System.out.println(dto.getName());

        mav.setViewName("test/testlayout");
        return mav;
    }

}
