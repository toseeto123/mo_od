package kr.co.mood.Product.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public ProVO selectProOne(int pro_number){
		return prodao.selectProOne(pro_number);
	}

}
