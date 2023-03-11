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
	
	@RequestMapping(value="/orders/{no}" , method = RequestMethod.GET)
	public String insertcate(@PathVariable("no") int no, HttpSession session ,Model model) {
	
		UserVO uvo = (UserVO)session.getAttribute("login_info");
		System.out.println(uvo);
		int userid = uvo.getNo();
		System.out.println(userid);
		
		ProVO pvo = (ProVO)session.getAttribute("pro_number");
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
		
		
		return "/User/userPay";
	}
	
	
	// 二쇰Ц �궡�뿭 媛��졇媛� 紐낅졊�뼱 url�쓣 �넻�빐 �쟾�떖諛쏆쓣 �쉶�썝�젙蹂� no瑜� �뙆�씪誘명꽣 �꽕�젙
	//�긽�뭹 �젙蹂� �쟾�떖諛쏆쓣 OrderListVO 洹몃━怨� pageGet�뿉�꽌 view濡� �쟾�떖�빐以� model
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
