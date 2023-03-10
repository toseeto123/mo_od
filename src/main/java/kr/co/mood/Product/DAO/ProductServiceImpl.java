package kr.co.mood.Product.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mood.Product.VO.ProPaginVO;
import kr.co.mood.Product.VO.ProVO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProDAO prodao;
	
	@Override
	public List<ProVO> selectProList(List<ProVO> vo){
		return prodao.selectProList(vo);
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
	public ProVO selectProOne(int pro_number){
		return prodao.selectProOne(pro_number);
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
	public List<ProVO> A0selectCategoryProList(List<ProVO> vo) {
		return prodao.A0selectCategoryProList(vo);
	}
	@Override
	public List<ProVO> A1selectCategoryProList(List<ProVO> vo) {
		return prodao.A1selectCategoryProList(vo);
	}
	@Override
	public List<ProVO> A2selectCategoryProList(List<ProVO> vo) {
		return prodao.A2selectCategoryProList(vo);
	}
	@Override
	public List<ProVO> B0selectCategoryProList(List<ProVO> vo) {
		return prodao.B0selectCategoryProList(vo);
	}
	@Override
	public List<ProVO> B1selectCategoryProList(List<ProVO> vo) {
		return prodao.B1selectCategoryProList(vo);
	}
	@Override
	public List<ProVO> C0selectCategoryProList(List<ProVO> vo) {
		return prodao.C0selectCategoryProList(vo);
	}
	@Override
	public List<ProVO> C1selectCategoryProList(List<ProVO> vo) {
		return prodao.C1selectCategoryProList(vo);
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
	public List<ProVO> selectProListPaging(ProPaginVO vo) {
		return prodao.selectProListPaging(vo);
	}

}
