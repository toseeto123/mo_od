package kr.co.mood.Payment.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.mood.Payment.VO.AdminPaymentVO;

@Service
public class AdminPaymentService {
	@Autowired
	AdminPaymentDAO dao;
	
	public void getPaymentList(Model model) {
		List<AdminPaymentVO> list = dao.getadminPayment();
		System.out.println(list.get(0).getUser_name());
		model.addAttribute("list", list);
		
	}
}
