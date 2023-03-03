package kr.co.mood;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	
	@RequestMapping(value = "proDetail.do")
	public String proDetails() {
		
		return "portfolio-details";	
		//return "inner-page";
	}
	
	@RequestMapping(value = "proList.do")
	public String proList() {
		
		return "productList";	
		//return "inner-page";
	}
	
	
}
