package kr.co.mood.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private SqlSession session;
	
	
	public void insert(UserVO vo) {
		mybatis.insert("UserDAO.insert", vo);
		System.out.println(vo);
		
	}
	

	public UserVO selectId(UserVO vo) {
		return mybatis.selectOne("UserDAO.selectId",vo);
		
	}
	
	public int idChk(UserVO vo) throws Exception{
		int result = mybatis.selectOne("UserDAO.idChk", vo);
		return result;
	}
	
	public void delete(UserVO vo) throws Exception{
		mybatis.delete("UserDAO.delete", vo);
		System.out.println(vo);
	}
	

}
