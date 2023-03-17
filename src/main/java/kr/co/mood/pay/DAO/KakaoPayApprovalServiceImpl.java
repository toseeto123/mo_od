package kr.co.mood.pay.DAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mood.Payment.VO.KakaoPayApprovalVO;

@Service
public class KakaoPayApprovalServiceImpl implements KakaoPayApprovalService{

	@Autowired
	KakaoPayApprovalDAO kdao;
	
	@Override
	public void paymentinsert(KakaoPayApprovalVO kvo) {
		kdao.paymentinsert(kvo);
	}

}
