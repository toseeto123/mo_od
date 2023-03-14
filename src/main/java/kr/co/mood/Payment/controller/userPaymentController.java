package kr.co.mood.Payment.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String processOrder(HttpSession session ,Model model) {
		
		UserVO uvo = (UserVO)session.getAttribute("login_info");
		System.out.println(uvo);
		int userid = uvo.getNo();
		
		ProVO pvo = (ProVO)session.getAttribute("pro_number");
		System.out.println(pvo);
		int pronum = pvo.getPro_number();
		int price = pvo.getPro_price();
		
		
		userOrderVO ordervo = new userOrderVO();
		System.out.println(ordervo);
		//정보 오더테이블에 담기
		ordervo.setUserNo(userid);
		//ordervo.setPro_number(proid);
		int count = ordervo.getOrderCount();
		count = 1;
		model.addAttribute(count);
		ordervo.setOrderCount(count);
		System.out.println(ordervo);
		
		if (ordervo != null && uvo != null && pvo != null) {
		    payService.insert(ordervo, uvo, pvo);
		    System.out.println("orderId:" + ordervo.getOrderId());
		}else {
			System.out.println("ordervo uvo pvo == null ");
		}
		System.out.println(payService);
		
		//리스트 대신 orderProduct에 return후 insert 해야함
		// 상품 갯수는 일단 반영되면 추가하는걸로 해보는걸로.
		//Map<String, String> params = new HashMap<String,String>();
		//params.put("orderId", "orderId");
		//System.out.println(params.get("orderId"));
		
		int orderId = ordervo.getOrderId();
		
		userOrderProductVO orderProVo = new userOrderProductVO();
		orderProVo.setOrderId(orderId);
		orderProVo.setPro_number(pronum);
		orderProVo.setPrice(price);
		orderProVo.setCount(count);
		orderProVo.setPro_name(pvo.getPro_name());
		System.out.println(orderProVo);
		
		productPayService.insert(orderProVo, uvo, pvo);
		
		
		model.addAttribute("orders", productPayService.selectList(orderId));
		System.out.println(productPayService.selectList(orderId));
		
		
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

	// 寃곗젣 �긽�꽭
	@RequestMapping(value = "/userPaymentDetail.do")
	public String userPaymentDetail() {

		return "User/userPaymentDetail";
	}
}
