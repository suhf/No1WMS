package com.no1.wms.planin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.no1.wms.account.AccountDto;

@Repository
@Mapper
public interface PlanInMapper {
	
    List<AccountDto> selectAll(Map<String, Object> m);
	
    int count(Map<String, Object> m);
}
