package com.no1.wms.account;

import com.google.gson.Gson;
import com.no1.wms.authority.AuthorityDto;
import com.no1.wms.authority.AuthorityService;
import com.no1.wms.utils.ConstantValues;
import com.no1.wms.utils.SHA256;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    AccountService accountService;

    @Autowired
    AuthorityService authorityService;

    @GetMapping("/list")
    public ModelAndView list(ModelAndView mav,@RequestParam(defaultValue = "0") int searchn, @RequestParam(defaultValue = "") String search, @RequestParam(defaultValue = "1") int page){


        int perPage = 10;
        int startRow = (page - 1) * perPage;
        int count = accountService.count(searchn, search, startRow, perPage);



        int pageNum = 4;//보여질 페이지 번호 수
        int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수




        //스톡서비스로 재고 리스트 출력 메서트 작성
        List<AccountDto> list = accountService.selectAll(searchn, search, startRow, perPage);

        int begin = (page - 1) / pageNum * pageNum + 1;
        int end = begin + pageNum - 1;
        if (end > totalPages) {
            end = totalPages;
        }
        mav.addObject("list", list);
        mav.addObject("end", end);
        mav.addObject("searchn", searchn);
        mav.addObject("search", search);
        mav.addObject("pageNum", pageNum);
        mav.addObject("begin", begin);
        mav.addObject("page", page);
        mav.setViewName("account/list");
        return mav;
    }

    @PostMapping("/create")
    public ModelAndView create(ModelAndView mav){
        mav.setViewName("account/create");
        return mav;
    }

    @PostMapping("/create_process")
    @ResponseBody
    public String createProcess(AccountDto dto, Gson gson) throws NoSuchAlgorithmException {
        String uuid = UUID.randomUUID().toString();
        AuthorityDto authorityDto = new AuthorityDto();
        authorityDto.setId(dto.getGroupAuthorityId());
        authorityDto = authorityService.selectById(authorityDto);
        authorityDto.setId(uuid);
        authorityDto.setIsGroupAuthority(false);
        authorityDto.setName(dto.getEmployeeNumber());

        accountService.insertToAuthority(authorityDto);
        dto.setPersonalAuthorityId(uuid);

        dto.setPassword(SHA256.encrypt(dto.getEmployeeNumber()));
        accountService.insert(dto);

        return gson.toJson("s");
    }

    @PostMapping("/read")
    public ModelAndView read(AccountDto dto, ModelAndView mav){
        dto = accountService.selectById(dto);
        mav.addObject("dto", dto);
        mav.setViewName("/account/read");
        return mav;
    }

    @PostMapping("/update")
    public ModelAndView update(AccountDto dto, ModelAndView mav){
        dto = accountService.selectById(dto);
        mav.addObject("dto", dto);
        mav.setViewName("/account/update");
        return mav;
    }


    @PostMapping("/update_process")
    @ResponseBody
    public String updateProcess(@RequestBody Map<String, Object> data, Gson gson){
        AuthorityDto personalAuthorityDto= gson.fromJson(data.get("personalAuthorityDto").toString(), AuthorityDto.class);


        AccountDto accountDto = gson.fromJson(data.get("account").toString(), AccountDto.class);

        accountService.update(accountDto);
        authorityService.update(personalAuthorityDto);

        return gson.toJson("s");
    }

    @PostMapping("/reset_password")
    @ResponseBody
    public String resetPassword(AccountDto dto, Gson gson) throws NoSuchAlgorithmException {
        dto = accountService.selectById(dto);
        dto.setPassword(SHA256.encrypt(dto.getEmployeeNumber()));
        accountService.resetPassword(dto);

        return gson.toJson("s");
    }

    @PostMapping("/delete_process")
    @ResponseBody
    public String deleteProcess(AccountDto dto, Gson gson){
        accountService.delete(dto);

        return gson.toJson("s");
    }


    @PostMapping("/show_modal")
    public ModelAndView showModal(ModelAndView mav, @RequestParam(defaultValue = "") String search,
                                  @RequestParam(defaultValue = "0") int start, @RequestParam String name){
        //db에서 데이터 가져오는거 필요
        List list = null;
        if(name.equals("auth")){
            list = authorityService.selectAll(search, start, ConstantValues.PER_PAGE);
        }else if(name.equals("dept")){
            list = accountService.selectDeptAll(search, start, ConstantValues.PER_PAGE);
        }else if(name.equals("pos")){
            list = accountService.selectPosAll(10, search, start);
        }
        //
        mav.addObject("list", list);
        mav.setViewName(name);
        return mav;
    }

    @PostMapping("/show_personal_auth_modal")
    public ModelAndView showPersonalAuthModal(ModelAndView mav, AuthorityDto dto){
        //db에서 데이터 가져오는거 필요
        dto = authorityService.selectById(dto);

        //
        mav.addObject("dto", dto);
        mav.setViewName("personal_auth");
        return mav;
    }

}
