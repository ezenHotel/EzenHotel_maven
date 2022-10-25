package pack.spring.basic;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int insert(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("member.insert", map);
	}

	public Map<String, Object> selectDetail(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("member.select_detail", map);
	}

	public List<Map<String, Object>> selectList(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectList("member.select_list", map);
	}

	// 로그인 시작
	public Map<String, Object> login(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("member.login", map);
	}
	// 로그인 끝

	// 마이 페이지 시작
	public Map<String, Object> mypage(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("member.mypage_print", map);
	}

	public Map<String, Object> mypageEdit(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("member.mypage_edit", map);
	}

	public Map<String, Object> pwEdit(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("member.pw_edit", map);
	}
	// 마이 페이지 끝

	// 회원가입 시작
	public int joinProc(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("member.join", map);
	}
	
	public Map<String, Object> inqId(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("member.inqId", map);
	}
	// 회원가입 끝
}