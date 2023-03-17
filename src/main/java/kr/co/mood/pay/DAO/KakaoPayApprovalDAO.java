package kr.co.mood.pay.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mood.Payment.VO.KakaoPayApprovalVO;

@Repository
public class KakaoPayApprovalDAO {

	@Autowired
	SqlSessionTemplate sql;
	
	public void paymentinsert(KakaoPayApprovalVO kvo) {
		sql.insert("KakaoPayApprovalDAO.insert", kvo);
	}
}
