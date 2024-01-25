package com.no1.wms.resetpassword;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ResetPasswordService {

    @Autowired
    ResetPasswordMapper mapper;

    public int count(int searchn, String search) {

        Map<String,Object> m = new HashMap<String, Object>();
        m.put("searchn",searchn);
        m.put("search", search);
        return mapper.count(m);
    }


    public List<Map<String, Object>> list(int searchn, String search, int start, int perPage){


        Map<String, Object> m = new HashMap<String, Object>();
        m.put("searchn",searchn);
        m.put("search", search);
        m.put("start", start);
        m.put("perPage", perPage);

        return mapper.list(m);

    }

    void insert(ResetPasswordDto dto){
        mapper.insert(dto);
    }

    int delete(ResetPasswordDto dto){
       return mapper.delete(dto);
    }

    int passwordUpdate(ResetPasswordDto dto){
        return mapper.passwordUpdate(dto);}
}
