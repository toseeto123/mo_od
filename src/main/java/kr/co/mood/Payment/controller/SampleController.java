package kr.co.mood.Payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.Setter;

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
                          @RequestParam("pro_price") int pro_price,
                          @RequestParam("orderId") int orderId,
                          Model model) {
        System.out.println("kakaopay post...以 ........");
        model.addAttribute("pro_name", pro_name);
        model.addAttribute("pro_price",pro_price);
        model.addAttribute("orderId",orderId);
         return "redirect:" + kakaopay.kakaoPayReady(pro_name,pro_price,orderId);

      }


   @RequestMapping(value = "/User/kakaoPaySuccess" )
   public void paySuccess(@RequestParam("pg_token") String pg_token, Model model) {
      System.out.println("kakaopay success......!!!!!!!! get!!!!");
      System.out.println("kakaopay success pg_token" + pg_token);

      model.addAttribute("info" , kakaopay.kakaoPayInfo(pg_token));
   }
   @RequestMapping(value = "/User/kakaoPayCancel" )
   public void payCancel(@RequestParam("pg_token") String pg_token, Model model) {
      System.out.println("kakaopay Cancel......!!!!!!!! get!!!!");
      System.out.println("kakaopay Cancel pg_token" + pg_token);

      model.addAttribute("info" , kakaopay.kakaoPayInfo(pg_token));
   }
}
