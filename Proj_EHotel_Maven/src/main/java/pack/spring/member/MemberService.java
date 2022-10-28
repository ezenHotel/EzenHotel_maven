package pack.spring.member;

import java.util.List;
import java.util.Map;

public interface MemberService {

	String index( );
	
	// 로그인 시작
	Map<String, Object> login(Map<String, Object> map);
	// 로그인 끝
	
	// 마이페이지 시작
	Map<String, Object> mypage(Map<String, Object> map);
	Map<String, Object> mypageEdit(Map<String, Object> map);
	Map<String, Object> pwEdit(Map<String, Object> map);
	int withdrawal(Map<String, Object> map);
	// 마이페이지 끝

	// 회원가입 시작
	int joinProc(Map<String, Object> map);
	int inqId(Map<String, Object> map);
	// 회원가입 끝
	
}
