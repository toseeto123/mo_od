package kr.co.mood.Product.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.module.ModuleCommon;
import kr.co.mood.module.ModuleVO;

@Controller
public class ProductController {

	@Autowired
	ProductService ps;
	
	@Autowired
	ModuleCommon module;
	

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
	public String proDetails(@PathVariable("pro_number") int pro_number, Model model,HttpSession session) {
		model.addAttribute("list", ps.selectProOne(pro_number));
		session.setAttribute("pro_number", ps.selectProOne(pro_number));
		
		return "Product/productDetail";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    @RequestMapping(value = "/A0categoryList")
    public String ProductListA0(ArrayList<ProVO> vo, Model model) {
       return "redirect:/A0categoryList/1";
    }

	@RequestMapping(value = "/A0categoryList/{page}") // FIX
	public String ProductListPageA0(@PathVariable String page, ArrayList<ProVO> voa0, Model model) {
		ModuleVO moduleVO = new ModuleVO();
		List<ProVO> allList = ps.A0selectCategoryProList(voa0);
		module.pagingModule(model, moduleVO, allList, page, 8);
		List<ProVO> showList = ps.A0selectProListPaging(moduleVO);
		model.addAttribute("list", showList);
		return "/Product/productList";
	}
	
	
	
    @RequestMapping(value = "/A1categoryList")
    public String ProductListA1(ArrayList<ProVO> vo, Model model) {
       return "redirect:/A1categoryList/1";
    }

	@RequestMapping(value = "/A1categoryList/{page}") // FIX
	public String ProductListPageA1(@PathVariable String page, ArrayList<ProVO> voa1, Model model) {
		ModuleVO moduleVO = new ModuleVO();
		List<ProVO> allList = ps.A1selectCategoryProList(voa1);
		module.pagingModule(model, moduleVO, allList, page, 8);
		List<ProVO> showList = ps.A1selectProListPaging(moduleVO);
		model.addAttribute("list", showList);
		return "/Product/productList";
	}
	
    @RequestMapping(value = "/A2categoryList")
    public String ProductListA2(ArrayList<ProVO> vo, Model model) {
       return "redirect:/A2categoryList/1";
    }

	@RequestMapping(value = "/A2categoryList/{page}") // FIX
	public String ProductListPageA2(@PathVariable String page, ArrayList<ProVO> voa2, Model model) {
		ModuleVO moduleVO = new ModuleVO();
		List<ProVO> allList = ps.A2selectCategoryProList(voa2);
		module.pagingModule(model, moduleVO, allList, page, 8);
		List<ProVO> showList = ps.A2selectProListPaging(moduleVO);
		model.addAttribute("list", showList);
		return "/Product/productList";
	}
	
	
    @RequestMapping(value = "/B0categoryList")
    public String ProductListB0(ArrayList<ProVO> vo, Model model) {
       return "redirect:/B0categoryList/1";
    }

	@RequestMapping(value = "/B0categoryList/{page}") // FIX
	public String ProductListPageB0(@PathVariable String page, ArrayList<ProVO> vob0, Model model) {
		ModuleVO moduleVO = new ModuleVO();
		List<ProVO> allList = ps.B0selectCategoryProList(vob0);
		module.pagingModule(model, moduleVO, allList, page, 8);
		List<ProVO> showList = ps.B0selectProListPaging(moduleVO);
		model.addAttribute("list", showList);
		return "/Product/productList";
	}
	
	
    @RequestMapping(value = "/B1categoryList")
    public String ProductListB1(ArrayList<ProVO> vo, Model model) {
       return "redirect:/B1categoryList/1";
    }

	@RequestMapping(value = "/B1categoryList/{page}") // FIX
	public String ProductListPageB1(@PathVariable String page, ArrayList<ProVO> vob1, Model model) {
		ModuleVO moduleVO = new ModuleVO();
		List<ProVO> allList = ps.B1selectCategoryProList(vob1);
		module.pagingModule(model, moduleVO, allList, page, 8);
		List<ProVO> showList = ps.B1selectProListPaging(moduleVO);
		model.addAttribute("list", showList);
		return "/Product/productList";
	}
	
	
    @RequestMapping(value = "/C0categoryList")
    public String ProductListC0(ArrayList<ProVO> vo, Model model) {
       return "redirect:/C0categoryList/1";
    }

	@RequestMapping(value = "/C0categoryList/{page}") // FIX
	public String ProductListPageC0(@PathVariable String page, ArrayList<ProVO> voc0, Model model) {
		ModuleVO moduleVO = new ModuleVO();
		List<ProVO> allList = ps.C0selectCategoryProList(voc0);
		module.pagingModule(model, moduleVO, allList, page, 8);
		List<ProVO> showList = ps.C0selectProListPaging(moduleVO);
		model.addAttribute("list", showList);
		return "/Product/productList";
	}
	
    @RequestMapping(value = "/C1categoryList")
    public String ProductListC1(ArrayList<ProVO> vo, Model model) {
       return "redirect:/C1categoryList/1";
    }

	@RequestMapping(value = "/C1categoryList/{page}") // FIX
	public String ProductListPageC1(@PathVariable String page, ArrayList<ProVO> voc1, Model model) {
		ModuleVO moduleVO = new ModuleVO();
		List<ProVO> allList = ps.C1selectCategoryProList(voc1);
		module.pagingModule(model, moduleVO, allList, page, 8);
		List<ProVO> showList = ps.C1selectProListPaging(moduleVO);
		model.addAttribute("list", showList);
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
