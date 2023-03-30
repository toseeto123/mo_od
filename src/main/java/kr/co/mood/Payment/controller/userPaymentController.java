package kr.co.mood.Payment.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mood.Payment.VO.userOrderProductVO;
import kr.co.mood.Payment.VO.userOrderVO;
import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.cate.DAO.CateService;
import kr.co.mood.cate.vo.CateVO;
import kr.co.mood.pay.DAO.KakaoPayApprovalService;
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
	@Autowired
	KakaoPayApprovalService kakaoPayApprovalService;
	
	

	@Transactional
	@RequestMapping(value = "/orders", method = RequestMethod.POST)
	public String processOrder(HttpSession session, Model model, @RequestParam("pro_number") String pro_number,
			@RequestParam("pro_price") int pro_price, @RequestParam("radioOption") String pro_option,
			RedirectAttributes redirectAttributes,@RequestParam("adr") String address) {
		UserVO uvo = (UserVO) session.getAttribute("login_info");
		userOrderVO ordervo = new userOrderVO();
		if (uvo == null) {
			CateVO cvo = new CateVO();
			cvo.setPro_number(pro_number);
			cvo.setCate_pro_price(pro_price);
			cvo.setTotal(pro_price);
			cvo.setPro_option(pro_option);
		} else {
			int userid = uvo.getNo();
			CateVO cvo = new CateVO();

			cvo.setUser_no(userid);
			cvo.setPro_number(pro_number);
			cvo.setCate_pro_price(pro_price);
			cvo.setTotal(pro_price);
			cvo.setPro_option(pro_option);
			cservice.addcate(cvo, uvo, null);
			productService.catecountupdate(pro_number);
		}

		if (ordervo != null && uvo != null) {

		} else {

			userOrderProductVO orderProVo = new userOrderProductVO();
			userOrderVO ordervo1 = new userOrderVO();

			orderProVo.setPro_number(pro_number);
			orderProVo.setPrice(pro_price);
			orderProVo.setPro_option(pro_option);
			orderProVo.setCount(0);
			ordervo1.setPro_number(pro_number);
			ordervo1.setPrice(pro_price);

			session.setAttribute("ordervo", ordervo1);
			session.setAttribute("orderProVo", orderProVo);
			return "redirect:/users/payBeLogin";
		}
		int userid = uvo.getNo();

		ordervo.setUserNo(userid);
		ordervo.setPrice(pro_price);
		ordervo.setAddress(address);

		payService.insert(ordervo, uvo, null);

		int orderId = ordervo.getOrderId();

		userOrderProductVO orderProVo = new userOrderProductVO();
		orderProVo.setOrderId(orderId);
		orderProVo.setPro_number(pro_number);
		orderProVo.setPrice(pro_price);
		orderProVo.setPro_option(pro_option);
		orderProVo.setCount(0);

		productPayService.insert(orderProVo, uvo, null);

		model.addAttribute("onelist", productPayService.selectList(orderId));

		return "User/userPay";
	}
	
	

	@RequestMapping(value = "/cateorders", method = RequestMethod.POST)
	public String cateProcessOrder(HttpSession session, Model model, @RequestParam("pro_number") String pro_number,
			@RequestParam("totalValue") int total,@RequestParam("adr") String address) {
		UserVO uvo = (UserVO) session.getAttribute("login_info");
		int userid = uvo.getNo();
		System.out.println("占쎈�딉옙�싷옙��" + total);
		String proid = pro_number;

		userOrderVO ordervo = new userOrderVO();

		ordervo.setUserNo(userid);

		int count = ordervo.getOrderCount();
		count = 1;
		model.addAttribute(count);
		ordervo.setOrderCount(count);
		ordervo.setPrice(total);
		ordervo.setAddress(address);
		if (ordervo != null && uvo != null) {
			payService.insert(ordervo, uvo, null);
			System.out.println("orderId:" + ordervo.getOrderId());
		} else {
			System.out.println("ordervo uvo pvo == null ");
		}
		System.out.println(payService);

		int orderId = ordervo.getOrderId();

		userOrderProductVO orderProVo = new userOrderProductVO();
		orderProVo.setOrderId(orderId);
		orderProVo.setPro_number(proid);
		orderProVo.setPrice(total);
		orderProVo.setCount(count);
		orderProVo.setUserno(userid);

		productPayService.cateorderinsert(orderProVo, uvo, null);

		model.addAttribute("list", cservice.selectCateList(userid));
		model.addAttribute("orderprice", productPayService.selectList(orderId));
		System.out.println(cservice.selectCateList(userid));
		System.out.println("dddddddddddddddd : " + userid);
		return "/User/userPay";
	}
	@RequestMapping(value = "/payMypage")
	public String payMypage(Model model , HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("login_info");
		int userno = uvo.getNo();
		model.addAttribute("orders", kakaoPayApprovalService.selectlist(userno));
		model.addAttribute("orderid", kakaoPayApprovalService.selectorderid(userno));
		return "User/userPaymentList";
	}

}