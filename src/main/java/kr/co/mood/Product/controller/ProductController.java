package kr.co.mood.Product.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.user.dao.UserVO;

@Controller
public class ProductController {

	@Autowired
	ProductService ps;

	@RequestMapping(value = "/proList.do")
	public String proList(ArrayList<ProVO> vo, Model model) throws Exception {
		List<ProVO> list = ps.selectProList(vo);
		System.out.println(ps.selectProList(vo));
		model.addAttribute("list", list);
		System.out.println("紐⑤뜽"+model);
		System.out.println("由ъ뒪�듃"+list);
		System.out.println("ps"+ps.selectProList(vo));
		
		return "Product/productList";
	}


	@RequestMapping(value = "/product/{pro_number}", method = RequestMethod.GET)
	public String proDetails(@PathVariable("pro_number") int pro_number, UserVO vo, Model model, HttpSession session) {
		model.addAttribute("list", ps.selectProOne(pro_number));
		session.setAttribute("pro_number", ps.selectProOne(pro_number));
		session.setAttribute("path", "/product/"+Integer.toString(pro_number));
		String path = (String) session.getAttribute("path");
		
		return "Product/productDetail";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/A0categoryList")
	public String A0categoryProList(ArrayList<ProVO> vo, Model model) throws Exception {
		List<ProVO> list = ps.A0selectCategoryProList(vo);
		model.addAttribute("list", list);

		return "Product/productList";
	}
	@RequestMapping(value="/A1categoryList")
	public String A1categoryProList(ArrayList<ProVO> vo, Model model) throws Exception {
		List<ProVO> list = ps.A1selectCategoryProList(vo);
		model.addAttribute("list", list);

		return "/Product/productList";
	}
	@RequestMapping(value="/A2categoryList")
	public String A2categoryProList(ArrayList<ProVO> vo, Model model) throws Exception {
		List<ProVO> list = ps.A2selectCategoryProList(vo);
		model.addAttribute("list", list);

		return "/Product/productList";
	}
	@RequestMapping(value="/B0categoryList")
	public String B0categoryProList(ArrayList<ProVO> vo, Model model) throws Exception {
		List<ProVO> list = ps.B0selectCategoryProList(vo);
		model.addAttribute("list", list);

		return "/Product/productList";
	}
	@RequestMapping(value="/B1categoryList")
	public String B1categoryProList(ArrayList<ProVO> vo, Model model) throws Exception {
		List<ProVO> list = ps.B1selectCategoryProList(vo);
		model.addAttribute("list", list);

		return "/Product/productList";
	}
	@RequestMapping(value="/C0categoryList")
	public String C0categoryProList(ArrayList<ProVO> vo, Model model) throws Exception {
		List<ProVO> list = ps.C0selectCategoryProList(vo);
		model.addAttribute("list", list);

		return "/Product/productList";
	}
	@RequestMapping(value="/C1categoryList")
	public String C1categoryProList(ArrayList<ProVO> vo, Model model) throws Exception {
		List<ProVO> list = ps.C1selectCategoryProList(vo);
		model.addAttribute("list", list);

		return "/Product/productList";
	}
	@RequestMapping(value="/D0categoryList")
	public String D0categoryProList(ArrayList<ProVO> vo, Model model) throws Exception {
		ProVO list = ps.D0selectCategoryProList(vo);
		model.addAttribute("list", list);

		return "/Product/interiorDetail";
	}
	@RequestMapping(value="/D1categoryList")
	public String D1categoryProList(ArrayList<ProVO> vo, Model model) throws Exception {
		ProVO list = ps.D1selectCategoryProList(vo);
		model.addAttribute("list", list);

		return "/Product/interiorDetail";
	}
	@RequestMapping(value="/D2categoryList")
	public String D2categoryProList(ArrayList<ProVO> vo, Model model) throws Exception {
		ProVO list = ps.D2selectCategoryProList(vo);
		model.addAttribute("list", list);

		return "/Product/interiorDetail";
	}
	@RequestMapping(value="/D3categoryList")
	public String D3categoryProList(ArrayList<ProVO> vo, Model model) throws Exception {
		ProVO list = ps.D3selectCategoryProList(vo);
		model.addAttribute("list", list);

		return "/Product/interiorDetail";
	}
	

}
