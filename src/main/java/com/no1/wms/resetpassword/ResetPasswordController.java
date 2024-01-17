package com.no1.wms.resetpassword;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/resetpassword")
public class ResetPasswordController {


    @Autowired
    ResetPasswordService resetPasswordService;

    @PostMapping("/insert")
    @ResponseBody
    public String insert(ResetPasswordDto dto, Gson gson){
        resetPasswordService.insert(dto);

        return gson.toJson("s");

    }

    @PostMapping("/delete")
    @ResponseBody
    public String delete(ResetPasswordDto dto, Gson gson){
        resetPasswordService.delete(dto);

        return gson.toJson("s");

    }

}
