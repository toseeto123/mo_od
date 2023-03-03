package kr.co.mood.Product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	
	@RequestMapping(value = "proDetail.do")
	public String proDetails() {
		
		return "productDetail";	
		//return "inner-page";
	}
	
	@RequestMapping(value = "proList.do")
	public String proList() {
		
		return "productList";	
		//return "inner-page";
	}
	
	
}
