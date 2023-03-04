package kr.co.mood;


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
public class AdminController {
	
	@Autowired
	ProductService ps;
	
	@RequestMapping("chart.do")
	public String adminIndex(Model model) {
		
		return "adminPage/chart";	
	}
	

	@RequestMapping("admincate.do")
	public String adminCate(){
		
		return "adminPage/admincate";
	}
	
	
	//관리자 상품등록페이지 이동
	@RequestMapping(value="insert.do" ,method=RequestMethod.GET)
	public String insertProductPage(){
		return "adminPage/insertPro";
	}
	
	//관리자 상품등록
	@RequestMapping(value="insert.do" ,method=RequestMethod.POST)
	public String insertProduct(ProVO vo,Model model){
		
		ps.insert(vo);
		return "adminPage/chart";
		
	}
	

	
	
	//관리자 상품리스트 페이지 이동
	@RequestMapping(value="adminProList.do")
	public String ProductList(ArrayList<ProVO> vo,Model model) throws Exception{
		System.out.println(ps.selectProList(vo));
		List<ProVO> list = ps.selectProList(vo);
		model.addAttribute("list", list);
		return "adminPage/adminProList";
	}
	
}
