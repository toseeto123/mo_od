package kr.co.mood.Payment.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mood.Payment.VO.userOrderProductVO;
import kr.co.mood.Payment.VO.userOrderVO;
import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.cate.DAO.CateService;
import kr.co.mood.pay.DAO.productPaymentService;
import kr.co.mood.pay.DAO.userPaymentService;
import kr.co.mood.user.dao.UserService;
import kr.co.mood.user.dao.UserVO;


@Controller
@RequestMapping("/products")
public class userPaymentController {

	
	@Autowired
	CateService cservice;
	@Autowired
	UserService userService;
	@Autowired
	userPaymentService payService;
	@Autowired
	productPaymentService productPayService;
	@Autowired
	ProductService productService;
	
	
	
	@RequestMapping(value="/orders" , method = RequestMethod.POST)
	public String processOrder(HttpSession session ,Model model, @RequestParam("pro_number") int pro_number , @RequestParam("pro_price") int pro_price) {
		
		System.out.println(pro_number);
		System.out.println(pro_price);
		UserVO uvo = (UserVO)session.getAttribute("login_info");
		System.out.println(uvo);
		int userid = uvo.getNo();
		
		int proid = pro_number;
		int price = pro_price;
		
		
		userOrderVO ordervo = new userOrderVO();
		System.out.println(ordervo);
		//�젙蹂� �삤�뜑�뀒�씠釉붿뿉 �떞湲�
		ordervo.setUserNo(userid);
		//ordervo.setPro_number(proid);
		int count =ordervo.getOrderCount();
		count = 1;
		model.addAttribute(count);
		ordervo.setOrderCount(count);
		System.out.println(ordervo);
		
		if (ordervo != null && uvo != null ) {
		    payService.insert(ordervo, uvo, null);
		    System.out.println("orderId:" + ordervo.getOrderId());
		}else {
			System.out.println("ordervo uvo pvo == null ");
		}
		System.out.println(payService);
		
		//由ъ뒪�듃 ���떊 orderProduct�뿉 return�썑 insert �빐�빞�븿
		// �긽�뭹 媛��닔�뒗 �씪�떒 諛섏쁺�릺硫� 異붽��븯�뒗嫄몃줈 �빐蹂대뒗嫄몃줈.
		//Map<String, String> params = new HashMap<String,String>();
		//params.put("orderId", "orderId");
		//System.out.println(params.get("orderId"));
		
		int orderId = ordervo.getOrderId();
		
		
		userOrderProductVO orderProVo = new userOrderProductVO();
		orderProVo.setOrderId(orderId);
		orderProVo.setPro_number(proid);
		orderProVo.setPrice(price);
		orderProVo.setCount(count);
		System.out.println(orderProVo);
		
		productPayService.insert(orderProVo, uvo, null);
		
		//model.addAttribute("list", productPayService.selectOrderList(userid));
		
		
		return "User/userPay";
	}
	
	
	@RequestMapping("/User/userPay/{no}")
	public void orderPgaeGET(@PathVariable("no") String no, userOrderVO uol, Model model) {

		System.out.println("memberId : " + no);

	}

	
	// payment test
	@RequestMapping(value = "/userPay", method = RequestMethod.GET)
	public String userPay() {

		return "User/userPay";
	}

	// 野껉퀣�젫 �뵳�딅뮞占쎈뱜
	@RequestMapping(value = "/userPaymentList.do")
	public String userPaymentList() {

		return "User/userPaymentList";
	}

	// 野껉퀣�젫 占쎄맒占쎄쉭
	@RequestMapping(value = "/userPaymentDetail.do")
	public String userPaymentDetail() {

		return "User/userPaymentDetail";
	}
}
