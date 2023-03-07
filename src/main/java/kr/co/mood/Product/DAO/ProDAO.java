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

	public List<ProVO> selectProList(List<ProVO> vo) {
		return session.selectList("ProDAO.selectProList", vo);
	}
	public List<ProVO> A0selectCategoryProList(List<ProVO> vo){
		return session.selectList("ProDAO.A0selectCategoryProList", vo);		
	}
	public List<ProVO> A1selectCategoryProList(List<ProVO> vo){
		return session.selectList("ProDAO.A1selectCategoryProList", vo);		
	}
	public List<ProVO> B0selectCategoryProList(List<ProVO> vo){
		return session.selectList("ProDAO.B0selectCategoryProList", vo);		
	}
	public List<ProVO> B1selectCategoryProList(List<ProVO> vo){
		return session.selectList("ProDAO.B1selectCategoryProList", vo);		
	}
	
	public List<ProVO> C0selectCategoryProList(List<ProVO> vo){
		return session.selectList("ProDAO.C0selectCategoryProList", vo);		
	}
	public List<ProVO> C1selectCategoryProList(List<ProVO> vo){
		return session.selectList("ProDAO.C1selectCategoryProList", vo);		
	}

	public void insertPro(ProVO vo) {
		session.insert("ProDAO.insert", vo);
		session.update("ProDAO.insertSerialNumber", vo);
	}

	public ProVO selectProOne(int pro_number) {

		return session.selectOne("ProDAO.selectProOne", pro_number);
	}
	
	

}
