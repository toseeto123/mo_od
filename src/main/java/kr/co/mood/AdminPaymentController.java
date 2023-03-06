package kr.co.mood;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mood.Payment.DAO.AdminPaymentService;

@Controller
public class AdminPaymentController {
	
	@Autowired
	AdminPaymentService adminService;
	
	@RequestMapping("payment.do")
	public String adminIndex(Model model) {
		adminService.getPaymentList(model);
		return "adminPage/adminPayment";	
	}
	
}
