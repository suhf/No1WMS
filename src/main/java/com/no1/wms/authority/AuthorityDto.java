package com.no1.wms.authority;

import com.no1.wms.account.AccountDto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("AuthorityDto")
public class AuthorityDto {

    private String id;
    private String name;

    @Builder.Default
    private Integer account = 0;
    @Builder.Default
    private Integer authority = 0;
    @Builder.Default
    private Integer productCategory = 0;
    @Builder.Default
    private Integer product = 0;
    @Builder.Default
    private Integer prices = 0;
    @Builder.Default
    private Integer vendor = 0;
    @Builder.Default
    private Integer warehouse = 0;
    @Builder.Default
    private Integer stock = 0;
    @Builder.Default
    private Integer planIn = 0;
    @Builder.Default
    private Integer productIn = 0;
    @Builder.Default
    private Integer productOut = 0;
    @Builder.Default
    private Integer board = 0;

    private AccountDto accountDto;


    private Boolean activation;
    private Boolean isGroupAuthority;
}
