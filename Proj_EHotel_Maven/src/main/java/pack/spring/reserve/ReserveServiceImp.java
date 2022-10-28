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
	public List<Map<String, Object>> selHotelList() {
		
		
		return this.reserveDao.selHotelList();
	}

	// '예약하기' 페이지 호텔의 방 리스트 조회
	@Override
	public List<RoomInfoDTO> selRoomList(String hCode) {
		return this.reserveDao.selRoomList(hCode);
	}

	// 선택된 호텔 객실들의 예약 건이 있는지 조회(예약 가능 잔여 객실 추출 시 필요)
	@Override
	public String selResvRoomCnt(String rCode, String resev_start) {
		
		return this.reserveDao.selResvRoomCnt(rCode, resev_start);
	}

	// 선택된 호텔 객실들의 '총' 객실 수 조회
	@Override
	public String selTotRoomCnt(String rCode) {

		return this.reserveDao.selTotRoomCnt(rCode);
	}


}
