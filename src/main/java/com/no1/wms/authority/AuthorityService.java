package com.no1.wms.authority;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AuthorityService {

    @Autowired
    AuthorityMapper mapper;
    public AuthorityDto selectById(AuthorityDto dto){
        return mapper.selectById(dto);
    }

    public List<AuthorityDto> selectAll(String search, int start, int perPage){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("search", search);
        map.put("start", start);
        map.put("perPage", perPage);

        return mapper.selectAll(map);
    }

    public int selectByName(String name){
        return mapper.selectByName(name);
    }

    public int insert(AuthorityDto dto){
        return mapper.insert(dto);
    }

    public int update(AuthorityDto dto) { return mapper.update(dto); }
}
