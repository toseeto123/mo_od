package kr.co.mood.pay.DAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mood.Payment.VO.KakaoPayApprovalVO;
import kr.co.mood.cate.vo.CateVO;

@Service
public class KakaoPayApprovalServiceImpl implements KakaoPayApprovalService{

	@Autowired
	KakaoPayApprovalDAO kdao;
	
	public void paymentinsert(KakaoPayApprovalVO kvo) {
		kdao.paymentinsert(kvo);
	}

	public void paysuccessdelete(String userno) {
		kdao.paysuccessdelete(userno);
	}

	public void paysuccessupdate(String pro_no) {
		kdao.paysuccessupdate(pro_no);
	}

}
