package pack.spring.reserve;

import java.util.List;
import java.util.Map;

public interface ReserveService {
	

	// '예약하기' 페이지
	List<Map<String, Object>> selHotelList(Map<String, Object> map);
	
	// '예약하기' 페이지
	List<Map<String, Object>> selRoomList(Map<String, Object> map);

	// 선택된 호텔 객실들의 예약 건이 있는지 조회(예약 가능 잔여 객실 추출 시 필요)
	String selResvRoomCnt(Map<String, Object> map);

	// 선택된 호텔 객실들의 '총' 객실 수 조회
	String selTotRoomCnt(Map<String, Object> map);

	/*List<Map<String, Object>> sel_resvHome(Map<String, Object> HMap, Map<String, Object> RMap);*/
}
