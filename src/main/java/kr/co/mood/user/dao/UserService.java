package kr.co.mood.user.dao;

import java.util.List;

public interface UserService {
	// CRUD 기능의 메소드 구현
		
		void insert(UserVO vo);

		
		void updateUser(UserVO vo);

		
		void deleteUser(UserVO vo);

		
		UserVO getUser(UserVO vo);

		// 글 목록 조회
		List<UserVO> getUserList(UserVO vo);
}
