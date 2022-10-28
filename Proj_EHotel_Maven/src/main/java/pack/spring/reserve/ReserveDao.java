package pack.spring.reserve;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReserveDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	////////////////////////////////////////////컨트롤러 - sel_resvHome 메서드

	// reserve.jsp 예약 현황의 호텔 리스트 조회
	public List<Map<String, Object>> selHotelList() {
		
		return this.sqlSessionTemplate.selectList("reserve.selHotel_List");
	}

	// reserve.jsp 예약 현황에서 선택한 호텔의 방 리스트 조회
	public List<RoomInfoDTO> selRoomList(String hCode) {
		
		return this.sqlSessionTemplate.selectList("reserve.selRoom_List", hCode);
	}
	
	// 선택된 호텔 객실들의 예약 건이 있는지 조회(예약 가능 잔여 객실 추출 시 필요)
	public String selResvRoomCnt(String rCode, String resev_start) {
		
		Map<String, Object> ResvRCntMap = new HashMap<String, Object>();
		ResvRCntMap.put("resev_start", resev_start);
		ResvRCntMap.put("rCode", rCode);
		
		return this.sqlSessionTemplate.selectOne("reserve.selResvRoom_Cnt", ResvRCntMap);
	}

	// 선택된 호텔 객실들의 '총' 객실 수 조회
	public String selTotRoomCnt(String rCode) {
		
		return this.sqlSessionTemplate.selectOne("reserve.selTotRoom_Cnt", rCode);
	}
	
}