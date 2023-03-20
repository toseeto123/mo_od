package kr.co.mood.Product.DAO;

import java.util.List;

import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.module.ModuleVO;


public interface ProductService {
	public List<ProVO> selectProList(List<ProVO> vo);
	public List<ProVO> selectProRandom(List<ProVO> vo);
	public void insertPro(ProVO vo);
	public ProVO selectProOne(int pro_number);
	public List<ProVO> AselectProListByPayCount(List<ProVO> vo);
	public List<ProVO> BselectProListByPayCount(List<ProVO> vo);
	public List<ProVO> CselectProListByPayCount(List<ProVO> vo);
	public void updatePro(ProVO vo);

	
	
	
	
	
	
	
	public List<ProVO> A0selectCategoryProList(List<ProVO> vo);
	public List<ProVO> A1selectCategoryProList(List<ProVO> vo);
	public List<ProVO> A2selectCategoryProList(List<ProVO> vo);
	public List<ProVO> B0selectCategoryProList(List<ProVO> vo);
	public List<ProVO> B1selectCategoryProList(List<ProVO> vo);
	public List<ProVO> C0selectCategoryProList(List<ProVO> vo);
	public List<ProVO> C1selectCategoryProList(List<ProVO> vo);
	public ProVO D0selectCategoryProList(List<ProVO> vo);
	public ProVO D1selectCategoryProList(List<ProVO> vo);
	public ProVO D2selectCategoryProList(List<ProVO> vo);
	public ProVO D3selectCategoryProList(List<ProVO> vo);
	
	
	
	
	
	
	public List<ProVO> selectProListPaging(ModuleVO vo);
	public List<ProVO> A0selectProListPaging(ModuleVO vo);
	public List<ProVO> A1selectProListPaging(ModuleVO vo);
	public List<ProVO> A2selectProListPaging(ModuleVO vo);
	public List<ProVO> B0selectProListPaging(ModuleVO vo);
	public List<ProVO> B1selectProListPaging(ModuleVO vo);
	public List<ProVO> C0selectProListPaging(ModuleVO vo);
	public List<ProVO> C1selectProListPaging(ModuleVO vo);
	
	
	
}
