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
public class IndexController {
	
	@Autowired
	ProductService ps;
	
	
	@RequestMapping(value = "/mo_od",method = RequestMethod.GET)
	public String indexPage(Model model, ArrayList<ProVO> vo) {

		
		List<ProVO> Alist = ps.AselectProListByPayCount(vo);
		List<ProVO> Blist = ps.BselectProListByPayCount(vo);
		List<ProVO> Clist = ps.CselectProListByPayCount(vo);
		
		model.addAttribute("Alist", Alist);
		model.addAttribute("Blist", Blist);
		model.addAttribute("Clist", Clist);
		System.out.println(Alist);
		System.out.println(Blist);
		System.out.println(Clist);
		
		return "homePage";
	}

}
