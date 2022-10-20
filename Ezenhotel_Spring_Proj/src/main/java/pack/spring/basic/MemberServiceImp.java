package pack.spring.basic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberDao memberDao;

	// 회원 가입
	@Override
	public String create(Map<String, Object> map) {

		int affectRowCnt = this.memberDao.Insert(map);
		if (affectRowCnt == 1) {
			return map.get("member_id").toString();
		}

		return null;
	}

	// 회원 정보 상세보기
	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return this.memberDao.selectDetail(map);
	}

	// 회원 전체 목록보기
	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
		return this.memberDao.selectList(map);
	}

	// 메인 페이지
	@Override
	public String index() {
		return null;
	}
}
