package kr.co.mood.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mood.Product.VO.ProPaginVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private SqlSession session;
	
	public List<UserVO> selectAll(ProPaginVO vo) {//추가된 부분
		return mybatis.selectList("UserDAO.selectAll", vo);
	}
	public UserVO selectMemberNo(int no) {
		return mybatis.selectOne("UserDAO.selectMemberNo", no);
	}
	
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


	public void update(UserVO vo) {
		mybatis.update("UserDAO.update",vo);
		
	}
	

}
