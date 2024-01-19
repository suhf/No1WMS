package com.no1.wms.planin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PlanInMapper {
	
    List<PlanInDto> selectAll(Map<String, Object> m);
	
    int count(Map<String, Object> m);

    List<PlanInDto> selectById(PlanInDto dto);

    List<PlanInDto> selectByUrl(String id);

    int deleteById(PlanInDto dto);

    void insert(PlanInDto dto);

    int delete(PlanInDto dto);
}
