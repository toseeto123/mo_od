package kr.co.mood.pay.DAO;

import java.util.List;

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
	
	public void paysuccessdelete(String userno) {
		sql.delete("KakaoPayApprovalDAO.catedelete" , userno);
	}
	
	public void paysuccessupdate(String pro_no) {
		sql.update("KakaoPayApprovalDAO.paycountupdate" , pro_no);
	}
	public List<KakaoPayApprovalVO>selectlist(int userno) {
		return sql.selectList("KakaoPayApprovalDAO.selectlist", userno);
	}
	public List<KakaoPayApprovalVO>selectorderid(int userno) {
		return sql.selectList("KakaoPayApprovalDAO.selectorderid", userno);
	}

	public void paycancelDelete(int orderId) {
		sql.delete("KakaoPayApprovalDAO.cancelDelete" , orderId);
	}
}
