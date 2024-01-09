package com.no1.wms.authority;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/authority")
public class AuthorityController {
    @Autowired
    AuthorityService authorityService;
    private static final int PER_PAGE = 10;

    @GetMapping("/list")
    public ModelAndView list(ModelAndView mav, @RequestParam(defaultValue = "") String search, @RequestParam(defaultValue = "0") int start){
        List<AuthorityDto> list = authorityService.selectAll(search, start, PER_PAGE);
        for(int i=0; i < list.size(); ++i){
            System.out.println(list.get(i));
        }
        mav.addObject("list", list);
        mav.setViewName("/authority/list");
        return mav;
    }
    @GetMapping("/create")
    public String create(){
        return "/authority/create_group";

    }

    @PostMapping("/checkNameDuplicate")
    @ResponseBody
    public String checkNameDuplicate(@RequestParam String name, Gson gson){
        int count = authorityService.selectByName(name);
        return gson.toJson(count);
    }
    @PostMapping("/create_process")
    @ResponseBody
    public String createProcess(AuthorityDto dto, Gson gson){
        int result = authorityService.insert(dto);
        return gson.toJson(result);
    }

}
