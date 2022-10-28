package pack.spring.reserve;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReserveServiceImp implements ReserveService {
	
	@Autowired
	ReserveDao reserveDao; 

	// '예약하기' 페이지 호텔 리스트 조회
	@Override
	public List<Map<String, Object>> selHotelList(Map<String, Object> map) {
		
		
		return this.reserveDao.selHotelList(map);
	}

	// '예약하기' 페이지 호텔의 방 리스트 조회
	@Override
	public List<Map<String, Object>> selRoomList(Map<String, Object> map) {
		return this.reserveDao.selRoomList(map);
	}

	// 선택된 호텔 객실들의 예약 건이 있는지 조회(예약 가능 잔여 객실 추출 시 필요)
	@Override
	public String selResvRoomCnt(Map<String, Object> map) {
		
		return this.reserveDao.selResvRoomCnt(map);
	}

	// 선택된 호텔 객실들의 '총' 객실 수 조회
	@Override
	public String selTotRoomCnt(Map<String, Object> map) {

		return this.reserveDao.selTotRoomCnt(map);
	}

}
