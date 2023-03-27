package kr.co.mood.Payment.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.mood.Payment.VO.AdminChartVO;
import kr.co.mood.Payment.VO.AdminPaymentVO;
import kr.co.mood.Payment.VO.KakaoPayApprovalVO;
import kr.co.mood.module.ModuleVO;

public interface AdminPaymentDAO {
	public List<AdminChartVO> getCategoryChart1();
	public List<AdminChartVO> getCategoryChart2();
	public List<AdminChartVO> getCategoryChart3(String year);
	public List<AdminChartVO> getCategoryChart4(String year);
	public List<AdminPaymentVO> adminPaymentList();
	public List<AdminPaymentVO> adminPaymentMemberList(@Param("startNo") int startNo, @Param("endNo") int endNo);
	public List<AdminPaymentVO> adminPaymentSearchingList(ModuleVO vo);
	public KakaoPayApprovalVO adminPaymentCancel(int orderid);
}
