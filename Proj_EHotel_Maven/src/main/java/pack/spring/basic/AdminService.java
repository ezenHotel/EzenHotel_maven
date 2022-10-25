package pack.spring.basic;

import java.util.List;
import java.util.Map;

public interface AdminService {

	// 어드민 로그인 시작
	Map<String, Object> aLogin(Map<String, Object> map);
	// 어드민 로그인 끝
	
	List<Map<String, Object>> memList(Map<String, Object> map);

}
