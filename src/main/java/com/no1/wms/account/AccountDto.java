package com.no1.wms.account;

import com.no1.wms.authority.AuthorityDto;
import com.no1.wms.department.DepartmentDto;
import com.no1.wms.position.PositionDto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("AccountDto")
public class AccountDto {
    private String id;
    private String employeeNumber;
    private String password;
    private String email;
    private String groupAuthorityId;
    private String personalAuthorityId;
    private String name;
    private String gender;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birth;
    private String telephone;
    private String address;
    private String departmentId;
    private String positionId;

    private DepartmentDto departmentDto;
    private PositionDto positionDto;
    private AuthorityDto groupAuthorityDto;
    private AuthorityDto personalAuthorityDto;

    @Builder.Default
    private Boolean activation = true;

}
