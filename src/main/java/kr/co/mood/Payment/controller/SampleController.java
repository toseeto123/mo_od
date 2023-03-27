package kr.co.mood.Payment.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mood.pay.DAO.KakaoPayApprovalService;

@Controller
public class SampleController {

   @Autowired
   private KakaoPay kakaopay;
   @Autowired
   private KakaoPayApprovalService kakaoPayApprovalService;
   
   
   
    @RequestMapping(value = "/kakaopay", method = RequestMethod.GET)
      public String kakaoPayGet() {

      return "User/kakaopay";
   }
   
   @RequestMapping(value = "/kakaoPay", method = RequestMethod.POST)
      public String kakaoPay(@RequestParam("pro_name") String pro_name,
    		  			 @RequestParam("userno") String userno,
                          @RequestParam("pro_price") int pro_price,
                          @RequestParam("orderId") int orderId,
                          @RequestParam("pro_number") String pro_number,
                          Model model) {
         return "redirect:" + kakaopay.kakaoPayReady(pro_name,userno,pro_price,orderId , pro_number);

      }


   @RequestMapping(value = "/User/kakaoPaySuccess" )
   public void paySuccess(@RequestParam("pg_token") String pg_token,
		   @RequestParam("orderId") int orderId,
		   @RequestParam("userno") String userno ,
		   @RequestParam("pro_number") String pro_number,
		   Model model) {
	  
      model.addAttribute("info" , kakaopay.kakaoPayInfo(pg_token,orderId,userno,pro_number));
      model.addAttribute("orders", kakaoPayApprovalService.selectlist(Integer.parseInt(userno)));
      
   }

	   
   @RequestMapping(value = "/User/kakaoPayCancel" )
   public void payCancel(Model model,
                         @RequestParam("tid") Set<String> tids,
                         @RequestParam("price") int price,
                         @RequestParam("pro_number") String pro_number,
                         @RequestParam("orderId") int orderId) {
       System.out.println(" cancel.......");
       for (String tid : tids) {
           model.addAttribute("info", kakaopay.kakaoCancel(tid, price, pro_number, orderId));
       }
   }
}
