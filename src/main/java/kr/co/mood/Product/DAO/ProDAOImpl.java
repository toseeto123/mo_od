package kr.co.mood.Product.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mood.Product.VO.ProVO;

@Service
public class ProDAOImpl implements ProDAO {
	
	@Autowired
	SqlSessionTemplate session;
		
	
	@Override
	public List<ProVO> selectProList(List<ProVO> vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("ProDAO.selectProList", vo);
	}
	
	
	@Override
	public void insert(ProVO vo) {
		session.insert("ProDAO.insert",vo);
	}

}
