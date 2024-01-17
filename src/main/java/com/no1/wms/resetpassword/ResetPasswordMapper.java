package com.no1.wms.resetpassword;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ResetPasswordMapper {

    void insert(ResetPasswordDto dto);

    void delete(ResetPasswordDto dto);


}
