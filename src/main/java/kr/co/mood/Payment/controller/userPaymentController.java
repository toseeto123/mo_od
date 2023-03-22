package kr.co.mood.Payment.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mood.Payment.VO.userOrderProductVO;
import kr.co.mood.Payment.VO.userOrderVO;
import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.cate.DAO.CateService;
import kr.co.mood.cate.vo.CateVO;
import kr.co.mood.pay.DAO.productPaymentService;
import kr.co.mood.pay.DAO.userPaymentService;
import kr.co.mood.user.dao.UserService;
import kr.co.mood.user.dao.UserVO;


@Controller
@RequestMapping("/products")
public class userPaymentController {

   
   @Autowired
   CateService cservice;
   @Autowired
   UserService userService;
   @Autowired
   userPaymentService payService;
   @Autowired
   productPaymentService productPayService;
   @Autowired
   ProductService productService;
   
   
   
   @RequestMapping(value="/orders" , method = RequestMethod.POST)
   public String processOrder(HttpSession session ,Model model, 
		   @RequestParam("pro_number") String pro_number, 
		   @RequestParam("pro_price") int pro_price,
		   @RequestParam("radioOption") String pro_option,
		   @RequestParam("address") String address,
		   RedirectAttributes redirectAttributes) {
      UserVO uvo = (UserVO)session.getAttribute("login_info");
      userOrderVO ordervo = new userOrderVO();
      
      if (ordervo != null && uvo != null ) {
    	  int userid = uvo.getNo();
          
          int price = pro_price;
          CateVO cvo = new CateVO();
          cvo.setUser_no(userid);
          cvo.setPro_number(pro_number);
          cvo.setCate_pro_price(pro_price);
          cvo.setTotal(pro_price);
          cvo.setPro_option(pro_option);
          ordervo.setUserNo(userid);
          ordervo.setPrice(price);
          ordervo.setAddress(address);
          int count = ordervo.getOrderCount();

          payService.insert(ordervo, uvo, null);
          cservice.addcate(cvo, null, null);
          System.out.println("orderId:" + ordervo.getOrderId());
      }else { 

          userOrderProductVO orderProVo = new userOrderProductVO();
          userOrderVO ordervo1 = new userOrderVO();
          
          orderProVo.setPro_number(pro_number);
          orderProVo.setPrice(pro_price);
          orderProVo.setPro_option(pro_option);
          orderProVo.setCount(0);
          ordervo1.setPro_number(pro_number);
          ordervo1.setPrice(pro_price);
          
          session.setAttribute("ordervo", ordervo1);
          session.setAttribute("orderProVo", orderProVo);
    	  return "redirect:/payBeLogin.do";
      }
      
      int orderId = ordervo.getOrderId();
      
      userOrderProductVO orderProVo = new userOrderProductVO();
      orderProVo.setOrderId(orderId);
      orderProVo.setPro_number(pro_number);
      orderProVo.setPrice(pro_price);
      orderProVo.setPro_option(pro_option);
      orderProVo.setCount(0);
      //orderProVo.setCount(count);
      //orderProVo.setPro_name(pvo.getPro_name());
      
      productPayService.insert(orderProVo, uvo, null);

      
      model.addAttribute("onelist", productPayService.selectList(orderId));
      
      
      return "User/userPay";
   }
   
   @Transactional
   @RequestMapping(value="/cateorders" , method = RequestMethod.POST)
   public String cateProcessOrder(HttpSession session ,
		   Model model,
		   @RequestParam("pro_number") String pro_number , 
		   @RequestParam("total") List<Integer> total,
		   @RequestParam("address") String address) {
      UserVO uvo = (UserVO)session.getAttribute("login_info");
      int userid = uvo.getNo();
      int sum = 0;
      for (int totals : total) {
          sum += totals;
      }
      System.out.println("�뀊�뀚�뀅"+sum);
      
      
      userOrderVO ordervo = new userOrderVO();
      

      ordervo.setUserNo(userid);

      int count =ordervo.getOrderCount();
      count = 1;
      model.addAttribute(count);
      ordervo.setOrderCount(count);
      ordervo.setPrice(sum);
      ordervo.setAddress(address);
      if (ordervo != null && uvo != null ) {
          payService.insert(ordervo, uvo, null);
          System.out.println("orderId:" + ordervo.getOrderId());
      }else {
         System.out.println("ordervo uvo pvo == null ");
      }
      
      int orderId = ordervo.getOrderId();
      
      
      userOrderProductVO orderProVo = new userOrderProductVO();
      orderProVo.setOrderId(orderId);
      orderProVo.setPro_number(pro_number);
      orderProVo.setPrice(sum);
      orderProVo.setCount(count);
      orderProVo.setUserno(userid);
      
      productPayService.cateorderinsert(orderProVo, uvo, null);
      
      model.addAttribute("list", cservice.selectCateList(userid));
      model.addAttribute("orderprice",productPayService.selectList(orderId));
      return "/User/userPay";
   }
   
   
   @RequestMapping("/User/userPay/{no}")
   public void orderPgaeGET(@PathVariable("no") String no, userOrderVO uol, Model model) {

      System.out.println("memberId : " + no);

   }

   
   // payment test
   @RequestMapping(value = "/userPay", method = RequestMethod.GET)
   public String userPay() {

      return "User/userPay";
   }


   @RequestMapping(value = "/userPaymentDetail.do")
   public String userPaymentDetail() {

      return "User/userPaymentDetail";
      
   }
}
