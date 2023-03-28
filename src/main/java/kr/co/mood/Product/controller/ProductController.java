package kr.co.mood.Product.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.module.ModuleCommon;
import kr.co.mood.module.ModuleVO;

@RequestMapping("/products")
@Controller
public class ProductController {

	@Autowired
	ProductService ps;
	
	@Autowired
	ModuleCommon module;
	

	@RequestMapping(value = "/proList.do")
	public String proList(ModuleVO vo, Model model) throws Exception {
		ModuleVO moduleVO = new ModuleVO();
		List<ProVO> list = ps.selectProList(moduleVO);
		System.out.println(ps.selectProList(moduleVO));
		model.addAttribute("list", list);
		System.out.println("紐⑤뜽"+model);
		System.out.println("由ъ뒪�듃"+list);
		System.out.println("ps"+ps.selectProList(moduleVO));
		
		return "Product/productList";
	}


	@RequestMapping(value = "/{pro_number}/{pro_name}/{pro_img1}", method = RequestMethod.GET)
	public String proDetails(@PathVariable("pro_img1") String pro_img,@PathVariable("pro_number") int pro_number,@PathVariable("pro_name") String pro_name, ArrayList<ProVO> vo, Model model, HttpSession session,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		pro_name = URLEncoder.encode(pro_name, "UTF-8");
		model.addAttribute("list", ps.selectProOne(pro_number));
		model.addAttribute("randomList", ps.selectProRandom(vo));
		session.setAttribute("pro_number", ps.selectProOne(pro_number));
	    session.setAttribute("path", "/products/" + Integer.toString(pro_number) + "/" + pro_name + "/" + pro_img);
	    String path = (String) session.getAttribute("path");
	    String sessionKey = "recentlyViewedProducts";
	    int proNumber = pro_number;
	    String proName = pro_name;
	    String proIMG = pro_img;
		
		proName = java.net.URLDecoder.decode(proName, "UTF-8");
		List<Map<String, Object>> productList = (List<Map<String, Object>>) session.getAttribute(sessionKey);
		if (productList == null) {
		    productList = new ArrayList<Map<String, Object>>();
		}
		if (productList.size() >= 4) { // 理쒓렐蹂몄긽�뭹�씠 5媛� �씠�긽�씠硫�
		    productList.remove(0); // 媛��옣 �삤�옒�맂 �긽�뭹 �궘�젣
		}
		boolean isProductExist = false;
		for (Map<String, Object> product : productList) {
		    if (product.get("proNumber").equals(proNumber)) {
		        isProductExist = true;
		        break;
		    }
		}
		if (!isProductExist) { // �씠誘� 蹂� �긽�뭹�씠 �븘�땲硫�
		    Map<String, Object> product = new HashMap<String, Object>();
		    product.put("proNumber", proNumber);
		    product.put("proName", proName);
		    product.put("proIMG", proIMG);
		    productList.add(product); // �깉濡쒖슫 �긽�뭹 異붽�
		}
		// �꽭�뀡�뿉 ���옣
		session.setAttribute(sessionKey, productList);

		return "Product/productDetail";
	}
	
	@RequestMapping(value = "/category/{pro_categoryserial}", method = RequestMethod.GET)
	public String cateDetails(@PathVariable("pro_categoryserial") String pro_categoryserial, ArrayList<ProVO> vo, Model model, HttpSession session) {
	    if (pro_categoryserial.equals("A0")) {
	        return "redirect:/products/A0categoryList"; 
	    } else if (pro_categoryserial.equals("A1")) {
	        return "redirect:/products/A1categoryList"; 
	    } else if (pro_categoryserial.equals("A2")) {
	        return "redirect:/products/A2categoryList"; 
	    } else if (pro_categoryserial.equals("B0")) {
	        return "redirect:/products/B0categoryList"; 
	    } else if (pro_categoryserial.equals("B1")) {
	        return "redirect:/products/B1categoryList"; 
	    } else if (pro_categoryserial.equals("C0")) {
	        return "redirect:/products/C0categoryList"; 
	    } else if (pro_categoryserial.equals("C1")) {
	        return "redirect:/products/C1categoryList"; 
	    }else{
	        return "Product/productList"; // 다른 경우는 "Product/productList"로 리턴
	    }
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/AcategoryList")
	public String AcategoryList(ArrayList<ProVO> vo, Model model) {
		List<ProVO> list = ps.ACategoryList(vo);
		List<ProVO> prolist = ps.AselectProListByPayCount(vo);
		model.addAttribute("list", list);
		model.addAttribute("prolist", prolist);
		
		return "/Product/categoryList";
	}
	
	@RequestMapping(value = "/BcategoryList")
	public String BcategoryList(ArrayList<ProVO> vo, Model model) {
		List<ProVO> list = ps.BCategoryList(vo);
		List<ProVO> prolist = ps.BselectProListByPayCount(vo);
		model.addAttribute("list", list);
		model.addAttribute("prolist", prolist);
		return "/Product/categoryList";
	}
	
	@RequestMapping(value = "/CcategoryList")
	public String CcategoryList(ArrayList<ProVO> vo, Model model) {
		List<ProVO> list = ps.CCategoryList(vo);
		List<ProVO> prolist = ps.CselectProListByPayCount(vo);
		model.addAttribute("list", list);
		model.addAttribute("prolist", prolist);
		return "/Product/categoryList";
	}
	
	
	
	
	
	
    @RequestMapping(value = "/A0categoryList")
    public String ProductListA0(ArrayList<ProVO> vo, Model model) {
       return "redirect:/products/A0categoryList/1";
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
       return "redirect:/products/A1categoryList/1";
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
       return "redirect:/products/A2categoryList/1";
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
       return "redirect:/products/B0categoryList/1";
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
       return "redirect:/products/B1categoryList/1";
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
       return "redirect:/products/C0categoryList/1";
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
       return "redirect:/products/C1categoryList/1";
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
	
	
	

	
	
	
	
	
	/*
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
	*/

}
