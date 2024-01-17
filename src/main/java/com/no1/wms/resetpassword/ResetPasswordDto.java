package com.no1.wms.resetpassword;

import com.no1.wms.account.AccountDto;
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
@Alias("ResetPasswordDto")
public class ResetPasswordDto {
    String id;
    String accountId;
    String note;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Date date;

    AccountDto accountDto;
    String employeeNumber;
}
