package com.no1.wms.authority;

import com.no1.wms.account.AccountDto;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@Repository
@Mapper
public interface AuthorityMapper {
    AuthorityDto selectById(AuthorityDto id);
    int selectByName(String name);

    int insert(AuthorityDto dto);

    int update(AuthorityDto dto);

    List<AuthorityDto> selectAll(Map<String, Object> m);

    AuthorityDto selectPersonalAuthorityById(AuthorityDto dto);
}
