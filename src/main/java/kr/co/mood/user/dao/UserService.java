package kr.co.mood.user.dao;

import java.util.List;

import kr.co.mood.module.ModuleVO;

public interface UserService {
	// CRUD 기능의 메소드 구현
	
		public List<UserVO> findEmail(String email);
	
		public List<UserVO> selectAll(ModuleVO vo);//추가된 부분
		
		public UserVO selectIdCheck(String id); 
		
		public UserVO selectMemberNo(int no);
		
		public void insert(UserVO vo);

		
		public void update(UserVO vo) throws Exception;
		
		public void updatePwd(UserVO vo);
		
		public void delete(String id) throws Exception;


		public UserVO selectId(UserVO vo);
		
		public int idChk(UserVO vo) throws Exception;


		public void insertnaver(UserVO naver);
		
		



		

}
