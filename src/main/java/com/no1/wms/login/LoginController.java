package com.no1.wms.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
    @GetMapping("/login")
    public ModelAndView login(ModelAndView mav){
        mav.setViewName("login");
        return mav;
    }

}
