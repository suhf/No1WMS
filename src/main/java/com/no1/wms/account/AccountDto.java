package com.no1.wms.account;

import com.no1.wms.department.DepartmentDto;
import com.no1.wms.position.PositionDto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

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
    private Date birth;
    private String telephone;
    private String address;
    private DepartmentDto department;
    private PositionDto position;
    @Builder.Default
    private Boolean activation = true;

}
