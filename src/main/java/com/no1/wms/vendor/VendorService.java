package com.no1.wms.vendor;

import com.no1.wms.warehouse.WarehouseDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class VendorService {
    @Autowired
    VendorMapper mapper;

    public int count(int searchn, String search) {

        Map<String, Object> m = new HashMap<String, Object>();
        m.put("searchn", searchn);
        m.put("search", search);
        return mapper.count(m);
    }


    public List<VendorDto> list(int searchn, String search, int start, int perPage) {

        System.out.println(searchn + search);

        Map<String, Object> m = new HashMap<String, Object>();
        m.put("searchn", searchn);
        m.put("search", search);
        m.put("start", start);
        m.put("perPage", perPage);

        return mapper.list(m);
    }

    public VendorDto vendorOne(String id) {
        return mapper.vendorOne(id);
    }

    public int updateVendor(VendorDto dto) {
        return mapper.updateVendor(dto);
    }


    public int createVendor(VendorDto dto) {
        return mapper.createVendor(dto);
    }


    public int deleteVendor(String id) {
        return mapper.deleteVendor(id);
    }
}
