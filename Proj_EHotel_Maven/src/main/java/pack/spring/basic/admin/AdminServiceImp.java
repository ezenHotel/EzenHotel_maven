package pack.spring.basic.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImp implements AdminService {

	@Autowired
	AdminDao adminDao;

	// 어드민 로그인 시작
	@Override
	public Map<String, Object> aLogin(Map<String, Object> map) {
		return this.adminDao.aLogin(map);
	}
	// 어드민 로그인 끝
	
	// 멤버 리스트 시작
	@Override
	public List<Map<String, Object>> memList(Map<String, Object> map) {
		return this.adminDao.memList(map);
	}
	// 멤버 리스트 끝

}
