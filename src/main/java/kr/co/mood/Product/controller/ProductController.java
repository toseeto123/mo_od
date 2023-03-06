package kr.co.mood.Product.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProVO;

@Controller
public class ProductController {
	

	@Autowired
	ProductService ps;

	
//	@RequestMapping(value = "proDetail.do")
//	public String proDetails() {
//		
//		return "productDetail";	
//		//return "inner-page";
//	}
	
	
	//占쏙옙 占쏙옙품占쏙옙占쏙옙트占싱듸옙
	@RequestMapping(value = "proList.do")
	public String proList(ArrayList<ProVO> vo,Model model) throws Exception{
		System.out.println(ps.selectProList(vo));
		List<ProVO> list = ps.selectProList(vo);
		model.addAttribute("list", list);
		return "productList";	
	}
	
	//寃곗젣�럹�씠吏� �씠�룞
	  @RequestMapping(value = "userPayment.do" , method = RequestMethod.GET)
	   public String userPayment() {
	      return "User/userPayment";
	   }
	  
	  
	  @RequestMapping(value="{pro_number}" ,method=RequestMethod.GET)
		public String proDetails(@PathVariable("pro_number") int pro_number, Model model){
			//mav.setViewName("adminPage/adminProUpdate");
			//model.addObject("list", ps.selectProOne(pro_number));
			model.addAttribute("list", ps.selectProOne(pro_number));
			System.out.println(ps.selectProOne(pro_number));
			return "productDetail";
		}
	  
	  
	
	
}
