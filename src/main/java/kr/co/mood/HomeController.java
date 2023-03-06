package kr.co.mood;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;


/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	
	private IamportClient api;
	
	public HomeController() {
    	// REST API 키와 REST API secret 입력.
		this.api = new IamportClient("2751034074343061","yy1j1jTjiZ4xIPFg7WvGQ9Ye8B88NXPGseiHt2IbCvUcOKjB0lyyDGKP5DHvfYJeAOXq6NFfsQPAhttw");
	}
	//검증 url	
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{	
			return api.paymentByImpUid(imp_uid);
	}
	//mobile 결제시 리다이렉트로 검증절차 넘기는거 해결책
	@RequestMapping(value="orderCompleteMobile", produces = "application/text; charset=utf8", method = RequestMethod.GET)
	public String orderCompleteMobile(
			@RequestParam(required = false) String imp_uid
			, @RequestParam(required = false) String merchant_uid
			, Model model
			, Locale locale
			, HttpSession session) throws IamportResponseException, IOException
	{
		
		IamportResponse<Payment> result = api.paymentByImpUid(imp_uid);
		
		// 결제 가격과 검증결과를 비교한다.
		if(result.getResponse().getAmount().compareTo(BigDecimal.valueOf(100)) == 0) {
			System.out.println("검증통과");
		}
		
		return "home";
	}
	
}
