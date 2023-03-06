package kr.co.mood.Product.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mood.Product.VO.ProVO;

@Repository
public class ProDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public List<ProVO> selectProList(List<ProVO> vo){
		return session.selectList("ProDAO.selectProList", vo);
		
	}
	
	public void insert(ProVO vo) {
		session.insert("ProDAO.insert",vo);
	}
	
public ProVO selectProOne(int pro_number) {
		
		return session.selectOne("ProDAO.selectProOne", pro_number);
	}
	

	
}
