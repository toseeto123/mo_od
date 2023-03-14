package kr.co.mood.pay.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mood.Payment.VO.userOrderProductVO;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.user.dao.UserVO;

@Repository
public class productPaymentDAO {
	
	@Autowired
	SqlSessionTemplate sql;
	
	
	public void insert(userOrderProductVO orderProVo, UserVO uvo , ProVO pvo) {
		sql.insert("productPaymentDAO.insert",orderProVo);
	}
}
