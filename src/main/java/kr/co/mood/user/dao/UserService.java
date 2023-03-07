package kr.co.mood.user.dao;

public interface UserService {
	// CRUD 기능의 메소드 구현
		
		public void insert(UserVO vo);

		
		public void updateUser(UserVO vo);

		
		public void deleteUser(UserVO vo);


		public UserVO selectId(UserVO vo);

}
