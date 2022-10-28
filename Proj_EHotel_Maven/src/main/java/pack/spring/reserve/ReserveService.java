package pack.spring.reserve;

import java.util.List;
import java.util.Map;

public interface ReserveService {
	

	// '예약하기' 페이지
	List<Map<String, Object>> selHotelList();
	
	// '예약하기' 페이지
	List<RoomInfoDTO> selRoomList(String hCode);

	// 선택된 호텔 객실들의 예약 건이 있는지 조회(예약 가능 잔여 객실 추출 시 필요)
	String selResvRoomCnt(String rCode, String resev_start);

	// 선택된 호텔 객실들의 '총' 객실 수 조회
	String selTotRoomCnt(String rCode);

	/*List<Map<String, Object>> sel_resvHome(Map<String, Object> HMap, Map<String, Object> RMap);*/
}
