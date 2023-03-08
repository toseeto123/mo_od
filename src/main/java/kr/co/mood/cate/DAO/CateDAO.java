package kr.co.mood.cate.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.cate.vo.CateVO;
import kr.co.mood.user.dao.UserVO;

@Repository
public class CateDAO {

	@Autowired
	SqlSessionTemplate sql;
	
	public List<CateVO> cateselect(UserVO vo) {
		return sql.selectList("CateDAO.selectlist" , vo);
		
	}
	
	public void addcate(CateVO cvo, UserVO uvo, ProVO pvo) {
		sql.insert("CateDAO.insert",cvo);
		
	}
	
	
}
