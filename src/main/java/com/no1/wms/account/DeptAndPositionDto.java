package com.no1.wms.account;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("DeptPositionDto")
public class DeptAndPositionDto {
    private String id;
    private String name;
}
