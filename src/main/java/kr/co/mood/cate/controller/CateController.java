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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.controller.ProductController;
import kr.co.mood.cate.DAO.CateService;
import kr.co.mood.cate.vo.CateVO;
import kr.co.mood.user.dao.UserService;
import kr.co.mood.user.dao.UserVO;


@RequestMapping("/users")
@Controller
public class CateController {


	@Autowired
	CateService cservice;
	UserService userService;
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductController productController;
	
	public String cate(HttpSession session, RedirectAttributes rttr) {
		
		UserVO uvo = (UserVO) session.getAttribute("login_info");
		
		if(uvo==null) {
			 rttr.addFlashAttribute("msg", "loginmsg");
			 return "redirect:login.do";
		}
		else {
			return "bucket/bucket";
		}
	}
	
	@RequestMapping(value = "/cate" , method = RequestMethod.POST)
	public ModelAndView selectAllList(HttpSession session , ModelAndView mav) {
		
		return mav;
	}

	@RequestMapping(value="/cateinsert" , method = RequestMethod.POST)
	public String insertcate(HttpSession session, @RequestParam("pro_number") String pro_number,
	                         @RequestParam("pro_price") int pro_price, @RequestParam("radioOption") String pro_option,
	                         RedirectAttributes redirectAttributes) {
	    UserVO uvo = (UserVO) session.getAttribute("login_info");
	    if(uvo==null) {
	        CateVO cvo = new CateVO();
	        cvo.setPro_number(pro_number);
	        cvo.setCate_pro_price(pro_price);
	        cvo.setTotal(pro_price);
	        cvo.setPro_option(pro_option);
	        redirectAttributes.addFlashAttribute("cvo", cvo);
	        return "redirect:/proCatelogin.do";
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
       return "redirect:/users/bucket";
	   }
   }

   @RequestMapping(value = "/bucket", method = RequestMethod.GET)
   public String showCateList(HttpSession session, Model model) {
       UserVO uvo = (UserVO) session.getAttribute("login_info");
       int userid = uvo.getNo();
       model.addAttribute("map", cservice.selectCateList(userid));
       return "/bucket/bucket";
   }
   
   @RequestMapping(value = "/beLoginCate", method = RequestMethod.GET)
   public String beLoginCate(HttpSession session, Model model) {
       UserVO uvo = (UserVO) session.getAttribute("login_info");
       

       return "/bucket/bucket";
   }
   
   
   
   @RequestMapping(value = "/plus", method = RequestMethod.POST)
   public String update(HttpSession session, @RequestBody Map<String, Object> data, Model model, CateVO cvo) {
      int cateId = Integer.parseInt(String.valueOf(data.get("cateId")));
      
       cservice.modifyflashamount(cateId);
       
       return "/bucket/bucket";
   }
   
   @RequestMapping(value = "/minus", method = RequestMethod.POST)
   public String minus(HttpSession session, @RequestBody Map<String, Object> data, Model model, CateVO cvo) {
      int cateId = Integer.parseInt(String.valueOf(data.get("cateId")));

       cservice.modifyminusamount(cateId);
       
       return "/bucket/bucket";
   }
   
   @RequestMapping(value = "/catedelete", method = RequestMethod.POST)
   public String deleteCate(HttpSession session, @RequestBody Map<String, Object> data, Model model, CateVO cvo) {
      int cateId = Integer.parseInt(String.valueOf(data.get("cateId")));

      cservice.deletecate(cateId);
      return "bucket/bucket";
   }
   
}