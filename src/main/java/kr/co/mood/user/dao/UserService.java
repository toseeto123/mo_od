package kr.co.mood.user.dao;


public interface UserService {
	// CRUD 기능의 메소드 구현
		
		public void insert(UserVO vo) ;

		
		public void updateUser(UserVO vo);

		
		public void deleteUser(UserVO vo) throws Exception;


		public UserVO selectId(UserVO vo);
		
		public int idChk(UserVO vo) throws Exception;


		
		
		
		



		

}
