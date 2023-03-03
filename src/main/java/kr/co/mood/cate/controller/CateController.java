package kr.co.mood.cate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CateController {

	@RequestMapping(value = "/cate.do" , method = RequestMethod.GET)
	public String cate() {
		
		return "cate/cate";
	}
}
