package kr.co.mood;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProVO;

@Controller
public class AdminController {
	
	@Autowired
	private ProductService ps;
	
	@RequestMapping("chart.do")
	public String adminIndex(Model model) {
		
		return "adminPage/chart";	
	}
	
	@RequestMapping("admincate.do")
	public String adminCate(){
		
		return "adminPage/admincate";
	}
	
	@RequestMapping(value="insert.do" ,method=RequestMethod.GET)
	public String insertProductPage(){
		return "adminPage/insertPro";
	}
	
	@RequestMapping(value="insert.do" ,method=RequestMethod.POST)
	public String insertProduct(ProVO vo,Model model){
		
		ps.insert(vo);
		return "adminPage/chart";
		
	}
	
}
