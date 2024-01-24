package com.no1.wms.account;

import com.no1.wms.authority.AuthorityDto;
import com.no1.wms.department.DepartmentDto;
import com.no1.wms.position.PositionDto;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface AccountMapper {

    int insert(AccountDto dto);

    int insertToAuthority(AuthorityDto dto);
    int update(AccountDto dto);
    int updateIncludePassword(AccountDto dto);

    AccountDto selectById(AccountDto dto);

    List<AccountDto> selectAll(Map<String, Object> m);

    List<DepartmentDto> selectDeptAll(Map<String, Object> m);

    List<PositionDto> selectPosAll(Map<String, Object> m);

    int resetPassword(AccountDto dto);

    int delete(AccountDto dto);

    AccountDto selectByLogin(AccountDto dto);

    int count(Map<String, Object> m);
}
