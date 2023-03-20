package kr.co.mood.Payment.DAO;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.mood.Payment.VO.AdminPaymentVO;

@Service
public class AdminPaymentService {
	@Autowired
	AdminPaymentDAO dao;
	
	public void getCategoryChart(Model model) {
		String year =LocalDate.now().toString().split("-")[0];
		List<AdminPaymentVO> chart1 = dao.getCategoryChart1();
		List<AdminPaymentVO> chart2 = dao.getCategoryChart2();
		List<AdminPaymentVO> chart3 = dao.getCategoryChart3(year);
		List<AdminPaymentVO> chart4 = dao.getCategoryChart4(year);
		model.addAttribute("chart1", chart1);
		model.addAttribute("chart2", chart2);
		model.addAttribute("chart3", chart3);
		model.addAttribute("chart4", chart4);
		
	}
}
