package pack.spring.basic;

import java.util.List;
import java.util.Map;

public interface MemberService {

	// 회원 가입
	String create(Map<String, Object> map);
	
	// 회원 상세보기
	Map<String, Object> detail(Map<String, Object> map);
	
	// 회원 전체 목록 보기
	List<Map<String, Object>> list(Map<String, Object> map);
	
	// 메인 페이지
	String index( );
	
}
