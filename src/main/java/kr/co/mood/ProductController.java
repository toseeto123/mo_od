package kr.co.mood;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	
	@RequestMapping(value = "de.do")
	public String proDetails(Model model) {
		
		return "portfolio-details";	
	}
}
