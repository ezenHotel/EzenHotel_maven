package pack.spring.admin;

import java.util.List;
import java.util.Map;

public interface AdminService {

	// 어드민 로그인 시작
	Map<String, Object> aLogin(Map<String, Object> map);
	// 어드민 로그인 끝
	
	// 멤버 목록 조회 시작
	List<Map<String, Object>> memList(Map<String, Object> map);
	// 멤버 목록 조회 끝
	
	// 회원 삭제 시작
	int memDel(Map<String, Object> map);
	// 회원 삭제 끝
	
	// 회원 상세 조회 시작
	Map<String, Object> memDetail(Map<String, Object> map);
	// 회원 상세 조회 끝
	
	// 회원 정보 수정 시작
	Map<String, Object> userDetailEdit(Map<String, Object> map);
	// 회원 정보 수정 끝
}
