package kr.co.mood.Product.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.Product.VO.paymentVO;

@Service
public class ProDAOImpl implements ProDAO {
	
	@Autowired
	SqlSessionTemplate session;
		

	
	@Override
	public List<ProVO> selectProList(List<ProVO> vo) throws Exception {
		return session.selectList("ProDAO.selectProList", vo);
		
	}
	
	@Override
	public void insert(ProVO vo) {
		session.insert("ProDAO.insert",vo);
	}
	
	@Override
	public ProVO selectProOne(int pro_number) {
		
		return session.selectOne("ProDAO.selectProOne", pro_number);
	}
	@Override
	public void payInfo(paymentVO payment) throws Exception {
		session.insert("ProDAO.payInfo", payment);
	}

}
