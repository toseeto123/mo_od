package kr.co.mood.Payment.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.mood.Payment.VO.userOrderVO;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.user.dao.UserVO;

public class userPaymentServiceImpl implements userPaymentService {
	
	@Autowired
	userPaymentDAO userPaydao;
	
	@Override
	public void addOrder(userOrderVO ordervo, UserVO uvo, ProVO pvo) {
		userPaydao.addOrder(ordervo, uvo, pvo);
	}
	@Override
	public List<userOrderVO> selectOrderList(int userNo) {
		return userPaydao.selectOrderList(userNo);
	}

}
