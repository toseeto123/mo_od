package kr.co.mood.Product.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	//고객 상품리스트이동
	@RequestMapping(value = "proList.do")
	public String proList(ArrayList<ProVO> vo,Model model) throws Exception{
		System.out.println(ps.selectProList(vo));
		List<ProVO> list = ps.selectProList(vo);
		model.addAttribute("list", list);
		return "productList";	
	}
	
	
	
	
}
