package kr.co.mood.Payment.DAO;

import kr.co.mood.Payment.VO.userOrderVO;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.user.dao.UserVO;

public interface userPaymentService {
	
	public void addOrder(userOrderVO ordervo , UserVO uvo , ProVO pvo);

}
