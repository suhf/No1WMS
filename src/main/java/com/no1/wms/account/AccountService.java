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
    public int updateIncludePassword(AccountDto dto) {
    	return mapper.updateIncludePassword(dto);
    }

    public AccountDto selectById(AccountDto dto){
        return mapper.selectById(dto);
    }

    public List<AccountDto> selectAll(int searchn, String search, int start, int perPage){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("search", search);
        map.put("start", start);
        map.put("perPage", perPage);
        map.put("searchn", searchn);



        return mapper.selectAll(map);
    }

    List<DepartmentDto> selectDeptAll(String search, int start, int perPage){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("search", search);
        map.put("start", start);
        map.put("perPage", perPage);

        return mapper.selectDeptAll(map);
    }

    List<PositionDto> selectPosAll(int perPage, String search, int start){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("search", search);
        map.put("start", start);
        map.put("perPage", perPage);

        return mapper.selectPosAll(map);
    }
    int resetPassword(AccountDto dto){
        return mapper.resetPassword(dto);
    }

    int delete(AccountDto dto){
        return mapper.delete(dto);
    }

    public AccountDto selectByLogin(AccountDto dto){
           return mapper.selectByLogin(dto);
    }

    int count(int searchn, String search, int start, int perPage){
        HashMap<String, Object> m = new HashMap<>();
        m.put("searchn", searchn);
        m.put("search", search);
        m.put("start", start);
        m.put("perPage", perPage);
        return mapper.count(m);
    }

}
