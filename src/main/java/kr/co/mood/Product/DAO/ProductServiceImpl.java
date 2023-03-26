package kr.co.mood.Product.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.module.ModuleVO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProDAO prodao;
	
	@Override
	public List<ProVO> selectProList(ModuleVO vo){
		return prodao.selectProList(vo);
	}
	@Override
	public List<ProVO> selectProRandom(List<ProVO> vo) {
		
		return prodao.selectProRandom(vo);
	}
	
	@Override
	public void insertPro(ProVO vo) {
		prodao.insertPro(vo);
		
	}
	
	@Override
	public void updatePro(ProVO vo) {
		prodao.updatePro(vo);
	}
	
	@Override
	public void catecountupdate(String pro_no) {
		prodao.catecountupdate(pro_no);
	}
	
	
	@Override
	public ProVO selectProOne(int pro_number){

		return prodao.selectProOne(pro_number);
	}
	
	@Override
	public List<ProVO> ACategoryList(List<ProVO> vo) {

		return prodao.ACategoryList(vo);
	}
	@Override
	public List<ProVO> BCategoryList(List<ProVO> vo) {
		return prodao.BCategoryList(vo);
	}
	@Override
	public List<ProVO> CCategoryList(List<ProVO> vo) {
		return prodao.CCategoryList(vo);
	}
	
	
	@Override
	public List<ProVO> AselectProListByPayCount(List<ProVO> vo) {
		return prodao.AselectProListByPayCount(vo);
	}
	@Override
	public List<ProVO> BselectProListByPayCount(List<ProVO> vo) {
		return prodao.BselectProListByPayCount(vo);
	}
	@Override
	public List<ProVO> CselectProListByPayCount(List<ProVO> vo) {
		return prodao.CselectProListByPayCount(vo);
	}
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<ProVO> A0selectCategoryProList(List<ProVO> voa0) {
		return prodao.A0selectCategoryProList(voa0);
	}
	@Override
	public List<ProVO> A1selectCategoryProList(List<ProVO> voa1) {
		return prodao.A1selectCategoryProList(voa1);
	}
	@Override
	public List<ProVO> A2selectCategoryProList(List<ProVO> voa2) {
		return prodao.A2selectCategoryProList(voa2);
	}
	@Override
	public List<ProVO> B0selectCategoryProList(List<ProVO> vob0) {
		return prodao.B0selectCategoryProList(vob0);
	}
	@Override
	public List<ProVO> B1selectCategoryProList(List<ProVO> vob1) {
		return prodao.B1selectCategoryProList(vob1);
	}
	@Override
	public List<ProVO> C0selectCategoryProList(List<ProVO> voc0) {
		return prodao.C0selectCategoryProList(voc0);
	}
	@Override
	public List<ProVO> C1selectCategoryProList(List<ProVO> voc1) {
		return prodao.C1selectCategoryProList(voc1);
	}
	@Override
	public ProVO D0selectCategoryProList(List<ProVO> vo) {
		return prodao.D0selectCategoryProList(vo);
	}
	@Override
	public ProVO D1selectCategoryProList(List<ProVO> vo) {
		return prodao.D1selectCategoryProList(vo);
	}
	@Override
	public ProVO D2selectCategoryProList(List<ProVO> vo) {
		return prodao.D2selectCategoryProList(vo);
	}
	@Override
	public ProVO D3selectCategoryProList(List<ProVO> vo) {
		return prodao.D3selectCategoryProList(vo);
	}
	
	
	
	
	
	@Override
	public List<ProVO> selectProListPaging(ModuleVO vo) {
		return prodao.selectProListPaging(vo);
	}
	@Override
	public List<ProVO> A0selectProListPaging(ModuleVO vo) {
		return prodao.A0selectProListPaging(vo);
	}
	@Override
	public List<ProVO> A1selectProListPaging(ModuleVO vo) {
		return prodao.A1selectProListPaging(vo);
	}
	@Override
	public List<ProVO> A2selectProListPaging(ModuleVO vo) {
		return prodao.A2selectProListPaging(vo);
	}
	@Override
	public List<ProVO> B0selectProListPaging(ModuleVO vo) {
		return prodao.B0selectProListPaging(vo);
	}
	@Override
	public List<ProVO> B1selectProListPaging(ModuleVO vo) {
		return prodao.B1selectProListPaging(vo);
	}
	@Override
	public List<ProVO> C0selectProListPaging(ModuleVO vo) {
		return prodao.C0selectProListPaging(vo);
	}
	@Override
	public List<ProVO> C1selectProListPaging(ModuleVO vo) {
		return prodao.C1selectProListPaging(vo);
	}


}
