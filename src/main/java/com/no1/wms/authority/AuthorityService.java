package com.no1.wms.authority;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class AuthorityService {

    @Autowired
    AuthorityMapper mapper;
    public AuthorityDto selectById(String id){
        return mapper.selectById(id);
    }
}
