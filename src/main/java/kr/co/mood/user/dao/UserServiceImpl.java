package kr.co.mood.user.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userdao;
	
	private UserVO vo;
	ModelAndView mav;
	
	public void insert(UserVO vo) {
		userdao.insert(vo);
	}

	public void updateUser(UserVO vo) {
		userdao.update(vo);
		
	}

	public UserVO selectId(UserVO vo) {
		return userdao.selectId(vo);
	}

	@Override
	public int idChk(UserVO vo) throws Exception {
		int result = userdao.idChk(vo);
		return result;
	}
	
	

	@Override
	public void deleteUser(UserVO vo) throws Exception {
		userdao.delete(vo);
	}

	@Override
	public void insertnaver(UserVO naver) {
		userdao.insertnaver(naver);		
	}

	

	

	


	
	


	

	


}
