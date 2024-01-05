package com.no1.wms.authority;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.util.UUID;

@Data
@AllArgsConstructor
@Alias("AuthorityDto")
public class AuthorityDto {
    private String id;
    private String name;
    private Integer account;
    private Integer authority;
    private Integer productCategory;
    private Integer product;
    private Integer prices;
    private Integer vendor;
    private Integer warehouse;
    private Integer stock;
    private Integer planIn;
    private Integer productIn;
    private Integer productOut;
    private Integer board;
    private Boolean activation;
    private Boolean isGroupAuthority;

}
