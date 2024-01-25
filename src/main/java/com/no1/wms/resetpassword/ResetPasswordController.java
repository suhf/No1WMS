package com.no1.wms.resetpassword;

import com.google.gson.Gson;
import com.no1.wms.account.AccountDto;
import com.no1.wms.account.AccountService;
import com.no1.wms.utils.SHA256;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("/resetpassword")
public class ResetPasswordController {


    @Autowired
    ResetPasswordService resetPasswordService;

    @Autowired
    AccountService accountService;

    @GetMapping("/list")
    public String list(@RequestParam(name = "searchn", defaultValue = "0") int searchn,
                       @RequestParam(name = "search", defaultValue = "") String search,
                       @RequestParam(name = "p", defaultValue = "1") int page,
                       Model m) {
        int count = resetPasswordService.count(searchn, search);

        int perPage = 10; // 한 페이지에 보일 글의 갯수
        int startRow = (page - 1) * perPage;

        //스톡서비스로 재고 리스트 출력 메서트 작성
        List<Map<String, Object>> dto = resetPasswordService.list(searchn, search, startRow ,perPage);

        m.addAttribute("rlist", dto);

        m.addAttribute("start", startRow + 1);

        int pageNum = 5;//보여질 페이지 번호 수
        int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

        int begin = (page - 1) / pageNum * pageNum + 1;
        int end = begin + pageNum - 1;
        if (end > totalPages) {
            end = totalPages;
        }
        m.addAttribute("searchn", searchn);
        m.addAttribute("search", search);
        m.addAttribute("begin", begin);
        m.addAttribute("end", end);
        m.addAttribute("pageNum", pageNum);
        m.addAttribute("totalPages", totalPages);
        m.addAttribute("p" , page);


        return "resetpassword/list";
    }

    @PostMapping("/insert")
    @ResponseBody
    public String insert(ResetPasswordDto dto, Gson gson){
        resetPasswordService.insert(dto);

        return gson.toJson("s");

    }

    @DeleteMapping("/delete")
    @ResponseBody
    public int delete(ResetPasswordDto dto){
        int i = resetPasswordService.delete(dto);

        return i;
    }

    @PutMapping("/update")
    @ResponseBody
    public boolean update(ResetPasswordDto dto) throws NoSuchAlgorithmException {
        AccountDto accountDto = new AccountDto();
        accountDto.setId(dto.getAccountId());
        accountDto = accountService.selectById(accountDto);
        dto.setPassword(SHA256.encrypt(accountDto.getEmployeeNumber()));
        int i = resetPasswordService.passwordUpdate(dto);
        if (i != 0) {
            resetPasswordService.delete(dto);
            return true;
        }
        return false;
    }
}
