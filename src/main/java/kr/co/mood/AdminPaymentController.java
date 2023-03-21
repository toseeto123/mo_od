package kr.co.mood;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mood.Payment.DAO.AdminPaymentService;
import kr.co.mood.module.ModuleCommon;

@RequestMapping("/admin")
@Controller
public class AdminPaymentController {

	@Autowired
	private AdminPaymentService adminService;
	
	@Autowired
	private ModuleCommon module;

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
	
	@RequestMapping("/payment.do/{paging}/{searchWhat}/{search}")
	@ResponseBody
	public Map<String, Object> adminPaymentPagingSearching(@PathVariable String paging,@PathVariable String searchWhat,@PathVariable String search, Model model){
		   Map<String, Object> map = adminService.adminPaymentSearchingList(model, paging, searchWhat, search);
		return map;	
	}

}
