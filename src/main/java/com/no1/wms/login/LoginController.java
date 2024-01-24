package com.no1.wms.login;

import com.google.gson.Gson;
import com.no1.wms.account.AccountDto;
import com.no1.wms.account.AccountService;
import com.no1.wms.authority.AuthorityDto;
import com.no1.wms.authority.AuthorityService;
import com.no1.wms.base.AuthData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class LoginController {

    @Autowired
    AccountService accountService;

    @Autowired
    AuthorityService authorityService;

    @GetMapping("/login")
    public String loginPage(){
        return "login";
    }


    @PostMapping("/pass_reset_call")
    @ResponseBody
    public String passResetCall(AccountDto dto, Gson gson)
    {
        return gson.toJson("s");

    }

    @GetMapping("/passreset")
    public String passReset()
    {
        return "pass_reset_call";

    }

    @GetMapping("/logout")
    public String logout(AccountDto data, AuthorityDto authDto, Gson gson,  HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();

        return "redirect:/";

    }




    @PostMapping("/login/check_password")
    @ResponseBody
    public String login(AccountDto data, AuthorityDto authDto, Gson gson,  HttpServletRequest request){
        HttpSession session = request.getSession();

        AccountDto dto = accountService.selectByLogin(data);
        if(dto.getPassword().equals(data.getPassword())){
            authDto.setId(dto.getPersonalAuthorityId());
            authDto = authorityService.selectById(authDto);
            session.setAttribute("userData", dto);
            HashMap<String, AuthData> auth = new HashMap<>();
            auth.put("account", getAuthArrayFromInt(authDto.getAccount()));
            auth.put("authority", getAuthArrayFromInt(authDto.getAuthority()));
            auth.put("category",getAuthArrayFromInt(authDto.getProductCategory()));
            auth.put("product",getAuthArrayFromInt(authDto.getProduct()));
            auth.put("price",getAuthArrayFromInt(authDto.getPrices())); //prices
            auth.put("vendor",getAuthArrayFromInt(authDto.getVendor()));
            auth.put("warehouse",getAuthArrayFromInt(authDto.getWarehouse()));
            auth.put("stock",getAuthArrayFromInt(authDto.getStock()));
            auth.put("planin",getAuthArrayFromInt(authDto.getPlanIn()));
            auth.put("in",getAuthArrayFromInt(authDto.getProductIn())); //prodcut_in
            auth.put("out",getAuthArrayFromInt(authDto.getProductOut())); //product_out
            auth.put("board",getAuthArrayFromInt(authDto.getBoard()));
            session.setAttribute("authSession", auth);
            return gson.toJson("s");
        }

        return gson.toJson("f");
    }

    private AuthData getAuthArrayFromInt(int value){
        AuthData data = new AuthData();
        if( (value & 1) > 0){
            data.setDelete(true);
        }
        if( (value & 2) > 0){
            data.setUpdate(true);
        }
        if( (value & 4) > 0){
            data.setCreate(true);
        }
        if( (value & 8) > 0){
            data.setRead(true);
        }

        return data;
    }

}
