package pack.spring.basic;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberDao memberDao;

	@Override
	public String create(Map<String, Object> map) {
		int affectRowCnt = this.memberDao.insert(map);
		if (affectRowCnt == 1) {
			return map.get("member_id").toString();
		}
		return null;
	}

	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return this.memberDao.selectDetail(map);
	}

	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
		return this.memberDao.selectList(map);
	}

	@Override
	public String index() {
		return null;
	}
	
	// 로그인 시작
	@Override
	public Map<String, Object> login(Map<String, Object> map) {
		return  this.memberDao.login(map);
	}
	// 로그인 끝
	
	// 마이페이지 시작
	@Override
	public Map<String, Object> mypage(Map<String, Object> map) {
		return  this.memberDao.mypage(map);
	}
	
	@Override
	public Map<String, Object> mypageEdit(Map<String, Object> map) {
		return  this.memberDao.mypageEdit(map);
	}
	
	@Override
	public Map<String, Object> pwEdit(Map<String, Object> map) {
		return  this.memberDao.pwEdit(map);
	}
	// 마이페이지 끝

}
