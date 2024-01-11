package com.no1.wms.authority;

import com.google.gson.Gson;
import com.no1.wms.utils.ConstantValues;
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

    @GetMapping("/list")
    public ModelAndView list(ModelAndView mav, @RequestParam(defaultValue = "") String search, @RequestParam(defaultValue = "0") int start){
        List<AuthorityDto> list = authorityService.selectAll(search, start, ConstantValues.PER_PAGE);
        mav.addObject("list", list);
        mav.setViewName("/authority/list");
        return mav;
    }
    @GetMapping("/create")
    public String create(){
        return "/authority/create_group";
    }

    @PostMapping("/read")
    public ModelAndView read(ModelAndView mav, AuthorityDto dto){
        dto = authorityService.selectById(dto);
        mav.addObject("dto", dto);
        mav.setViewName("/authority/update_group");
        return mav;
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

    @PostMapping("/update_process")
    @ResponseBody
    public String updateProcess(AuthorityDto dto, Gson gson){
        int result = authorityService.update(dto);

        return gson.toJson(result);
    }

}
