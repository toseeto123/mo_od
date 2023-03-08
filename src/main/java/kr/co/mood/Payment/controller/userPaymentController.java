package kr.co.mood.Payment.controller;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import lombok.extern.java.Log;
import java.util.ArrayList;
import java.util.List;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.PathVariable;

import kr.co.mood.Payment.VO.KakaoPayApprovalVO;
import kr.co.mood.Payment.VO.KakaoPayReadyVO;
import kr.co.mood.Payment.VO.userOrderProductListVO;
import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProVO;


@Controller
public class userPaymentController {

	@Autowired
	ProductService ps;

	private static final String HOST = "https://kapi.kakao.com";
	private KakaoPayReadyVO kakaoready;
	private KakaoPayApprovalVO kakaoPayApprovalVO;

	public String kakaoPayReady() {
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Authorization", "KakaoAK"+ "1310fb3a979458e032a8aecca6d5e96c");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=utf-8");
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "mood");
		params.add("partner_user_id", "admin");
		params.add("item_name", "침대");
		params.add("quantity", "1");
		params.add("total_amount", "	100");
		params.add("tax_free_amount", "0");
		params.add("approval_url", "http://localhost:8080/kakaoPaySuccess");
		params.add("cancel_url", "http://localhost:8080/kakaoPayCancel");
		params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail");

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoready = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
			System.out.println("" + kakaoready);
			
			return kakaoready.getNext_redirect_pc_url();

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

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "1310fb3a979458e032a8aecca6d5e96c");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoready.getTid());
		params.add("partner_order_id", "1001");
		params.add("partner_user_id", "gorany");
		params.add("pg_token", pg_token);
		params.add("total_amount", "2100");

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
					KakaoPayApprovalVO.class);
			System.out.println("" + kakaoPayApprovalVO);

			return kakaoPayApprovalVO;

		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/payfail", method = RequestMethod.GET)
	public String payFail() {
		return "User/payFail";
	}

	

	// 주문 내역 가져갈 명령어
	@RequestMapping("/order/{login_info}")
	public void orderPgaeGET(@PathVariable("login_info") String login_info, userOrderProductListVO uop, Model model) {

		System.out.println("memberId : " + login_info);
		System.out.println("orders : " + uop.getOrders());

	}

	// payment이동
	@RequestMapping(value = "/userPayment.do", method = RequestMethod.POST)
	public String userPayment(ArrayList<ProVO> vo, Model model) {
		List<ProVO> list = ps.selectProList(vo);
		model.addAttribute("list", list);
		return "User/userPayment";
	}

	// payment test
	@RequestMapping(value = "/userPayment.do", method = RequestMethod.GET)
	public String userPayment() {

		return "User/userPayment";
	}

	// payment test
	@RequestMapping(value = "/userPay.do", method = RequestMethod.GET)
	public String userPay() {

		return "User/userPay";
	}

	// 결제 리스트
	@RequestMapping(value = "/userPaymentList.do")
	public String userPaymentList() {

		return "User/userPaymentList";
	}

	// 결제 상세
	@RequestMapping(value = "/userPaymentDetail.do")
	public String userPaymentDetail() {

		return "User/userPaymentDetail";
	}
}
