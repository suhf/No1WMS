package com.no1.wms.authority;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.util.UUID;

@Data
@AllArgsConstructor
@Alias("AuthorityDto")
public class AuthorityDto {
    private UUID id;
    private String name;
    private int account;
    private int authority;
    private int productCategory;
    private int product;
    private int prices;
    private int vendor;
    private int warehouse;
    private int stock;
    private int planIn;
    private int productIn;
    private int productOut;
    private int board;
    private boolean activation;
    private boolean isGroupAuthority;
}
