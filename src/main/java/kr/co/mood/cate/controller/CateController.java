package kr.co.mood.cate.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		
		return "cate/cate";
	}
	@RequestMapping(value="/cate.do" , method =RequestMethod.POST)
	public String selectAllList() {
		
		
		return "cate/cate";
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
		cvo.setUser_no(userid);
		cvo.setPro_number(proid);
		
		cservice.addcate(cvo, uvo, pvo);
		
		return "cate/cate";
	}
	
	
	
}
