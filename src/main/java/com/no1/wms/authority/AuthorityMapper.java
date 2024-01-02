package com.no1.wms.authority;

import org.apache.ibatis.annotations.Mapper;

import java.util.UUID;


@Mapper
public interface AuthorityMapper {
    AuthorityDto selectById(String id);
}
