package kr.co.mood.pay.DAO;

import kr.co.mood.Payment.VO.userOrderProductVO;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.user.dao.UserVO;

public interface productPaymentService {
	
	public void insert(userOrderProductVO orderProVo ,UserVO uvo , ProVO pvo);

}
