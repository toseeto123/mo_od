package kr.co.mood.Payment.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		   @RequestParam("pro_number") int pro_number, 
		   @RequestParam("pro_price") int pro_price,
		   @RequestParam("radioOption") String pro_option,
		   RedirectAttributes redirectAttributes) {
      UserVO uvo = (UserVO)session.getAttribute("login_info");
      System.out.println("옵션 : "+pro_option);
      userOrderVO ordervo = new userOrderVO();

      
      if (ordervo != null && uvo != null ) {
    	  int userid = uvo.getNo();
          
          int proid = pro_number;
          int price = pro_price;
      
          System.out.println(ordervo);
          //�뜝�럩�젧�솻洹⑥삕 �뜝�럩沅롥뜝�럥�맠�뜝�럥 誘��삕 逾� �눀�겫�슜�뱺 �뜝�럥堉뽫뼨�먯삕
          ordervo.setUserNo(userid);
          ordervo.setPrice(price);
          //ordervo.setPro_number(proid);
          int count = ordervo.getOrderCount();

          payService.insert(ordervo, uvo, null);
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
      System.out.println(payService);
      
      
      
      // 逾� �봾裕욃뜝�럥諭� �뜝�룞�삕�뜝�럥六� orderProduct�뜝�럥�뱺 return�뜝�럩�쐩 insert �뜝�럥�돵�뜝�럥�뒍�뜝�럥留�
      // �뜝�럡留믣뜝�럥   �뤆�룊�삕�뜝�럥�빢�뜝�럥裕� �뜝�럩逾у뜝�럥堉� �뛾�룇瑗� 寃ュ뜝�럥�뵹嶺뚮〕�삕  鍮딃겫�룞�삕�뜝�럥由��뜝�럥裕됪ㅀ袁⑥굡餓�  �뜝�럥�돵�솻洹�  裕됪ㅀ袁⑥굡餓� .
      //Map<String, String> params = new HashMap<String,String>();
      //params.put("orderId", "orderId");
      //System.out.println(params.get("orderId"));
      
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
   
   
   @RequestMapping(value="/cateorders" , method = RequestMethod.POST)
   public String cateProcessOrder(HttpSession session ,Model model, @RequestParam("pro_number") int pro_number , @RequestParam("total") List<Integer> total) {
      UserVO uvo = (UserVO)session.getAttribute("login_info");
      int userid = uvo.getNo();
      int sum = 0;
      for (int totals : total) {
          sum += totals;
      }
      System.out.println("�뀊�뀚�뀅"+sum);
      int proid = pro_number;
      
      
      userOrderVO ordervo = new userOrderVO();
      

      ordervo.setUserNo(userid);

      int count =ordervo.getOrderCount();
      count = 1;
      model.addAttribute(count);
      ordervo.setOrderCount(count);
      ordervo.setPrice(sum);
      if (ordervo != null && uvo != null ) {
          payService.insert(ordervo, uvo, null);
          System.out.println("orderId:" + ordervo.getOrderId());
      }else {
         System.out.println("ordervo uvo pvo == null ");
      }
      System.out.println(payService);
      
      int orderId = ordervo.getOrderId();
      
      
      userOrderProductVO orderProVo = new userOrderProductVO();
      orderProVo.setOrderId(orderId);
      orderProVo.setPro_number(proid);
      orderProVo.setPrice(sum);
      orderProVo.setCount(count);
      orderProVo.setUserno(userid);
      
      productPayService.cateorderinsert(orderProVo, uvo, null);
      
      model.addAttribute("list", cservice.selectCateList(userid));
      model.addAttribute("orderprice",productPayService.selectList(orderId));
      System.out.println(cservice.selectCateList(userid));
      System.out.println("dddddddddddddddd : "+ userid);
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