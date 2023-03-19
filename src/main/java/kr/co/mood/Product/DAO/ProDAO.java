package kr.co.mood.Product.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.module.ModuleVO;

@Repository
public class ProDAO {

	@Autowired
	private SqlSessionTemplate session;

	public List<ProVO> selectProList(List<ProVO> vo) {
		return session.selectList("ProDAO.selectProList", vo);
	}
	public List<ProVO> selectProRandom(List<ProVO> vo) {
		return session.selectList("ProDAO.selectProRandom", vo);
	}
	
	public void insertPro(ProVO vo) {
		session.insert("ProDAO.insert", vo);
		session.update("ProDAO.insertSerialNumber", vo);
	}
	public void updatePro(ProVO vo) {
		session.update("ProDAO.updatePro", vo);
	}
	
	
	
	
	

	public ProVO selectProOne(int pro_number) {

		return session.selectOne("ProDAO.selectProOne", pro_number);
	}
	
	public List<ProVO> AselectProListByPayCount(List<ProVO> vo) {
		return session.selectList("ProDAO.AselectProListByPayCount",vo);
	}
	public List<ProVO> BselectProListByPayCount(List<ProVO> vo) {
		return session.selectList("ProDAO.BselectProListByPayCount",vo);
	}
	public List<ProVO> CselectProListByPayCount(List<ProVO> vo) {
		return session.selectList("ProDAO.CselectProListByPayCount",vo);
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
	
	
	
	
	public List<ProVO> selectProListPaging(ModuleVO vo){
		
		return session.selectList("ProDAO.selectProListPaging", vo);
	}
	public List<ProVO> A0selectProListPaging(ModuleVO vo){
		
		return session.selectList("ProDAO.A0selectProListPaging", vo);
	}
	public List<ProVO> A1selectProListPaging(ModuleVO vo){
		
		return session.selectList("ProDAO.A1selectProListPaging", vo);
	}
	public List<ProVO> A2selectProListPaging(ModuleVO vo){
		
		return session.selectList("ProDAO.A2selectProListPaging", vo);
	}
	public List<ProVO> B0selectProListPaging(ModuleVO vo){
		
		return session.selectList("ProDAO.B0selectProListPaging", vo);
	}
	public List<ProVO> B1selectProListPaging(ModuleVO vo){
		
		return session.selectList("ProDAO.B1selectProListPaging", vo);
	}
	public List<ProVO> C0selectProListPaging(ModuleVO vo){
		
		return session.selectList("ProDAO.C0selectProListPaging", vo);
	}
	public List<ProVO> C1selectProListPaging(ModuleVO vo){
		
		return session.selectList("ProDAO.C1selectProListPaging", vo);
	}
	
	

}
