package kr.co.mood.pay.DAO;

import java.util.List;

import kr.co.mood.Payment.VO.userOrderVO;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.user.dao.UserVO;

public interface userPaymentService {
	
	
	public void insert(userOrderVO ordervo ,UserVO uvo , ProVO pvo);
	

}
