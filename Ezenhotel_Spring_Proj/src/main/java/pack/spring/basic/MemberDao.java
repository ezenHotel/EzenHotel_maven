package pack.spring.basic;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int Insert(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("member.insert", map);
	}

	public Map<String, Object> selectDetail(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("member.select_detail", map);
	}

	// 전체 회원목록 보기
	// 한 줄만 가져올 땐 Map만, 그 이상을 가져와야 할 경우엔 List를 사용
	public List<Map<String, Object>> selectList(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectList("member.select_list", map);
	}

}
