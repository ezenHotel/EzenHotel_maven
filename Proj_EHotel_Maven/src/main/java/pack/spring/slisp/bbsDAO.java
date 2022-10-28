package pack.spring.slisp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository // 데이터 접근용 클래스 명시 
public class bbsDAO {
	
	@Autowired // DB 접속 정보와 매퍼 파일 위치
	SqlSessionTemplate sqlsessionTemplate;
	
	// 회원가입 
	public int insert(Map<String, Object> map) {
		return this.sqlsessionTemplate.insert("bbs.insert", map);	
	}
	
	// 로그인 
		public Map<String, Object> selectLogin(Map<String, Object> map){
			return this.sqlsessionTemplate.selectOne("bbs.select_login", map);
		}
		
	
	// 글 작성 
	public int insert_write(Map<String, Object> map) {
		return this.sqlsessionTemplate.insert("bbs.insert_write", map);
	}
	
	// 글 목록 
	public List<Map<String, Object>> selectList(Map<String, Object> map){
		return this.sqlsessionTemplate.selectList("bbs.select_list", map);
				
	}
	
	// 글 상세보기 
	public Map<String, Object> selectDetail(Map<String, Object> map){
		return this.sqlsessionTemplate.selectOne("bbs.select_detail", map);
	}

	// 작성글 수정 
	public int update(Map<String, Object> map) {
		return this.sqlsessionTemplate.update("bbs.update", map);
	}

	// 작성글 삭제 
	public void delete(int no) throws Exception{
		sqlsessionTemplate.delete("bbs.delete", no);
	}
}
