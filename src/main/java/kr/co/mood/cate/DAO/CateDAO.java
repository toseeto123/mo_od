package kr.co.mood.cate.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mood.cate.vo.CateVO;

@Repository
public class CateDAO {

	@Autowired
	SqlSessionTemplate sql;
	
	public List<CateVO> cateselect(List<CateVO> vo) {
		return sql.selectList("CateVO.selectlist" , vo);
		
	}
	
}
