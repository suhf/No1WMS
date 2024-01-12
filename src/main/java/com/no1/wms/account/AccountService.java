package com.no1.wms.account;

import com.no1.wms.authority.AuthorityDto;
import com.no1.wms.department.DepartmentDto;
import com.no1.wms.position.PositionDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AccountService {
    @Autowired
    AccountMapper mapper;

    public int insert(AccountDto dto){
        return mapper.insert(dto);
    }
    int insertToAuthority(AuthorityDto dto){
        return mapper.insertToAuthority(dto);
    }
    public int update(AccountDto dto){
        return mapper.update(dto);
    }

    public AccountDto selectById(AccountDto dto){
        return mapper.selectById(dto);
    }

    public List<AccountDto> selectAll(String search, int start, int perPage){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("search", search);
        map.put("start", start);
        map.put("perPage", perPage);



        return mapper.selectAll(map);
    }

    List<DepartmentDto> selectDeptAll(String search, int start, int perPage){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("search", search);
        map.put("start", start);
        map.put("perPage", perPage);

        return mapper.selectDeptAll(map);
    }

    List<PositionDto> selectPosAll(String search, int start, int perPage){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("search", search);
        map.put("start", start);
        map.put("perPage", perPage);

        return mapper.selectPosAll(map);
    }

}
