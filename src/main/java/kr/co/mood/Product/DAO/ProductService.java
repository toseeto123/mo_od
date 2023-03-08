package kr.co.mood.Product.DAO;

import java.util.List;

import kr.co.mood.Product.VO.ProVO;


public interface ProductService {
	public List<ProVO> selectProList(List<ProVO> vo);
	public void insertPro(ProVO vo);
	public ProVO selectProOne(int pro_number);
	
	
	public List<ProVO> A0selectCategoryProList(List<ProVO> vo);
	public List<ProVO> A1selectCategoryProList(List<ProVO> vo);
	public List<ProVO> A2selectCategoryProList(List<ProVO> vo);
	public List<ProVO> B0selectCategoryProList(List<ProVO> vo);
	public List<ProVO> B1selectCategoryProList(List<ProVO> vo);
	public List<ProVO> C0selectCategoryProList(List<ProVO> vo);
	public List<ProVO> C1selectCategoryProList(List<ProVO> vo);
	public List<ProVO> D0selectCategoryProList(List<ProVO> vo);
	public List<ProVO> D1selectCategoryProList(List<ProVO> vo);
	public List<ProVO> D2selectCategoryProList(List<ProVO> vo);
	public List<ProVO> D3selectCategoryProList(List<ProVO> vo);
	
	
}
