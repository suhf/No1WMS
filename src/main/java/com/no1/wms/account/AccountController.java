package com.no1.wms.account;

import com.no1.wms.utils.ConstantValues;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    AccountService accountService;

    @GetMapping("/list")
    public ModelAndView list(ModelAndView mav, @RequestParam(defaultValue = "") String search, @RequestParam(defaultValue = "0") int start){

        List<AccountDto> list = accountService.selectAll(search, start, ConstantValues.PER_PAGE);

        mav.addObject("list", list);
        mav.setViewName("account/list");
        return mav;
    }

    @PostMapping("/create")
    public ModelAndView create(ModelAndView mav){
        mav.setViewName("account/create");
        return mav;
    }

    @PostMapping("/show_modal")
    public ModelAndView showModal(ModelAndView mav, @RequestParam String name){
        //db에서 데이터 가져오는거 필요

        //
        mav.setViewName(name);
        return mav;
    }

}
