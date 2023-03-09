package kr.co.mood.cate.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.Product.controller.ProductController;
import kr.co.mood.cate.DAO.CateService;
import kr.co.mood.cate.vo.CateVO;
import kr.co.mood.user.dao.UserService;
import kr.co.mood.user.dao.UserVO;

@Controller
public class CateController {

	@Autowired
	CateService cservice;
	UserService userService;
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductController productController;
	
	@RequestMapping(value = "/cate.do" , method = RequestMethod.GET)
	public String cate() {
		System.out.println("cate 입장이요~");
		return "cate/cate";
	}
	
	@RequestMapping(value = "/cate.do" , method = RequestMethod.POST)
	public ModelAndView selectAllList(HttpSession session , ModelAndView mav) {
		System.out.println("cate 포스트 방식 입장~");
		
		return mav;
	}
	@RequestMapping(value="/cateinsert.do" , method = RequestMethod.POST)
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
		System.out.println("cateselect 입장");
		model.addAttribute("map" , cservice.selectCateList(userid));
		
		
		return "cate/cate";
	}
	
	@RequestMapping(value="/update.do" ,method = RequestMethod.POST)
	public String update(HttpSession session , CateVO cvo , Model model) {
		UserVO uvo = (UserVO)session.getAttribute("login_info");
		int userid = uvo.getNo();
		ProVO pvo = (ProVO)session.getAttribute("pro_num");
		int proid = pvo.getPro_number();
		int count = (Integer) session.getAttribute("count");
		cvo.setUser_no(userid);
		cvo.setPro_number(proid);
		cvo.setAmount(count);
		cservice.modifyflashamount(cvo);
		System.out.println(count);
		return "cate/cate";
	}
	
	@RequestMapping(value="/minusupdate.do" ,method = RequestMethod.POST)
	public String minusupdate(HttpSession session , CateVO cvo , Model model) {
		UserVO uvo = (UserVO)session.getAttribute("login_info");
		int userid = uvo.getNo();
		ProVO pvo = (ProVO)session.getAttribute("pro_num");
		int proid = pvo.getPro_number();
		int count = (Integer) session.getAttribute("count");
		cvo.setUser_no(userid);
		cvo.setPro_number(proid);
		cvo.setAmount(count);
		cservice.modifyminusamount(cvo);
		System.out.println(count);
		return "cate/cate";
	}
	
}
