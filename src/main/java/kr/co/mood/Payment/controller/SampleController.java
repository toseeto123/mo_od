package kr.co.mood.Payment.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mood.Payment.VO.KakaoPayApprovalVO;
import kr.co.mood.pay.DAO.KakaoPayApprovalService;

@Controller
public class SampleController {

   @Autowired
   private KakaoPay kakaopay;
   @Autowired
   private KakaoPayApprovalService kakaoPayApprovalService;

   
   private KakaoPayApprovalVO kakaoPayApprovalVO;
   
   
   
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
      model.addAttribute("orders", kakaoPayApprovalService.selectsuccesslist(orderId));
      
   }
   
   @RequestMapping(value = "/User/kakaoPayCancelChk")
   public String payCancelChk(Model model,
                               @RequestParam("tid") Set<String> tids,
                               @RequestParam("price") int price,
                               @RequestParam("pro_number") String pro_number,
                               @RequestParam("orderId") int orderId, HttpServletResponse response, HttpServletRequest request) {
       List<KakaoPayApprovalVO> approvalList = kakaoPayApprovalService.selectsuccesslist(orderId);
       for (KakaoPayApprovalVO approval : approvalList) {
           if (approval.getSuccess().equals("구매 확정")) {
               // 성공한 결제 중에서 구매 확정이 된 건이 있으면, 경고 메시지를 저장하고 payMypage.jsp로 리다이렉트합니다.
               request.getSession().setAttribute("alertMessage", "결제취소불가");
               return "redirect:/products/payMypage";
           } else {
               // 구매 확정이 아닌 건에 대해서만 결제 취소를 처리합니다.
               payCancel(model, tids, price, pro_number, orderId, response);
               return "/User/kakaoPayCancel";
           }
       }
       return "/User/kakaoPayCancel";
   }

   @RequestMapping(value = "/User/kakaoPayCancel")
   public void payCancel(Model model, Set<String> tids, int price, String pro_number, int orderId, HttpServletResponse response) {

       for (String tid : tids) {
           model.addAttribute("info", kakaopay.kakaoCancel(tid, price, pro_number, orderId));
       }
   }
}
