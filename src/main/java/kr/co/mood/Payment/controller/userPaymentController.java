package kr.co.mood.Payment.controller;



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
		UserVO uvo = (UserVO)session.getAttribute("login_info");
		System.out.println(uvo);
		int userid = uvo.getNo();
		
		int proid = pro_number;
		int price = pro_price;

		
		
		userOrderVO ordervo = new userOrderVO();
		System.out.println(ordervo);
		//占쎌젟癰귨옙 占쎌궎占쎈쐭占쎈�믭옙�뵠�뇡遺용퓠 占쎈뼖疫뀐옙
		ordervo.setUserNo(userid);
		//ordervo.setPro_number(proid);
		int count = ordervo.getOrderCount();
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
		
		//�뵳�딅뮞占쎈뱜 占쏙옙占쎈뻿 orderProduct占쎈퓠 return占쎌뜎 insert 占쎈퉸占쎈튊占쎈맙
		// 占쎄맒占쎈�� 揶쏉옙占쎈땾占쎈뮉 占쎌뵬占쎈뼊 獄쏆꼷�겫占쎈┷筌롳옙 �빊遺쏙옙占쎈릭占쎈뮉椰꾨챶以� 占쎈퉸癰귣��뮉椰꾨챶以�.
		//Map<String, String> params = new HashMap<String,String>();
		//params.put("orderId", "orderId");
		//System.out.println(params.get("orderId"));
		
		int orderId = ordervo.getOrderId();
		
		userOrderProductVO orderProVo = new userOrderProductVO();
		orderProVo.setOrderId(orderId);
		orderProVo.setPro_number(proid);
		orderProVo.setPrice(price);
		orderProVo.setCount(count);
		//orderProVo.setPro_name(pvo.getPro_name());
		System.out.println(orderProVo);
		
		productPayService.insert(orderProVo, uvo, null);
		
		
		model.addAttribute("orders", productPayService.selectList(orderId));
		System.out.println(productPayService.selectList(orderId));
		
		
		return "User/userPayOne";
	}
	
	
	@RequestMapping(value="/cateorders" , method = RequestMethod.POST)
	public String cateProcessOrder(HttpSession session ,Model model, @RequestParam("pro_number") int pro_number , @RequestParam("pro_price") int pro_price) {
		UserVO uvo = (UserVO)session.getAttribute("login_info");
		
		int userid = uvo.getNo();
		
		int proid = pro_number;
		int price = pro_price;
		
		
		userOrderVO ordervo = new userOrderVO();

		ordervo.setUserNo(userid);

		int count =ordervo.getOrderCount();
		count = 1;
		model.addAttribute(count);
		ordervo.setOrderCount(count);

		System.out.println("안찍히지?"+userid);
		if (ordervo != null && uvo != null ) {
		    payService.insert(ordervo, uvo, null);
		    System.out.println("orderId:" + ordervo.getOrderId());
		}else {
			System.out.println("ordervo uvo pvo == null ");
		}
		System.out.println(payService);
		
		int orderId = ordervo.getOrderId();
		
		
		userOrderProductVO orderProVo = new userOrderProductVO();
		orderProVo.setOrderId(orderId);
		orderProVo.setPro_number(proid);
		orderProVo.setPrice(price);
		orderProVo.setCount(count);
		
		productPayService.insert(orderProVo, uvo, null);
		
		model.addAttribute("list", cservice.selectCateList(userid));
		System.out.println(cservice.selectCateList(userid));
		System.out.println("dddddddddddddddd : "+ userid);
		return "/User/userPay";
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


	@RequestMapping(value = "/userPaymentDetail.do")
	public String userPaymentDetail() {

		return "User/userPaymentDetail";
	}
}
