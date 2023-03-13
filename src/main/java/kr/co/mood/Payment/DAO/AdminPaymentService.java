package kr.co.mood.Payment.DAO;

import java.util.ArrayList;
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
		List<AdminPaymentVO> chart1 = dao.getCategoryChart1();
		List<AdminPaymentVO> chart2 = dao.getCategoryChart2();
		//List<AdminPaymentVO> chart3 = dao.getCategoryChart3();
		//List<AdminPaymentVO> chart4 = dao.getCategoryChart4();
		model.addAttribute("chart1", chart1);
		model.addAttribute("chart2", chart2);
		//model.addAttribute("chart3", chart3);
		//model.addAttribute("chart4", chart4);
		
	}
}
