package kr.co.mood.cate.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
		System.out.println("cate");
		return "cate/cate";
	}
	
	@RequestMapping(value = "/cate.do" , method = RequestMethod.POST)
	public ModelAndView selectAllList(HttpSession session , ModelAndView mav) {
		System.out.println("cat");
		
		return mav;
	}
	@RequestMapping(value="/cateinsert.do" , method = RequestMethod.POST)
	public String insertcate(HttpSession session, Model model, @RequestParam("pro_price") int pro_price,@RequestParam("radioOption") String pro_option) {
	    UserVO uvo = (UserVO) session.getAttribute("login_info");
	    int userid = uvo.getNo();
	    ProVO pvo = (ProVO) session.getAttribute("pro_number");
	    System.out.println(pvo);
	    int proid = pvo.getPro_number();

	    CateVO cvo = new CateVO();
	    int count = cvo.getAmount();
	    cvo.setUser_no(userid);
	    cvo.setPro_number(proid);
	    cvo.setCate_pro_price(pro_price);
	    cvo.setTotal(pro_price);
	    cvo.setPro_option(pro_option);
	    cservice.addcate(cvo, uvo, pvo);
	    int cate_id = cvo.getCate_id();

	    // 중복 insert 방지를 위해 세션에서 pro_number 속성을 제거합니다.
	    session.removeAttribute("pro_number");

	    // POST 요청 처리 후 리다이렉트를 반환합니다.
	    return "redirect:/cate";
	}

	@RequestMapping(value = "/cate", method = RequestMethod.GET)
	public String showCateList(HttpSession session, Model model) {
	    UserVO uvo = (UserVO) session.getAttribute("login_info");
	    int userid = uvo.getNo();
	    
	    // 중복 insert를 방지하기 위해 cate_id가 null이 아닌 항목만 조회합니다.
	    model.addAttribute("map", cservice.selectCateList(userid));
	    return "/cate/cate";
	}
	
	
	

	
	
	
	@RequestMapping(value = "/plus.do", method = RequestMethod.POST)
	public String update(HttpSession session, @RequestBody Map<String, Object> data, Model model, CateVO cvo) {
		int number = Integer.parseInt(String.valueOf(data.get("number")));
		int cateId = Integer.parseInt(String.valueOf(data.get("cateId")));
		int proprice = Integer.parseInt(String.valueOf(data.get("proprice")));
		
	    //int count = (Integer) session.getAttribute("count");
	    
	    //cvo.setAmount(count);
	    
	    cservice.modifyflashamount(cateId);
	    
	    return "/cate/cate";
	}
	
	@RequestMapping(value = "/minus.do", method = RequestMethod.POST)
	public String minus(HttpSession session, @RequestBody Map<String, Object> data, Model model, CateVO cvo) {
		int number = Integer.parseInt(String.valueOf(data.get("number")));
		int cateId = Integer.parseInt(String.valueOf(data.get("cateId")));

	    cservice.modifyminusamount(cateId);
	    
	    return "/cate/cate";
	}
	
	
	@RequestMapping(value = "/mycate.do", method = RequestMethod.GET)
	public String mycate(HttpSession session, Model model) {
		UserVO uvo = (UserVO) session.getAttribute("login_info");
		System.out.println(uvo);
		int userid = uvo.getNo();
		System.out.println(userid);
		model.addAttribute("map", cservice.selectCateList(userid));
		return "/User/my_cateinfo";
	}

	@RequestMapping(value = "/catedelete.do", method = RequestMethod.POST)
	public String deleteCate(HttpSession session, @RequestBody Map<String, Object> data, Model model, CateVO cvo) {
		System.out.println("delete 실행 완료");
		int number = Integer.parseInt(String.valueOf(data.get("number")));
		int cateId = Integer.parseInt(String.valueOf(data.get("cateId")));

		cservice.deletecate(cateId);
		return "cate/cate";
	}
	
}