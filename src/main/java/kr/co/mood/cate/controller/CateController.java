package kr.co.mood.cate.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		System.out.println("cate �엯�옣�씠�슂~");
		return "cate/cate";
	}
	
	@RequestMapping(value = "/cate.do" , method = RequestMethod.POST)
	public ModelAndView selectAllList(HttpSession session , ModelAndView mav) {
		System.out.println("cate �룷�뒪�듃 諛⑹떇 �엯�옣~");
		
		return mav;
	}
	@RequestMapping(value="/cateinsert.do" , method = RequestMethod.POST)
	public String insertcate(HttpSession session ,Model model) {
	
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
		System.out.println("cateselect �엯�옣");
		model.addAttribute("map" , cservice.selectCateList(userid));
		
		
		return "cate/cate";
	}
	
	
	@RequestMapping(value="/update.do" ,method = RequestMethod.POST)
	public String update(@RequestBody int cate_id,HttpSession session , CateVO cvo , Model model) {
		
		UserVO uvo = (UserVO)session.getAttribute("login_info");
		int userid = uvo.getNo();
		ProVO pvo = (ProVO)session.getAttribute("pro_number");
		int proid = pvo.getPro_number();
		int count = (Integer) session.getAttribute("count");
		cvo.setUser_no(userid);
		cvo.setCate_id(cate_id);
		cvo.setAmount(count);
		cservice.modifyflashamount(cate_id);
		System.out.println("cvo : "+cvo);
		System.out.println("cate_id : "+proid);
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
		return "cate/cate";
	}
	
}
