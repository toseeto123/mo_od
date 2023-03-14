package kr.co.mood.pay.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mood.Payment.VO.userOrderProductVO;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.cate.vo.CateVO;
import kr.co.mood.user.dao.UserVO;

@Service
public class productPaymentServiceImpl implements productPaymentService {

	@Autowired
	productPaymentDAO productPayDao;
	
	@Override
	public void insert(userOrderProductVO orderProVo, UserVO uvo, ProVO pvo) {
		productPayDao.insert(orderProVo, uvo, pvo);
	}
	
	@Override
	public List<userOrderProductVO> selectList(int orderId) {
		return productPayDao.selectList(orderId);
		 
	}
}
