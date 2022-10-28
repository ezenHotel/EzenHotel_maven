package pack.spring.slisp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class bbsServiceimp implements bbsService{

	@Autowired
	bbsDAO bbsDAO;
	
	// 로그인 
	@Override
	public Map<String, Object> login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.bbsDAO.selectLogin(map);
	} 
	
	// 회원가입 
	@Override
	public String join(Map<String, Object> map) {
		
		int affectRowCnt = this.bbsDAO.insert(map);
		
		if (affectRowCnt == 1) {
			return map.get("member_id").toString();
		}
		
		return null;
	}
	
	// 글 작성 
	@Override
	public String write(Map<String, Object> map) {
		
		int affectRowCnt = this.bbsDAO.insert_write(map);
		
		if (affectRowCnt == 1) {
			return map.get("member_id").toString();
		}
		
		return null;
	}
	
	
	// 글 목록 
	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {	
		return this.bbsDAO.selectList(map);
	} 
	
	// 작성글 상세보기 
	@Override
	public Map<String, Object> detail(Map<String, Object> map) {	
		return this.bbsDAO.selectDetail(map);
	}
	
	// 작성글 수정 
	@Override
	public String update(Map<String, Object> map) {
		
		int affectRowCnt = this.bbsDAO.update(map);
		
		if (affectRowCnt == 1) {
			return map.get("member_id").toString();
		}
		
		return null;
	}
	
	// 작성글 삭제 
	@Override
	public void delete(int no) throws Exception{	
		bbsDAO.delete(no);
	}

}
