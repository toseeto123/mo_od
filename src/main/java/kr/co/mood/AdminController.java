package kr.co.mood;


import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProPaginVO;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.module.ModuleCommon;
import kr.co.mood.user.dao.UserService;
import kr.co.mood.user.dao.UserVO;

@Controller
public class AdminController {
	
	@Autowired
	ProductService ps;
	
	@Autowired
	private UserService userService;
	
	   @Autowired
	   ProPaginVO paginVO;
	   
	   @Autowired
	   ModuleCommon module;
	
	
	@RequestMapping("/chart.do")
	public String adminIndex(Model model) {
		return "adminPage/chart";	
	}
	
	@RequestMapping("/adminLogin.do")
	public String adminLogin() {
		return "adminPage/adminLogin";
	}

	@RequestMapping(value = "/adminLogin.do", method = RequestMethod.POST)
	public String adminLoginCheck(UserVO vo, HttpSession session, RedirectAttributes rttr) {
		if(userService.selectId(vo) == null || !userService.selectId(vo).getId().equals("admin")) {
			session.invalidate();
			rttr.addFlashAttribute("msg", false);
			return "redirect:/adminLogin.do";
		}
		session.setAttribute("login_info", userService.selectId(vo));
		return "redirect:/chart.do";
	}

	@RequestMapping("/adminLogout.do")
	public String adminLogout(HttpSession session){
		session.invalidate();
		return "redirect:/login.do";
	}
	
	@RequestMapping("admincate.do")
	public String adminCate(){
		
		return "adminPage/admincate";
	}
	
	
	//占쏙옙占쏙옙占쏙옙 占쏙옙품占쏙옙占쏙옙占쏙옙占쏙옙占� 占싱듸옙
	@RequestMapping(value="insert.do" ,method=RequestMethod.GET)
	public String insertProductPage(){
		return "adminPage/insertPro";
	}
	
	//占쏙옙占쏙옙占쏙옙 占쏙옙품占쏙옙占�
	   @RequestMapping(value="insert.do" ,method=RequestMethod.POST)
	   public String insertProduct(@RequestParam MultipartFile file,
	                        @RequestParam MultipartFile file1,
	                        @RequestParam MultipartFile file2,
	                        @RequestParam MultipartFile file3,
	                        @RequestParam MultipartFile file4,
	                                                      ProVO vo) throws IOException{
	      String fileRealName1 = file.getOriginalFilename(); //占쏙옙占싹몌옙占쏙옙 占쏙옙爭� 占쏙옙 占쌍댐옙 占쌨쇽옙占쏙옙!
	      String fileRealName2 = file1.getOriginalFilename();
	      String fileRealName3 = file2.getOriginalFilename();
	      String fileRealName4 = file3.getOriginalFilename();
	      String fileRealName5 = file4.getOriginalFilename();
//	      long size = file.getSize(); //占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
//	      System.out.println("占쏙옙占싹몌옙 : "  + fileRealName1);
//	      System.out.println("占쎈량크占쏙옙(byte) : " + size);
//	      String fileExtension = fileRealName1.substring(fileRealName1.lastIndexOf("."),fileRealName1.length());
//	      String uploadFolder = "D:/up";
	      
//	      File saveFile = new File(uploadFolder+"\\" + fileExtension);  // 占쏙옙占쏙옙 占쏙옙
	      try {
//	         file.transferTo(saveFile); // 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙氷占쏙옙占�(filewriter 占쌜억옙占쏙옙 占쌌쏙옙占쏙옙 占싼방에 처占쏙옙占쏙옙占쌔댐옙.)
	         vo.setPro_img1(fileRealName1);
	         vo.setPro_img2(fileRealName2);
	         vo.setPro_img3(fileRealName3);
	         vo.setPro_img4(fileRealName4);
	         vo.setPro_img5(fileRealName5);
	         
	      } catch (IllegalStateException e) {
	         e.printStackTrace();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      ps.insertPro(vo);
	      return "adminPage/chart";
	   }
	

	
	
	   @RequestMapping(value = "adminProList.do")
	   public String ProductList(ArrayList<ProVO> vo, Model model) {
	      return "redirect:/adminProList.do/1";
	   }

	   @RequestMapping(value = "/adminProList.do/{page}") // FIX
	   public String ProductListPage(@PathVariable String page, ArrayList<ProVO> vo, Model model) {
	      List<ProVO> allList = ps.selectProList(vo);
	      module.pagingModule(model, page, paginVO, allList);
	      List<ProVO> showList = ps.selectProListPaging(paginVO);
	      model.addAttribute("list", showList);
	      return "adminPage/adminProList";
	   }
	

	@RequestMapping(value="adminProDetail" ,method=RequestMethod.GET)
	public String updateProductPage(int pro_number, Model model, HttpServletRequest request){
		//mav.setViewName("adminPage/adminProUpdate");
		//model.addObject("list", ps.selectProOne(pro_number));
		String id = request.getParameter("pro_number");
		//System.out.println("占싱곤옙 :"+id);
		pro_number = Integer.parseInt(id);
		
		//System.out.println("占싱곤옙 :"+pro_number);
		
		model.addAttribute("list", ps.selectProOne(pro_number));
		return "adminPage/adminProUpdate";
	}
	
	@RequestMapping(value = "/updatePro", method = RequestMethod.GET)
	public String proDetails(@RequestParam("pro_number") int pro_number,ProVO vo) {
		System.out.println(vo);
		ps.updatePro(vo);
		
		return "Product/adminProList";
	}
	
	
}
