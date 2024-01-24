package com.no1.wms.in;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InService {
	
	@Autowired
	InMapper mapper;
	
	public List<InDto> inList(int searchn, String search, int start, int perPage){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("perPage", perPage);
		
		return mapper.inList(m);
	}
	
	public List<InDto> inListMain(String today){//메인페이지에서 활용
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("today",today);
		return mapper.inListMain(m);
	}
	
	public int count(int searchn, String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return mapper.count(m);
	};//카운터
	
	public int createProcess(InDto dto) {
		return mapper.createProcess(dto);
	}
	
	public int createProcess2(InDto dto) {
		return mapper.createProcess2(dto);
	}
	
	public InDto selectById (String id) {
		return mapper.selectById(id);
	}
	
	public int updateById(InDto dto) {
		return mapper.updateById(dto);
	}
	
	public int checkIfExistsStock(InDto dto) {
		return mapper.checkIfExistsStock(dto);
	}
	
	public int updateStockProcess(InDto dto) {
		return mapper.updateStockProcess(dto);
	}
	
	public int createStockProcess(InDto dto) {
		return mapper.createStockProcess(dto);
	}
	
	//createProcess
	public boolean chechAndUpdateOrCreateProcessForCreate(InDto dto) {
		
		
		
		int j = mapper.checkIfExistsStock(dto);
		if(j == 1) {
			int k = mapper.updateStockProcess(dto);
			if(k == 1) {
				int i = mapper.createProcess(dto);
				if(i == k) {
					//System.out.println("같아서 합침");
					return true;
				}else {
					return false;
				}
			}else {
				return false;
			}
			
		}else if(j == 0) {
			int k = mapper.createStockProcess(dto);
			if(k == 1) {
				int i = mapper.createProcess(dto);
				if(i == k) {
					//System.out.println("달라서 새로만듬");
					return true;
				}else {
					return false;
				}
			}else {
				return false;
			}
		}else {
			return false;
		}
	}
	
	//updateProcess
	public boolean chechAndUpdateProcess(InDto dto) {
		int j = mapper.checkIfExistsStock(dto);//재고에 동일한 창고, 제품이 있는지
		if(j == 1) {//재고에 동일한 창고, 제품이 있다면
			int currentStockQuantity = mapper.currntStockQuantity(dto);//현재 재고의 개수
			int changeInQuantity = Integer.parseInt(dto.getQuantity());//변경된 입고의 개수
			int currentInQuantity = mapper.currntInQuantity(dto);//기존의 입고의 개수
			int modifiedStockQuantity = currentStockQuantity + changeInQuantity - currentInQuantity;//수정된 재고의 개수
			if(currentStockQuantity == modifiedStockQuantity) {//현재 재고의 개수와 변한 재고의 개수가 같다면
				int i = mapper.updateById(dto);//재고는 놔두고 입고만 업데이트 한다
				if(i == 1) {
					return true;
				}else {
					return false;
				}
			}else{//현재 재고의 개수보다 변한 재고의 개수가 더 크거나 작다면
				int i = mapper.updateById(dto); // 입고를 먼저 업데이트하고
				dto.setQuantity(modifiedStockQuantity+"");// 변경 개수를 적용하여
				int k = mapper.updateStockProcessForUpdate(dto); // 재고테이블에 반영한다. 
				if (i == k) {
					return true;
				}else {
					return false;
				}
			}//else
		}else {// 재고에 동일 재품 동일 창고가 없다면 오류발생.
			return false;
		}
			
	}
	
	public boolean deactivateById(String id) {
		InDto dto = mapper.selectById(id);
		int j = mapper.checkIfExistsStock(dto);//재고에 동일한 창고, 제품이 있는지
		if(j == 1) {
			int currentStockQuantity = mapper.currntStockQuantity(dto);//스톡의 재고수
			int deactivateInQuantity = Integer.parseInt(dto.getQuantity());//in의 재고수
			if(currentStockQuantity >= deactivateInQuantity) {//스톡의 재고수가 in의 재고수보다 많을 때
				mapper.deactivateById(id);// 입고 비활성화
				int modifiedStockQuantity = currentStockQuantity - deactivateInQuantity;
				dto.setQuantity(modifiedStockQuantity+"");// 변경 개수를 적용하여
				int k = mapper.updateStockProcessForUpdate(dto); // 재고테이블에 반영한다. 
				return true;
			}else {
				return false;
			}
			
		}else {
			return false;
		}

	}
	//사용하지 않음.
	public void updateWarehouse(InDto dto) {
		String warehouseId = dto.getId();
		String updateValue = mapper.selectWarehouseQuantity(warehouseId);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("warehouseId", warehouseId);
		m.put("updateValue", updateValue);
		mapper.updateWarehouseQuantity(m);
		
	}
	
	
	
	
	
}
