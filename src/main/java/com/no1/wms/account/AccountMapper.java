package com.no1.wms.account;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface AccountMapper {

    int insert(AccountDto dto);
    int update(AccountDto dto);

    int selectById(AccountDto dto);

    List<AccountDto> selectAll(Map<String, Object> m);
}
