package kr.co.mood.Product.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.Product.VO.paymentVO;
import kr.co.mood.user.dao.UserVO;

@Controller
public class ProductController {
	

	@Autowired
	ProductService ps;

	
	@RequestMapping(value = "proDetail.do")
	public String proDetails() {
		
		return "productDetail";	
		//return "inner-page";
	}
	
	
	//�� ��ǰ����Ʈ�̵�
	@RequestMapping(value = "proList.do")
	public String proList(ArrayList<ProVO> vo,Model model) throws Exception{
		System.out.println(ps.selectProList(vo));
		List<ProVO> list = ps.selectProList(vo);
		model.addAttribute("list", list);
		return "productList";	
	}
	
	//결제페이지 이동
	  @RequestMapping(value = "userPayment.do" , method = RequestMethod.GET)
	   public String userPayment() {
	      return "User/userPayment";
	   }
	  
	//결제리스트 페이지 이동 // 나중에 , paymentDetailVO paymentDetail 매개변수 추가 
	  @RequestMapping(value = "payList", method = RequestMethod.POST)
	  public void payList(HttpSession session, paymentVO payment) throws Exception {
	     System.out.println("payment");
	     
	     UserVO member = (UserVO)session.getAttribute("member");    
	     String userId = member.getId();
	     
	     ps.payInfo(payment); 
	 //  ps.payInfo_Details(paymentDetail);   
	  }
	  
}
