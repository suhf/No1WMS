package com.no1.wms.base;

import lombok.Data;

@Data
public class AuthData {

    boolean read = false;
    boolean create = false;
    boolean update = false;
    boolean delete = false;
}
