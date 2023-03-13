package kr.co.mood.user.dao;

import java.util.List;

import kr.co.mood.Product.VO.ProPaginVO;

public interface UserService {
	// CRUD 기능의 메소드 구현
	
		public List<UserVO> selectAll(ProPaginVO vo);//추가된 부분
		
		public UserVO selectMemberNo(int no);
		
		public void insert(UserVO vo) ;

		
		public void updateUser(UserVO vo);

		
		public void deleteUser(UserVO vo) throws Exception;


		public UserVO selectId(UserVO vo);
		
		public int idChk(UserVO vo) throws Exception;


		
		
		
		



		

}
