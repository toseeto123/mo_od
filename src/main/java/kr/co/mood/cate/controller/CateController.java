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
		System.out.println("cate");
		
		if(uvo==null) {
			 System.out.println("null�씠�빞");
			 rttr.addFlashAttribute("msg", "loginmsg");
			 return "redirect:login.do";
		}
		else {
			System.out.println("�씠�룞!");
			return "cate/cate";
		}
	}
	
	@RequestMapping(value = "/cate.do" , method = RequestMethod.POST)
	public ModelAndView selectAllList(HttpSession session , ModelAndView mav) {
		System.out.println("cat");
		
		return mav;
	}

   @RequestMapping(value="/cateinsert.do" , method = RequestMethod.POST)
   public String insertcate(HttpSession session, Model model, @RequestParam("pro_number") int pro_number,@RequestParam("pro_price") int pro_price,@RequestParam("radioOption") String pro_option) {
       System.out.println("移댄듃�씤�꽌�듃���뜥!");
	   UserVO uvo = (UserVO) session.getAttribute("login_info");	
	   if(uvo==null) {
		   return "redirect:/login.do";
	   } else {
       int userid = uvo.getNo();
       CateVO cvo = new CateVO();
     
       cvo.setUser_no(userid);
       cvo.setPro_number(pro_number);
       cvo.setCate_pro_price(pro_price);
       cvo.setTotal(pro_price);
       cvo.setPro_option(pro_option);
       cservice.addcate(cvo, uvo, null);
       return "redirect:/cate";
	   }
   }

   @RequestMapping(value = "/cate", method = RequestMethod.GET)
   public String showCateList(HttpSession session, Model model) {
       UserVO uvo = (UserVO) session.getAttribute("login_info");
       int userid = uvo.getNo();
       
       // 餓λ쵎�궗 insert�몴占� 獄쎻뫗占쏙옙釉�疫뀐옙 占쎌맄占쎈퉸 cate_id揶쏉옙 null占쎌뵠 占쎈툡占쎈빒 占쎈퉮筌뤴뫖彛� 鈺곌퀬�돳占쎈�占쎈빍占쎈뼄.
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
      System.out.println("delete 占쎈뼄占쎈뻬 占쎌끏�뙴占�");
      int number = Integer.parseInt(String.valueOf(data.get("number")));
      int cateId = Integer.parseInt(String.valueOf(data.get("cateId")));

      cservice.deletecate(cateId);
      return "cate/cate";
   }
   
}