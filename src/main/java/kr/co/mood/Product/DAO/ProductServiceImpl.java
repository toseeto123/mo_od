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
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<ProVO> selectProList(List<ProVO> vo){
		return session.selectList("ProDAO.selectProList", vo);
	}
	
	
	@Override
	public void insert(ProVO vo) {
		
		prodao.insert(vo);
		
	}
	
	@Override
	public ProVO selectProOne(int pro_number){

		return session.selectOne("ProDAO.selectProOne", pro_number);
	}

}
