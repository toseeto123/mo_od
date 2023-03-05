package kr.co.mood.Product.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProVO;

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
	
	
}
