package com.no1.wms.account;

import com.no1.wms.utils.ConstantValues;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AccountController {

    @Autowired
    AccountService accountService;

    public ModelAndView list(ModelAndView mav, @RequestParam(defaultValue = "") String search, @RequestParam(defaultValue = "0") int start){

        List<AccountDto> list = accountService.selectAll(search, start, ConstantValues.PER_PAGE);

        mav.addObject("list", list);
        mav.setViewName("account/list");
        return mav;
    }

}
