package kr.co.mood.Payment.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import kr.co.mood.Payment.VO.userOrderListVO;
import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.cate.DAO.CateService;
import kr.co.mood.cate.vo.CateVO;
import kr.co.mood.user.dao.UserService;
import kr.co.mood.user.dao.UserVO;


@Controller
public class userPaymentController {

	
	@Autowired
	CateService cservice;
	UserService userService;
	@Autowired
	ProductService productService;
	
	@RequestMapping(value="/userPay" , method = RequestMethod.POST)
	public String insertcate(HttpSession session ,Model model) {
	
		UserVO uvo = (UserVO)session.getAttribute("login_info");
		System.out.println(uvo);
		int userid = uvo.getNo();
		System.out.println(userid);
		
		ProVO pvo = (ProVO)session.getAttribute("pro_num");
		System.out.println(pvo);
		int proid = pvo.getPro_number();
		System.out.println(proid);
		
		
		
		CateVO cvo = new CateVO();
		int count = cvo.getAmount();
		count = 1;
		session.setAttribute("count", count);
		cvo.setUser_no(userid);
		cvo.setPro_number(proid);
		cvo.setAmount(count);
		cservice.addcate(cvo, uvo, pvo);
		
		
		//select
		System.out.println("userPay");
		model.addAttribute("map" , cservice.selectCateList(userid));
		
		
		return "User/userPay";
	}
	
	
	// 주문 내역 가져갈 명령어 url을 통해 전달받을 회원정보 no를 파라미터 설정
	//상품 정보 전달받을 OrderListVO 그리고 pageGet에서 view로 전달해줄 model
	@RequestMapping("/User/userPay/{no}")
	public void orderPgaeGET(@PathVariable("no") String no, userOrderListVO uol, Model model) {

		System.out.println("memberId : " + no);
		System.out.println("orders : " + uol.getOrders());

	}

	
	// payment test
	@RequestMapping(value = "/userPay", method = RequestMethod.GET)
	public String userPay() {

		return "User/userPay";
	}

	// 결제 리스트
	@RequestMapping(value = "/userPaymentList.do")
	public String userPaymentList() {

		return "User/userPaymentList";
	}

	// 결제 상세
	@RequestMapping(value = "/userPaymentDetail.do")
	public String userPaymentDetail() {

		return "User/userPaymentDetail";
	}
}
