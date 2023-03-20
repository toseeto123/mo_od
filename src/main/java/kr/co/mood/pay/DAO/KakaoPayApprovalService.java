package kr.co.mood.pay.DAO;

import kr.co.mood.Payment.VO.KakaoPayApprovalVO;
import kr.co.mood.cate.vo.CateVO;

public interface KakaoPayApprovalService {
	
	public void paymentinsert(KakaoPayApprovalVO kvo);

	public void paysuccessdelete(String userno);
}
