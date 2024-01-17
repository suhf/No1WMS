package com.no1.wms.resetpassword;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface ResetPasswordMapper {

    List<Map<String, Object>> list(Map<String, Object> m);

    int count(Map<String, Object> m);

    void insert(ResetPasswordDto dto);

    void delete(ResetPasswordDto dto);




}
