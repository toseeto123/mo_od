package kr.co.mood.Payment.DAO;

import java.util.List;

import kr.co.mood.Payment.VO.AdminPaymentVO;

public interface AdminPaymentDAO {
	public List<AdminPaymentVO> getCategoryChart1();
	public List<AdminPaymentVO> getCategoryChart2();
	//public List<AdminPaymentVO> getCategoryChart3();
	//public List<AdminPaymentVO> getCategoryChart4();
}
