package kr.co.mood.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public void insert(UserVO vo) {
		System.out.println("insert해따");
		mybatis.insert("UserDAO.insert", vo);
		System.out.println(vo);
		
	}
	

	public UserVO selectId(UserVO vo) {
		System.out.println("user 가져와따1");
		return mybatis.selectOne("UserDAO.selectId",vo);
		
	}

}
