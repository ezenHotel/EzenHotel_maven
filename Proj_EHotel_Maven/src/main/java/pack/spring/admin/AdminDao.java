package pack.spring.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 어드민 로그인 시작
	public Map<String, Object> aLogin(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("admin.admin_login", map);
	}
	// 어드민 로그인 끝

	// 어드민 페이지 멤버 목록 조회 시작
	public List<Map<String, Object>> memList(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectList("admin.member_list", map);
	}
	// 어드민 페이지 멤버 목록 조회 끝
	
	// 멤버 삭제 시작
	public int memDel(Map<String, Object> map) {
		return this.sqlSessionTemplate.delete("admin.member_del", map);
	}
	// 멤버 삭제 끝
}