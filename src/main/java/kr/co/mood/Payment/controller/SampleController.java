package kr.co.mood.Payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SampleController {


   
   @Autowired
   private KakaoPay kakaopay;
   
    @RequestMapping(value = "/kakaopay", method = RequestMethod.GET)
      public String kakaoPayGet() {

      return "User/kakaopay";
   }
   
   @RequestMapping(value = "/kakaoPay", method = RequestMethod.POST)
      public String kakaoPay() {
        System.out.println("kakaopay post...餓� ........");

         return "redirect:" + kakaopay.kakaoPayReady();
      }


   @RequestMapping(value = "/User/kakaoPaySuccess" )
   public void paySuccess(@RequestParam String pg_token, Model model) {
      System.out.println("kakaopay success......!!!!!!!! get!!!!");
      System.out.println("kakaopay success pg_token" + pg_token);
      model.addAttribute("info" , kakaopay.kakaoPayInfo(pg_token));
   }
   @RequestMapping(value = "/User/kakaoPayCancel" )
   public void payCancel(@RequestParam String pg_token, Model model) {
      System.out.println("kakaopay Cancel......!!!!!!!! get!!!!");
      System.out.println("kakaopay Cancel pg_token" + pg_token);
      model.addAttribute("info" , kakaopay.kakaoPayInfo(pg_token));
   }
}

