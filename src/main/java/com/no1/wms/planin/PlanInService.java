package com.no1.wms.planin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlanInService {
	@Autowired
	PlanInMapper mapper;
	
    public List<PlanInDto> selectAll(int searchn, String search, int start, int perPage){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("search", search);
        map.put("start", start);
        map.put("perPage", perPage);
        map.put("searchn", searchn);
        return mapper.selectAll(map);
    }
	
    int count(int searchn, String search, int start, int perPage){
//    	System.out.printf("searchn : %d, search : %s, start : %d, perpage : %d", searchn, search, start, perPage);
        HashMap<String, Object> m = new HashMap<>();
        m.put("searchn", searchn);
        m.put("search", search);
        m.put("start", start);
        m.put("perPage", perPage);
        return mapper.count(m);
    }

    List<PlanInDto> selectById(PlanInDto dto){
        return mapper.selectById(dto);
    }

    int deleteById(PlanInDto dto){
        return mapper.deleteById(dto);
    }
    void insert(PlanInDto dto){
        mapper.insert(dto);
    }

    int delete(PlanInDto dto){
        return mapper.delete(dto);
    }

    List<PlanInDto> selectByQRHash(String qrHash) {

        return mapper.selectByQRHash(qrHash);
    }
}
