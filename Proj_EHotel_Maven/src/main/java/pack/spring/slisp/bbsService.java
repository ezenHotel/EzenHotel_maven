package pack.spring.slisp;

import java.util.List;
import java.util.Map;

public interface bbsService {
	
	// 회원가입 
	String join(Map<String, Object> map);

	// 로그인 
	Map<String, Object> login(Map<String, Object> map);
	
	// 글 작성 
	String write(Map<String, Object> map);
	
	// 글 목록 
	List<Map<String, Object>> list(Map<String, Object> map);
	
	// 작성글 상세보기 
	Map<String, Object> detail(Map<String, Object> map);

	// 작성글 수정 
	String update(Map<String, Object> map);
	
	// 작성글 삭제 
	public void delete(int no) throws Exception;

}
