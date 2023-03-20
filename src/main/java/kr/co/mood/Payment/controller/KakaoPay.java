package kr.co.mood.Payment.controller;

import java.net.URI;

import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import kr.co.mood.Payment.VO.KakaoPayApprovalVO;
import kr.co.mood.Payment.VO.KakaoPayReadyVO;
import kr.co.mood.cate.DAO.CateService;
import kr.co.mood.cate.vo.CateVO;
import kr.co.mood.pay.DAO.KakaoPayApprovalService;
@ResponseBody
@Controller
public class KakaoPay {
	
	


   @Autowired
   private CateService cartservice;
   @Autowired
   KakaoPayApprovalService kservice;
       
       private static final String HOST = "https://kapi.kakao.com";
       
       private KakaoPayReadyVO kakaoPayReadyVO;
       private KakaoPayApprovalVO kakaoPayApprovalVO;

       

       public String kakaoPayReady(
    		   @RequestParam("orderId") int orderId,
    		   @RequestParam("userNo") int userNo,
    		   @RequestParam("pro_name") String pro_name,
    		   @RequestParam("pro_price") int pro_price) {
    	   
    	   

    
           RestTemplate restTemplate = new RestTemplate();

           //  뜝 럡 맋 뵓怨뚯뫊餓    뜝 럩 뭵嶺뚳퐦 삕 뜝 럥留  Header
           HttpHeaders headers = new HttpHeaders();
           headers.add("Authorization", "KakaoAK " + "1310fb3a979458e032a8aecca6d5e96c");
           headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
           headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
           
          
           String pro_pricestr = Integer.toString(pro_price);
           String orderIdstr = Integer.toString(orderId);
           String userNostr = Integer.toString(userNo);
           
           
           //  뜝 럡 맋 뵓怨뚯뫊餓    뜝 럩 뭵嶺뚳퐦 삕 뜝 럥留  Body
           MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
           params.add("cid", "TC0ONETIME");
           params.add("partner_order_id", orderIdstr);
           params.add("partner_user_id", userNostr);
           params.add("item_name", "pro_name");
           params.add("quantity", "1");
           params.add("total_amount", pro_pricestr);
           params.add("tax_free_amount", "100");
           params.add("approval_url", "http://localhost:8080/User/kakaoPaySuccess");
           params.add("cancel_url", "http://localhost:8080/User/kakaoPayCancel");
           params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail");
           System.out.println(params);
            HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
    
           try {
               kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
               CateVO cvo = new CateVO();

               return kakaoPayReadyVO.getNext_redirect_pc_url();
    
           } catch (RestClientException e) {
               e.printStackTrace();
           } catch (URISyntaxException e) {
               e.printStackTrace();
           }
           
           return "/pay";
           
       }
       
       
       @RequestMapping(value = "/kakaoPayInfo" ,method = RequestMethod.POST)
       public KakaoPayApprovalVO kakaoPayInfo(@RequestBody List<Map<String, Object>> dataList,String pg_token,HttpServletRequest request) {
    
          System.out.println("KakaoPayInfoVO............................................");
          System.out.println("-----------------------------");
          Map<String, Object> resultMap = new HashMap<>();
          String orderIdstr = request.getParameter("orderId");
          String userNostr = request.getParameter("userNo");
           
           RestTemplate restTemplate = new RestTemplate();
           //  뜝 럡 맋 뵓怨뚯뫊餓    뜝 럩 뭵嶺뚳퐦 삕 뜝 럥留  Header
           HttpHeaders headers = new HttpHeaders();
           headers.add("Authorization", "KakaoAK " + "1310fb3a979458e032a8aecca6d5e96c");
           headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
           headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
           
           //  뜝 럡 맋 뵓怨뚯뫊餓    뜝 럩 뭵嶺뚳퐦 삕 뜝 럥留  Body
           MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
           
           params.add("cid", "TC0ONETIME");
           params.add("quantity", "1");
           params.add("tid", kakaoPayReadyVO.getTid());
           params.add("partner_order_id", orderIdstr);
           params.add("partner_user_id", userNostr);
           params.add("item_name", "pro_name");
           params.add("tax_free_amount", "100");
           params.add("pg_token", pg_token);

           
           HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
           
           try {
               kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
               System.out.println("" + kakaoPayApprovalVO);
               
               kservice.paymentinsert(kakaoPayApprovalVO);
               return kakaoPayApprovalVO;
           
           } catch (RestClientException e) {
               e.printStackTrace();
           } catch (URISyntaxException e) {
               e.printStackTrace();
           }
           
      return null;

       }
       
   }