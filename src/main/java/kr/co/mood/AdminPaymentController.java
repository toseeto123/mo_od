package kr.co.mood;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mood.Payment.DAO.AdminPaymentService;
import kr.co.mood.Payment.VO.AdminPaymentVO;

@RequestMapping("/admin")
@Controller
public class AdminPaymentController {

	@Autowired
	private AdminPaymentService adminService;

	@RequestMapping("/payment.do")
	public String adminPaymentDefault(HttpServletRequest request) {
		return "redirect:/admin/payment.do/1";
	}

	@RequestMapping("/payment.do/{num}")
	public String adminPaymentPaging(@PathVariable("num") String num, Model model) {
		adminService.adminPaymentList(model, num);
		model.addAttribute("num", num);
		return "admin/adminPayment";
	}

}
