package kr.co.mood.Product.DAO;

import java.util.List;

import kr.co.mood.Product.VO.ProVO;


public interface ProductService {
	public List<ProVO> selectProList(List<ProVO> vo) throws Exception;
	public void insert(ProVO vo);
	public ProVO selectProOne(int pro_number) throws Exception;
	
}
