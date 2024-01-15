package com.no1.wms.base;

import com.no1.wms.account.AccountDto;
import com.no1.wms.account.AccountService;
import com.no1.wms.authority.AuthorityDto;
import com.no1.wms.authority.AuthorityService;
import lombok.Getter;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Objects;

@Aspect
@Component
public class AuthAspect {



    @Around("execution(* com.no1.wms.*.*Controller.*(..))")
    public Object before(ProceedingJoinPoint joinPoint) throws Throwable {
        ServletRequestAttributes sa = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
        HttpServletRequest request = sa.getRequest();
        HttpServletResponse response = sa.getResponse();
        HttpSession session = request.getSession();
        HashMap<String, AuthData> auth = (HashMap<String, AuthData>) session.getAttribute("authSession");
        if(auth == null){
            auth = test(request);
        }
        String targetController = joinPoint.getTarget().toString().toLowerCase();
        String[] list = targetController.split("\\.");

        String packageName = list[3];
        if(packageName.equals("login")) {
            return joinPoint.proceed();
        }



        if(session.getAttribute("userData") == null){
            response.sendRedirect("/login");
            return joinPoint.proceed();
        }



        AuthData authData = auth.get(packageName);
        if(packageName.equals("base")){
            return joinPoint.proceed();
        }else if( authData != null ){
            String methodName = joinPoint.getSignature().getName().toLowerCase();
            if((methodName.startsWith("list") || methodName.startsWith("read")) && !authData.read){
                throw new Exception();
            }else if(methodName.startsWith("create") && !authData.create){
                throw new Exception();
            }else if(methodName.startsWith("update") && !authData.update){
                throw new Exception();
            }else if(methodName.startsWith("delete") && !authData.delete){
                throw new Exception();
            }

        }else{
            throw new Exception();
        }

        return joinPoint.proceed();
    }
    @Autowired
    AccountService accountService;
    @Autowired
    AuthorityService authorityService;

    private HashMap<String, AuthData> test(HttpServletRequest request){
        AccountDto data = new AccountDto();
        AuthorityDto authDto = new AuthorityDto();
        data.setPassword("11232");
        data.setEmployeeNumber("11232");
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
            auth.put("in",getAuthArrayFromInt(authDto.getProductIn())); //prodcut_in
            auth.put("out",getAuthArrayFromInt(authDto.getProductOut())); //product_out
            auth.put("board",getAuthArrayFromInt(authDto.getBoard()));
            session.setAttribute("authSession", auth);
            return auth;
        }
        return null;
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
