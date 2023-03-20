package kr.co.mood.Payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
                          @RequestParam("userNo") int userNo,
                          Model model) {
        System.out.println("kakaopay post...以 ........");
        model.addAttribute("pro_name", pro_name);
        model.addAttribute("pro_price",pro_price);
        model.addAttribute("orderId",orderId);
        model.addAttribute("userNo",userNo);
         return "redirect:" + kakaopay.kakaoPayReady(orderId,userNo,pro_name,pro_price);

      }
   
   


   @RequestMapping(value = "/User/kakaoPaySuccess" ,method = RequestMethod.POST)
   public void paySuccess(@RequestBody List<Map<String, Object>> dataList,String pg_token,HttpServletRequest request,Model model) {
      System.out.println("kakaopay success......!!!!!!!! get!!!!");
      System.out.println("kakaopay success pg_token" + pg_token);
      Map<String, Object> resultMap = new HashMap<>();
      String orderIdstr = request.getParameter("orderId");
      String userNostr = request.getParameter("userNo");

      model.addAttribute("info" , kakaopay.kakaoPayInfo(dataList,pg_token,request));
   }
   @RequestMapping(value = "/User/kakaoPayCancel" ,method = RequestMethod.POST)
   public void payCancel(@RequestBody List<Map<String, Object>> dataList,String pg_token,HttpServletRequest request,Model model) {
      System.out.println("kakaopay Cancel......!!!!!!!! get!!!!");
      System.out.println("kakaopay Cancel pg_token" + pg_token);

      model.addAttribute("info" , kakaopay.kakaoPayInfo(dataList,pg_token,request));
   }
}
