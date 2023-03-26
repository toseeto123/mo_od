package kr.co.mood;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProVO;

@Controller
public class IndexController {
	
	@Autowired
	ProductService ps;
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String indexPage(Model model, ArrayList<ProVO> vo) {

		List<ProVO> Alist = ps.AselectProListByPayCount(vo);
		List<ProVO> Blist = ps.BselectProListByPayCount(vo);
		List<ProVO> Clist = ps.CselectProListByPayCount(vo);
		ProVO D0 = ps.D0selectCategoryProList(vo);
		ProVO D1 = ps.D1selectCategoryProList(vo);
		ProVO D2 = ps.D2selectCategoryProList(vo);
		ProVO D3 = ps.D3selectCategoryProList(vo);
		model.addAttribute("D0", D0);
		model.addAttribute("D1", D1);
		model.addAttribute("D2", D2);
		model.addAttribute("D3", D3);
		model.addAttribute("Alist", Alist);
		model.addAttribute("Blist", Blist);
		model.addAttribute("Clist", Clist);

		
		return "homePage";
	}
	
	@RequestMapping(value = "/home",method = RequestMethod.POST)
	public String viewProPage(Model model, ArrayList<ProVO> vo,HttpServletRequest request) {

		List<ProVO> Alist = ps.AselectProListByPayCount(vo);
		List<ProVO> Blist = ps.BselectProListByPayCount(vo);
		List<ProVO> Clist = ps.CselectProListByPayCount(vo);
		ProVO D0 = ps.D0selectCategoryProList(vo);
		ProVO D1 = ps.D1selectCategoryProList(vo);
		ProVO D2 = ps.D2selectCategoryProList(vo);
		ProVO D3 = ps.D3selectCategoryProList(vo);
		model.addAttribute("D0", D0);
		model.addAttribute("D1", D1);
		model.addAttribute("D2", D2);
		model.addAttribute("D3", D3);
		model.addAttribute("Alist", Alist);
		model.addAttribute("Blist", Blist);
		model.addAttribute("Clist", Clist);

		
		return "homePage";
	}

}
