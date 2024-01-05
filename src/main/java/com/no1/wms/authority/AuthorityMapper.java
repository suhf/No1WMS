package com.no1.wms.authority;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
@Mapper
public interface AuthorityMapper {
    AuthorityDto selectById(AuthorityDto id);
}
