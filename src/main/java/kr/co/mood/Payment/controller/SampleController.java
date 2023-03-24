package kr.co.mood.Payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mood.Payment.VO.KakaoCancelResponseVO;

@Controller
public class SampleController {

   @Autowired
    private KakaoPay kakaopay;
   
   
   
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
   }

	   
   @RequestMapping(value = "/User/kakaoPayCancel" )
   public void payCancel(Model model,@RequestParam("tid") String tid,@RequestParam("price") String price) {
	   System.out.println(" ĵ�� ���� ��� ������");

      model.addAttribute("info" , kakaopay.kakaoCancel(tid,price));
   }
}
