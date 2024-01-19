package com.no1.wms.planin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.no1.wms.account.AccountDto;
import com.no1.wms.utils.ConstantValues;
import com.no1.wms.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.no1.wms.product.ProductDto;
import com.no1.wms.product.ProductService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
@RequestMapping("plan_in")
public class PlanInController {
    @Autowired
    PlanInService planinservice;
    @Autowired
    ProductService productservice;
    
    @GetMapping("/list")
    public ModelAndView list(ModelAndView mav,@RequestParam(defaultValue = "0") int searchn, @RequestParam(defaultValue = "") String search, @RequestParam(defaultValue = "1") int page){
        int perPage = 10;
        int startRow = (page - 1) * perPage;
        int count = planinservice.count(searchn, search, startRow, perPage);



        int pageNum = 4;//보여질 페이지 번호 수
        int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수




        //스톡서비스로 재고 리스트 출력 메서트 작성
        List<PlanInDto> list = planinservice.selectAll(searchn, search, startRow, perPage);
        HashMap<String, Integer> map = new HashMap<>();
        for( int i = 0 ; i < list.size(); ++i){
            PlanInDto obj = list.get(i);
            String name = obj.getProductDto().getName();
            if(map.containsKey(name)){
                map.put(name, map.get(name)+1);
            }else{
                map.put(name, 1);
            }
        }


        int begin = (page - 1) / pageNum * pageNum + 1;
        int end = begin + pageNum - 1;
        if (end > totalPages) {
            end = totalPages;
        }
        mav.addObject("list", list);
        mav.addObject("map", map);
        mav.addObject("end", end);
        mav.addObject("searchn", searchn);
        mav.addObject("search", search);
        mav.addObject("pageNum", pageNum);
        mav.addObject("begin", begin);
        mav.addObject("page", page);
        mav.setViewName("planin/list");
        return mav;
    }

    @PostMapping("/read")
    public ModelAndView read(ModelAndView mav, PlanInDto dto){

        System.out.println(dto);
        List<PlanInDto> list = planinservice.selectById(dto);
        System.out.println(list.get(0).toString());
        mav.addObject("list", list);
        mav.addObject("groupNum", dto.getGroupNumber());
        mav.setViewName("planin/read");
        
        return mav;
    }

    @PostMapping("/update")
    public ModelAndView update(PlanInDto dto, ModelAndView mav){
        List<PlanInDto> list = planinservice.selectById(dto);
        mav.addObject("list", list);
        mav.addObject("groupNumber", dto.getGroupNumber());
        mav.addObject("viewGroupNumber", list.get(0).getViewGroupNumber());
        mav.setViewName("/planin/update");
        
        return mav;
    }

    @PostMapping("/create")
    public ModelAndView create(ModelAndView mav){
        mav.addObject("groupNumber",UUID.randomUUID().toString() );
        mav.setViewName("/planin/create");

        return mav;
    }


    // 엑셀 다운로드 
    @GetMapping("/qr/{id}")
    @ResponseBody
    public String qr(@PathVariable("id")String qrHash, HttpServletResponse response)
    {
        List<PlanInDto> list = planinservice.selectByQRHash(qrHash);

        Utils.makePlanInExcel(list, response);



        return "s";
    }
    
    // 입고예정추가 
    @PostMapping("/planin_add")
    public ModelAndView add(ModelAndView mav, ProductDto dto)
    {
    	List<ProductDto> list = productservice.productList(0,  "", 0, 10000);
    	//list
    	//ProductDto (0) 
    	//ProductDto (1)
    	//ProductDto (2)
    	mav.addObject("list", list);
    	
    	mav.setViewName("planin_add");
    	return mav;
    }


    @PostMapping("/planin_edit")
    public ModelAndView edit(ModelAndView mav, ProductDto dto)
    {
        List<ProductDto> list = productservice.productList(0,  "", 0, 10000);
        //list
        //ProductDto (0)
        //ProductDto (1)
        //ProductDto (2)
        mav.addObject("list", list);

        mav.setViewName("planin_edit");
        return mav;
    }

    @PostMapping("/delete")
    public ModelAndView delete(ModelAndView mav, PlanInDto dto)
    {


        planinservice.delete(dto);
        List<PlanInDto> list = planinservice.selectAll(0,"",0,10000 );

        mav.addObject("list", list);
        mav.setViewName("planin/list");

        return mav;
    }

    @PostMapping("/planin_update_process")
    @ResponseBody
    public String updateProcess(@RequestBody List<Map<String, Object>> list, Gson gson, PlanInDto dto, HttpServletRequest request) throws ParseException {

        if(list.isEmpty())
            return gson.toJson("f");

        AccountDto aDto =(AccountDto)request.getSession().getAttribute("userData");

        dto.setGroupNumber((String) list.get(0).get("groupNumber"));

        Integer viewGroupNumber = null;
        try {
            viewGroupNumber = Integer.parseInt((String) list.get(0).get("viewGroupNumber"));
        }catch (NumberFormatException e){
            viewGroupNumber = null;
        }
        String uuid;
        planinservice.deleteById(dto);
        if(dto.getGroupNumber() == null){
            uuid = UUID.randomUUID().toString();
        }else{
            uuid = dto.getGroupNumber();
        }
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        for(int i = 0; i < list.size(); ++i){
            Map<String, Object> data = list.get(i);
            PlanInDto newDto = new PlanInDto();
            newDto.setGroupNumber(uuid);
            newDto.setGroupNumber((String) data.get("groupNumber"));
            newDto.setDate( format.parse((String) data.get("date")));
            newDto.setQuantity(Integer.parseInt((String) data.get("quantity")));
            newDto.setProductId((String)data.get("productId"));
            newDto.setManagerId(aDto.getId());
            newDto.setWarehouseId("5d201e83-b102-11ee-935d-0242ac110006");
            newDto.setViewGroupNumber(viewGroupNumber);

            newDto.setActivation(true);

            planinservice.insert(newDto);
        }



        return gson.toJson("s");

    }
}
