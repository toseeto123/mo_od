package kr.co.mood.Payment.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mood.Payment.VO.userOrderVO;
import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.cate.DAO.CateService;
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
	ProductService productService;
	
	
	
	@RequestMapping(value="/orders" , method = RequestMethod.POST)
	public String processOrder(HttpSession session ,Model model) {
		
		UserVO uvo = (UserVO)session.getAttribute("login_info");
		System.out.println(uvo);
		int userid = uvo.getNo();
		
		ProVO pvo = (ProVO)session.getAttribute("pro_number");
		System.out.println(pvo);
		int proid = pvo.getPro_number();
		
		
		
		userOrderVO ordervo = new userOrderVO();
		System.out.println(ordervo);
		//정보 오더테이블에 담기
		ordervo.setUserNo(userid);
		ordervo.setPro_number(proid);
		int count =ordervo.getOrderCount();
		count = 1;
		model.addAttribute(count);
		ordervo.setOrderCount(count);
		System.out.println(ordervo);
		if (ordervo != null && uvo != null && pvo != null) {
			System.out.println(ordervo);
			System.out.println(uvo);
			System.out.println(pvo);
			System.out.println(payService);
		    payService.insert(ordervo, uvo, pvo);
		}else {
			System.out.println("odervo uvo pvo == null ");
		}
		System.out.println(payService);
		
		//model.addAttribute("list", payService.selectOrderList(userid));
	    model.addAttribute("pro_number", pvo);
		
		
		return "User/userPay";
	}
	
	
	// 二쇰Ц �궡�뿭 媛��졇媛� 紐낅졊�뼱 url�쓣 �넻�빐 �쟾�떖諛쏆쓣 �쉶�썝�젙蹂� no瑜� �뙆�씪誘명꽣 �꽕�젙
	//�긽�뭹 �젙蹂� �쟾�떖諛쏆쓣 OrderListVO 洹몃━怨� pageGet�뿉�꽌 view濡� �쟾�떖�빐以� model
	@RequestMapping("/User/userPay/{no}")
	public void orderPgaeGET(@PathVariable("no") String no, userOrderVO uol, Model model) {

		System.out.println("memberId : " + no);

	}

	
	// payment test
	@RequestMapping(value = "/userPay", method = RequestMethod.GET)
	public String userPay() {

		return "User/userPay";
	}

	// 寃곗젣 由ъ뒪�듃
	@RequestMapping(value = "/userPaymentList.do")
	public String userPaymentList() {

		return "User/userPaymentList";
	}

	// 寃곗젣 �긽�꽭
	@RequestMapping(value = "/userPaymentDetail.do")
	public String userPaymentDetail() {

		return "User/userPaymentDetail";
	}
}
