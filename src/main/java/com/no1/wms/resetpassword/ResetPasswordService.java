package com.no1.wms.resetpassword;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResetPasswordService {

    @Autowired
    ResetPasswordMapper mapper;

    void insert(ResetPasswordDto dto){
        mapper.insert(dto);
    }

    void delete(ResetPasswordDto dto){
        mapper.delete(dto);
    }
}
