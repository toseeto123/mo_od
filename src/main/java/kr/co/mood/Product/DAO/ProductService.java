package kr.co.mood.Product.DAO;

import java.util.List;

import kr.co.mood.Product.VO.ProVO;


public interface ProductService {
	public List<ProVO> selectProList(List<ProVO> vo);
	public void insertPro(ProVO vo);
	public ProVO selectProOne(int pro_number);
	
}
