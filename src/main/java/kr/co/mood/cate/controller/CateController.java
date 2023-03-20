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
			 System.out.println("null占쎌뵠占쎈튊");
			 rttr.addFlashAttribute("msg", "loginmsg");
			 return "redirect:login.do";
		}
		else {
			System.out.println("占쎌뵠占쎈짗!");
			return "cate/cate";
		}
	}
	
	@RequestMapping(value = "/cate.do" , method = RequestMethod.POST)
	public ModelAndView selectAllList(HttpSession session , ModelAndView mav) {
		System.out.println("cat");
		
		return mav;
	}

   @RequestMapping(value="/cateinsert.do" , method = RequestMethod.POST)
   public String insertcate(HttpSession session, Model model, @RequestParam("pro_number") String pro_number,@RequestParam("pro_price") int pro_price,@RequestParam("radioOption") String pro_option) {
       System.out.println("燁삳똾�뱜占쎌뵥占쎄퐣占쎈뱜占쏙옙占쎈쑅!");
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
       productService.catecountupdate(pro_number);
       return "redirect:/cate";
	   }
   }

   @RequestMapping(value = "/cate", method = RequestMethod.GET)
   public String showCateList(HttpSession session, Model model) {
       UserVO uvo = (UserVO) session.getAttribute("login_info");
       int userid = uvo.getNo();
       
       // 繞벿살탮占쎄텢 insert占쎈ご�뜝占� �뛾�렮維쀥뜝�룞�삕�뇡占썹뼨�먯삕 �뜝�럩留꾢뜝�럥�돵 cate_id�뤆�룊�삕 null�뜝�럩逾� �뜝�럥�닡�뜝�럥鍮� �뜝�럥�돫嶺뚮ㅄ維뽩퐲占� �댖怨뚰�э옙�뤂�뜝�럥占썲뜝�럥鍮띶뜝�럥堉�.
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
      System.out.println("delete �뜝�럥堉꾢뜝�럥六� �뜝�럩�걦占쎈쇀�뜝占�");
      int number = Integer.parseInt(String.valueOf(data.get("number")));
      int cateId = Integer.parseInt(String.valueOf(data.get("cateId")));

      cservice.deletecate(cateId);
      return "cate/cate";
   }
   
}