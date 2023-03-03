package kr.co.mood.Product.DAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mood.Product.VO.ProVO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProDAO dao;
	
	
	
	@Override
	public void insert(ProVO vo) {
		
		dao.insert(vo);
		
	}

}
