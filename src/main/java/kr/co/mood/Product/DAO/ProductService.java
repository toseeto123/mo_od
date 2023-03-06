package kr.co.mood.Product.DAO;

import java.util.List;

import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.Product.VO.paymentVO;


public interface ProductService {
	public List<ProVO> selectProList(List<ProVO> vo) throws Exception;
	public void insert(ProVO vo);
	public ProVO selectProOne(int pro_number) throws Exception;
	
	//결제 정보
	public void payInfo(paymentVO payment) throws Exception;
}
