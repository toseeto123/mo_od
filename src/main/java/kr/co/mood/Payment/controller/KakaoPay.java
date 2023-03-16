package kr.co.mood.Payment.controller;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import kr.co.mood.Payment.VO.KakaoPayApprovalVO;
import kr.co.mood.Payment.VO.KakaoPayReadyVO;
import kr.co.mood.cate.DAO.CateService;
import kr.co.mood.cate.vo.CateVO;
import kr.co.mood.user.dao.UserVO;

@Controller
public class KakaoPay {


   @Autowired
   private CateService cartservice;
   
       
       private static final String HOST = "https://kapi.kakao.com";
       
       private KakaoPayReadyVO kakaoPayReadyVO;
       private KakaoPayApprovalVO kakaoPayApprovalVO;
       
       public String kakaoPayReady() {
    
           RestTemplate restTemplate = new RestTemplate();
    
           // 占쎄퐣甕곌쑬以  占쎌뒄筌ｏ옙占쎈막 Header
           HttpHeaders headers = new HttpHeaders();
           headers.add("Authorization", "KakaoAK " + "1310fb3a979458e032a8aecca6d5e96c");
           headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
           headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
           
           
           
           // 占쎄퐣甕곌쑬以  占쎌뒄筌ｏ옙占쎈막 Body
           MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
           params.add("cid", "TC0ONETIME");
           params.add("partner_order_id", "1001");
           params.add("partner_user_id", "gorany");
           params.add("item_name","갤럭시S9");
           params.add("quantity", "1");
           params.add("total_amount", "2100");
           params.add("tax_free_amount", "100");
           params.add("approval_url", "http://localhost:8080/User/kakaoPaySuccess");
           params.add("cancel_url", "http://localhost:8080/User/kakaoPayCancel");
           params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail");
    
            HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
    
           try {
               kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
               
               System.out.println("" + kakaoPayReadyVO);
               
               return kakaoPayReadyVO.getNext_redirect_pc_url();
    
           } catch (RestClientException e) {
               e.printStackTrace();
           } catch (URISyntaxException e) {
               e.printStackTrace();
           }
           
           return "/pay";
           
       }
       
       public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
    
          System.out.println("KakaoPayInfoVO............................................");
          System.out.println("-----------------------------");
           
           RestTemplate restTemplate = new RestTemplate();
    
           // 占쎄퐣甕곌쑬以  占쎌뒄筌ｏ옙占쎈막 Header
           HttpHeaders headers = new HttpHeaders();
           headers.add("Authorization", "KakaoAK " + "1310fb3a979458e032a8aecca6d5e96c");
           headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
           headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
    
           // 占쎄퐣甕곌쑬以  占쎌뒄筌ｏ옙占쎈막 Body
           MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
           params.add("cid", "TC0ONETIME");
           params.add("tid", kakaoPayReadyVO.getTid());
           params.add("partner_order_id", "1001");
           params.add("partner_user_id", "gorany");
           params.add("pg_token", pg_token);
           params.add("total_amount", "2100");
           
           HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
           
           try {
               kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
               System.out.println("" + kakaoPayApprovalVO);
             
               return kakaoPayApprovalVO;
           
           } catch (RestClientException e) {
               e.printStackTrace();
           } catch (URISyntaxException e) {
               e.printStackTrace();
           }
           return null;
       }
       
   }

