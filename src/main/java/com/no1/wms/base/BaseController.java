package com.no1.wms.base;

import com.no1.wms.account.AccountDto;
import com.no1.wms.account.AccountService;
import com.no1.wms.authority.AuthorityDto;
import com.no1.wms.authority.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class BaseController {

    @GetMapping("/")
    public ModelAndView base(HttpServletRequest request, ModelAndView mav){

        mav.addObject("userData", request.getSession().getAttribute("userData"));

        mav.setViewName("base/main");

        return mav;
    }
    
    


}
