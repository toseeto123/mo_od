package kr.co.mood.cate.controller;

import java.util.Map;

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
		System.out.println("cate");
		return "cate/cate";
	}
	
	@RequestMapping(value = "/cate.do" , method = RequestMethod.POST)
	public ModelAndView selectAllList(HttpSession session , ModelAndView mav) {
		System.out.println("cat");
		
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
	
	
	@RequestMapping(value = "/plus.do", method = RequestMethod.POST)
	public String update(HttpSession session, @RequestBody Map<String, Object> data, Model model, CateVO cvo) {
		int number = Integer.parseInt(String.valueOf(data.get("number")));
		int cateId = Integer.parseInt(String.valueOf(data.get("cateId")));
	    

	    int count = (Integer) session.getAttribute("count");
	    cvo.setAmount(count);
	    cservice.modifyflashamount(cateId);

	    return "/cate/cate";
	}
	
	@RequestMapping(value = "/minus.do", method = RequestMethod.POST)
	public String minus(HttpSession session, @RequestBody Map<String, Object> data, Model model, CateVO cvo) {
		int number = Integer.parseInt(String.valueOf(data.get("number")));
		int cateId = Integer.parseInt(String.valueOf(data.get("cateId")));
	    

	    int count = (Integer) session.getAttribute("count");
	    cvo.setAmount(count);
	    cservice.modifyminusamount(cateId);

	    return "/cate/cate";
	}
	
}
