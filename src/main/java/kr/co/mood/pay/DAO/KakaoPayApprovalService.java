package kr.co.mood.pay.DAO;

import java.util.List;

import kr.co.mood.Payment.VO.KakaoPayApprovalVO;

public interface KakaoPayApprovalService {
	
	public void paymentinsert(KakaoPayApprovalVO kvo);

	public void paysuccessdelete(String userno);
	
	public void paysuccessupdate(String pro_no);
	
	public List<KakaoPayApprovalVO>selectlist(int userno);
	
	public void paycancelDelete(int orderId);
	
	public void paySuccessStatusUpdate(int orderId);
}
