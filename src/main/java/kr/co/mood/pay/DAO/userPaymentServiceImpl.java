package kr.co.mood.pay.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mood.Payment.VO.userOrderVO;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.user.dao.UserVO;

@Service
public class userPaymentServiceImpl implements userPaymentService {
	
	@Autowired
	userPaymentDAO userPaydao;
	
	@Override
	public void insert(userOrderVO ordervo,UserVO uvo, ProVO pvo) {
		userPaydao.insert(ordervo, uvo, pvo);
	}

}
