package kr.co.mood.Payment.controller;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import kr.co.mood.Payment.VO.KakaoCancelResponseVO;
import kr.co.mood.Payment.VO.KakaoPayApprovalVO;
import kr.co.mood.Payment.VO.KakaoPayReadyVO;
import kr.co.mood.cate.DAO.CateService;
import kr.co.mood.pay.DAO.KakaoPayApprovalService;


@Controller
public class KakaoPay {


   @Autowired
   private CateService cartservice;
   @Autowired
   KakaoPayApprovalService kservice;
       
       private static final String HOST = "https://kapi.kakao.com";
       
       private KakaoPayReadyVO kakaoPayReadyVO;
       private KakaoPayApprovalVO kakaoPayApprovalVO;
       

       public String kakaoPayReady(@RequestParam("pro_name") String pro_name,
    		   @RequestParam("userno") String userno,
    		   @RequestParam("pro_price") int pro_price,
    		   @RequestParam("orderId") int orderId,
    		   @RequestParam("pro_number") String pro_number
    		   ) {

    
           RestTemplate restTemplate = new RestTemplate();

           HttpHeaders headers = new HttpHeaders();
           headers.add("Authorization", "KakaoAK " + "1310fb3a979458e032a8aecca6d5e96c");
           headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
           headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
           
          
           String pro_pricestr = Integer.toString(pro_price);
           String orderIdstr = Integer.toString(orderId);
           MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
           params.add("cid", "TC0ONETIME");
           params.add("partner_order_id", orderIdstr);
           params.add("partner_user_id", userno);
           params.add("item_name", pro_name);
           params.add("quantity", "1");
           params.add("total_amount", pro_pricestr);
           
           params.add("tax_free_amount", "100");

           params.add("approval_url", "http://localhost:8080/User/kakaoPaySuccess?orderId=" + orderIdstr + "&userno=" + userno + "&pro_number="+ pro_number);
           params.add("cancel_url", "http://localhost:8080/User/kakaoPayCancel?");
           params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail");
          // params.add("approval_url", "http://3.39.221.200:8080/User/kakaoPaySuccess?orderId=" + orderIdstr + "&userno=" + userno + "&pro_number="+ pro_number);
           //params.add("cancel_url", "http://3.39.221.200:8080/User/kakaoPayCancel?");
           //params.add("fail_url", "http://3.39.221.200:8080/kakaoPaySuccessFail");

            HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
    
           try {
               kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
               return kakaoPayReadyVO.getNext_redirect_pc_url();
               
    
           } catch (RestClientException e) {
               e.printStackTrace();
           } catch (URISyntaxException e) {
               e.printStackTrace();
           }
           return "/pay";
           
       }
       
       @Transactional
       public KakaoPayApprovalVO kakaoPayInfo(@RequestParam("pg_token")String pg_token,
    		   								  @RequestParam("orderId") int orderId,
    		   								@RequestParam("userno") String userno,
    		   								@RequestParam("pro_number") String pro_number) {
    
           RestTemplate restTemplate = new RestTemplate();
           String orderIdstr = Integer.toString(orderId);
           HttpHeaders headers = new HttpHeaders();
           headers.add("Authorization", "KakaoAK " + "1310fb3a979458e032a8aecca6d5e96c");
           headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
           headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
           
           MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
           params.add("cid", "TC0ONETIME");
           params.add("tid", kakaoPayReadyVO.getTid());
           params.add("partner_order_id", orderIdstr);
           params.add("partner_user_id",userno);
           params.add("pg_token", pg_token);
           
           HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
           try {
        	    kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
        	    kservice.paymentinsert(kakaoPayApprovalVO);
        	    kservice.paysuccessupdate(pro_number); 
        	    kservice.paysuccessdelete(userno);
        	    return kakaoPayApprovalVO;
        	} catch (RestClientException e) {
        	    e.printStackTrace();
        	} catch (URISyntaxException e) {
        	    e.printStackTrace();
        	} catch (Exception e) {
        	    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        	    e.printStackTrace();
        	}
           
      return kakaoPayApprovalVO;

       }
       public KakaoCancelResponseVO kakaoCancel(@RequestParam("tid") String tid
    		   ,@RequestParam("price") int price,
    		   @RequestParam("pro_number") String pro_number,
    		   @RequestParam("orderId") int orderId
    		   ) {
    	   String total = Integer.toString(price);
    	   Integer orderidchk = orderId;
           HttpHeaders headers = new HttpHeaders();
           headers.add("Authorization", "KakaoAK " + "1310fb3a979458e032a8aecca6d5e96c");
           headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
           headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
           
           // 燁삳똻萸낉옙�궎占쎈읂占쎌뵠 占쎌뒄筌ｏ옙
           MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
           params.add("cid", "TC0ONETIME");
           params.add("tid", tid);
           params.add("cancel_amount", total);
           params.add("cancel_tax_free_amount", "100");
           System.out.println(params);
           // 占쎈솁占쎌뵬沃섎챸苑�, 占쎈엘占쎈쐭
           HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(params, headers);
       
           // 占쎌뇚�겫占쏙옙肉� 癰귣�沅� url
           RestTemplate restTemplate = new RestTemplate();
       
           KakaoCancelResponseVO cancelResponse = restTemplate.postForObject(
                   "https://kapi.kakao.com/v1/payment/cancel",
                   requestEntity,
                   KakaoCancelResponseVO.class);

			kservice.paycancelDelete(orderId);

			kservice.paySuccessStatusUpdate(orderId);
           return cancelResponse;
       }
       
       
       
   }