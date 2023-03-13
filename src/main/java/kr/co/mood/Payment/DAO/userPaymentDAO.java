package kr.co.mood.Payment.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mood.Payment.VO.userOrderProductVO;
import kr.co.mood.Payment.VO.userOrderVO;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.user.dao.UserVO;

@Repository
public class userPaymentDAO {
	
	@Autowired
	SqlSessionTemplate sql;
	
	public void addOrder(userOrderVO ordervo , UserVO uvo , ProVO pvo) {
		sql.insert("userPaymentDAO insert", ordervo);
	}
	public List<userOrderVO> selectOrderList(int userNo){
		return sql.selectList("userPaymentDAO select", userNo);
	}

}
