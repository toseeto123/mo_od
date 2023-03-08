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
	public void insertPro(ProVO vo) {
		session.insert("ProDAO.insert", vo);
		session.update("ProDAO.insertSerialNumber", vo);
	}

	public ProVO selectProOne(int pro_number) {

		return session.selectOne("ProDAO.selectProOne", pro_number);
	}
	
	
	
	
	
	
	
	
	
	
	public List<ProVO> A0selectCategoryProList(List<ProVO> vo){
		return session.selectList("ProDAO.A0selectCategoryProList", vo);		
	}
	public List<ProVO> A1selectCategoryProList(List<ProVO> vo){
		return session.selectList("ProDAO.A1selectCategoryProList", vo);		
	}
	public List<ProVO> A2selectCategoryProList(List<ProVO> vo){
		return session.selectList("ProDAO.A2selectCategoryProList", vo);		
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
	public ProVO D0selectCategoryProList(List<ProVO> vo){
		return session.selectOne("ProDAO.D0selectCategoryProList", vo);		
	}
	public ProVO D1selectCategoryProList(List<ProVO> vo){
		return session.selectOne("ProDAO.D1selectCategoryProList", vo);		
	}
	public ProVO D2selectCategoryProList(List<ProVO> vo){
		return session.selectOne("ProDAO.D2selectCategoryProList", vo);		
	}
	public ProVO D3selectCategoryProList(List<ProVO> vo){
		return session.selectOne("ProDAO.D3selectCategoryProList", vo);		
	}
	
	

}
