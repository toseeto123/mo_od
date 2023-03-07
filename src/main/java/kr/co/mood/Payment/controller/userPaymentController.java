package kr.co.mood.Payment.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProVO;

@Controller
public class userPaymentController {

	@Autowired
	ProductService ps;

	// payment이동
	@RequestMapping(value = "userPayment.do", method = RequestMethod.POST)
	public String userPayment(ArrayList<ProVO> vo, Model model) {
		List<ProVO> list = ps.selectProList(vo);
		model.addAttribute("list", list);
		return "User/userPayment";
	}

	// payment test
	@RequestMapping(value = "userPayment.do", method = RequestMethod.GET)
	public String userPayment() {

		return "User/userPayment";
	}
	//결제 리스트 
	@RequestMapping(value = "userPaymentList.do")
	public String userPaymentList() {
	
		return "User/userPaymentList";
	}
	//결제 상세
	@RequestMapping(value = "userPaymentDetail.do")
	public String userPaymentDetail() {
		
		return "User/userPaymentDetail";
	}
}
