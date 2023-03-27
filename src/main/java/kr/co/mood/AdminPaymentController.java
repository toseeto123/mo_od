package kr.co.mood;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import kr.co.mood.Payment.DAO.AdminPaymentService;
import kr.co.mood.Payment.VO.KakaoCancelResponseVO;
import kr.co.mood.Payment.VO.KakaoPayApprovalVO;
import kr.co.mood.module.ModuleCommon;
import kr.co.mood.pay.DAO.KakaoPayApprovalService;
import kr.co.mood.pay.DAO.KakaoPayApprovalServiceImpl;

@RequestMapping("/admin")
@Controller
public class AdminPaymentController {

	@Autowired
	private KakaoPayApprovalService kservice;

	@Autowired
	private AdminPaymentService adminService;
	
	@Autowired
	private ModuleCommon module;
	
	

	@RequestMapping("/payment.do")
	public String adminPaymentDefault(HttpServletRequest request) {
		return "redirect:/admin/payment.do/1";
	}

	@RequestMapping("/payment.do/{num}")
	public String adminPaymentPaging(@PathVariable("num") String num, Model model) {
		adminService.adminPaymentList(model, num);
		model.addAttribute("num", num);
		return "admin/adminPayment";
	}
	
	@RequestMapping("/payment.do/{paging}/{searchWhat}/{search}")
	@ResponseBody
	public Map<String, Object> adminPaymentPagingSearching(@PathVariable String paging,@PathVariable String searchWhat,@PathVariable String search, Model model){
		   Map<String, Object> map = adminService.adminPaymentSearchingList(model, paging, searchWhat, search);
		return map;	
	}
	
	
public KakaoCancelResponseVO kakaoCancel(String tid
		   , String price,
		   int orderId
		   ) {
    HttpHeaders headers = new HttpHeaders();
    headers.add("Authorization", "KakaoAK " + "1310fb3a979458e032a8aecca6d5e96c");
    headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
    headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
    
    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
    params.add("cid", "TC0ONETIME");
    params.add("tid", tid);
    params.add("cancel_amount", price);
    params.add("cancel_tax_free_amount", "100");
    
    HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(params, headers);

    RestTemplate restTemplate = new RestTemplate();

    KakaoCancelResponseVO cancelResponse = restTemplate.postForObject(
            "https://kapi.kakao.com/v1/payment/cancel",
            requestEntity,
            KakaoCancelResponseVO.class);
    kservice.paycancelDelete(orderId);
    kservice.paySuccessStatusUpdate(orderId);
    return cancelResponse;
}


@RequestMapping(value = "/kakaoPayCancel" )
public String payCancel(Model model, int userNo) {
	   
	 //  KakaoPayApprovalVO vo = adminService.adminPaymentCancel();
	   //model.addAttribute("info" , kakaoCancel(vo.get(0).getTid(),Integer.toString(1000), list.get(0).getOrderId()));
	   return "redirect:/";
}

}
