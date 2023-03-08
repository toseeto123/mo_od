package kr.co.mood;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mood.Payment.DAO.AdminPaymentService;

@Controller
public class AdminPaymentController {
	
	@Autowired
	AdminPaymentService adminService;

	@RequestMapping("/payment.do")
	public String adminPaymentDefault(HttpServletRequest request) {
		return "redirect:/payment.do/1";	
	}
	
	@RequestMapping("/payment.do/{num}")
	public String adminPaymentPaging(@PathVariable("num") String num, Model model) {
		model.addAttribute("num", num);
		return "adminPage/adminPayment";	
	}
	
}
