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
	
	public List<CateVO> cateselect(int user_no) {
		return sql.selectList("CateDAO.selectlist" , user_no);
		
	}
	
	public void addcate(CateVO cvo, UserVO uvo, ProVO pvo) {
		sql.insert("CateDAO.insert",cvo);
		
	}
	
	public int modifyflashamount(CateVO cvo) {
		return sql.update("CateDAO.plusupdate" , cvo);
	}
	public int modifyminusamount(CateVO cvo) {
		return sql.update("CateDAO.minusupdate" , cvo);
	}
	public int dupcate(int pro_number , int user_no) {
		return sql.update("CateDAO.dupcate" , pro_number);
	}
	
	
	
}
