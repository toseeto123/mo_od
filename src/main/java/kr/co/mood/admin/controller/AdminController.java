package kr.co.mood.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.mood.Payment.DAO.AdminPaymentService;
import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.cate.DAO.CateService;
import kr.co.mood.cate.vo.CateVO;
import kr.co.mood.module.ModuleCommon;
import kr.co.mood.module.ModuleVO;
import kr.co.mood.module.ViewPagingVO;
import kr.co.mood.user.dao.UserService;
import kr.co.mood.user.dao.UserVO;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	private ProductService ps;
	
	@Autowired
	private ModuleCommon module;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CateService cateService;
	@Autowired
	private AdminPaymentService adminPaymentService;


   @RequestMapping("/chart")
   public String adminIndex(Model model) {
	   adminPaymentService.getCategoryChart(model);
      return "admin/chart";   
   }
   
   @RequestMapping("/adminMemberList")
   public String adminMember() {
	   return "redirect:/admin/adminMemberList/1";
   }
  
   @RequestMapping("/adminMemberList/{paging}/{searchWhat}/{search}")
   @ResponseBody
   public Map<String, Object> adminMemberList(@PathVariable String paging,@PathVariable String searchWhat,@PathVariable String search, Model model) {//�빊遺쏙옙占쎈쭆 �겫占썽겫占�
	   ModuleVO moduleVO = new ModuleVO();
	   Map<String, Object> map = new HashMap<String, Object>();
	   if(search.equals("(none)")) {
		   search = null;		   
	   }else {
	   if(searchWhat.equals("id")) {
		   moduleVO.setSearchId(search);
	   }else if(searchWhat.equals("name")) {
		   moduleVO.setSearchName(search);
	   }
	   }
	   List<UserVO> userList = userService.selectAll(moduleVO);
	   ViewPagingVO viewVO = module.pagingModule(model, moduleVO, userList, paging, 10);
	   List<UserVO> showUserList = userService.selectAll(moduleVO);
	   model.addAttribute("userList", showUserList);
	   map.put("list", showUserList);
	   map.put("vo", viewVO);
	   return map;
   }
   
   
   @RequestMapping("/adminMemberList/{paging}")
   public String adminMemberList(@PathVariable String paging, Model model) {//�빊遺쏙옙占쎈쭆 �겫占썽겫占�
	   ModuleVO moduleVO = new ModuleVO();
	   List<UserVO> userList = userService.selectAll(null);
	   module.pagingModule(model, moduleVO, userList, paging, 10);
	   List<UserVO> showUserList = userService.selectAll(moduleVO);
	   model.addAttribute("userList", showUserList);
	   return "admin/adminMemberList";
   }
  
   @RequestMapping("/adminMemberDetail/{userNo}")
   public String adminMemberDetail(@PathVariable String userNo, UserVO vo, Model model){
	   UserVO vo1 = userService.selectMemberNo(Integer.parseInt(userNo));
	   model.addAttribute("userInfo", vo1);
	   return "admin/adminMemeberDetail";
   }
   
   @RequestMapping("/admincate")
   public String adminCate(){
      return "redirect:/admin/admincate/1";
   }
   
   @RequestMapping("/admincate/{paging}")
   public String admincateList(@PathVariable String paging,Model model,HttpSession session) {
	   ModuleVO moduleVO = new ModuleVO();
	   
	   
       UserVO uvo = (UserVO) session.getAttribute("login_info");
       int userid = uvo.getNo();
       
	   List<CateVO> catelist = cateService.selectAll(null,userid);
	   module.pagingModule(model, moduleVO, catelist, paging, 10);
	   List<CateVO> showCatelist = cateService.selectAll(moduleVO,userid);
	   model.addAttribute("cateList", showCatelist);	   
	   
	   return "admin/admincate";
   }
   @RequestMapping("/admincate/{paging}/{searchWhat}/{search}")
   @ResponseBody
   public Map<String, Object> adminCateserach(@PathVariable String paging,@PathVariable String searchWhat,@PathVariable String search, Model model,HttpSession session) {
	   ModuleVO moduleVO = new ModuleVO();
	   Map<String, Object> map = new HashMap<String, Object>();
	   if(search.equals("(none)")) {
		   search = null;		   
	   }else {
	   if(searchWhat.equals("name")) {
		   moduleVO.setSearchId(search);
	   }else if(searchWhat.equals("pro_name")) {
		   moduleVO.setSearchName(search);
	   }
	   }
       UserVO uvo = (UserVO) session.getAttribute("login_info");
       int userid = uvo.getNo();
       
	   List<CateVO> catelist = cateService.selectAll(null,userid);
	   ViewPagingVO viewVO = module.pagingModule(model, moduleVO, catelist, paging, 10);
	   List<CateVO> showCatelist = cateService.selectAll(moduleVO,userid);
	   model.addAttribute("cateList", showCatelist);
	   map.put("list", showCatelist);
	   map.put("vo", viewVO);
	   return map;
   }
   
   @RequestMapping(value="insert" ,method=RequestMethod.GET)
   public String insertProductPage(){
      return "admin/insertPro";
   }
   
   @RequestMapping(value="insert" ,method=RequestMethod.POST)
   public String insertProduct(@RequestParam MultipartFile file,
                           @RequestParam MultipartFile file1,
                           @RequestParam MultipartFile file2,
                           @RequestParam MultipartFile file3,
                           @RequestParam MultipartFile file4,
                                                         ProVO vo) throws IOException{
         String fileRealName1 = file.getOriginalFilename(); 
         String fileRealName2 = file1.getOriginalFilename();
         String fileRealName3 = file2.getOriginalFilename();
         String fileRealName4 = file3.getOriginalFilename();
         String fileRealName5 = file4.getOriginalFilename();

         try {
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
         return "admin/adminProList";
      }
   

   
   

      @RequestMapping(value = "adminProList")
      public String ProductList() {
         return "redirect:/admin/adminProList/1";
      }

      @RequestMapping("/adminProList/{paging}/{searchWhat}/{search}")
      @ResponseBody
      public Map<String, Object> adminProList(@PathVariable String paging,@PathVariable String searchWhat,@PathVariable String search, Model model) {//�빊遺쏙옙占쎈쭆 �겫占썽겫占�
   	   ModuleVO moduleVO = new ModuleVO();
   	   Map<String, Object> map = new HashMap<String, Object>();
   	   if(search.equals("(none)")) {
   		   search = null;		   
   	   }else {
   	   if(searchWhat.equals("id")) {
   		   moduleVO.setSearchId(search);
   	   }else if(searchWhat.equals("name")) {
   		   moduleVO.setSearchName(search);
   	   }
   	   }
   	   List<ProVO> proList = ps.selectProList(moduleVO);
   	   ViewPagingVO viewVO = module.pagingModule(model, moduleVO, proList, paging, 7);
   	   List<ProVO> showProList = ps.selectProList(moduleVO);
   	   model.addAttribute("userList", showProList);
   	   map.put("list", showProList);
   	   map.put("vo", viewVO);
   	   return map;
      }
      
      
      
      
      
      

  	@RequestMapping(value = "/adminProList/{page}") // FIX
  	public String ProductListPage(@PathVariable String page, ModuleVO vo, Model model) {
  		ModuleVO moduleVO = new ModuleVO();
  		List<ProVO> allList = ps.selectProList(moduleVO);
  		module.pagingModule(model, moduleVO, allList, page, 7);
  		List<ProVO> showList = ps.selectProListPaging(moduleVO);
  		model.addAttribute("list", showList);
  		return "/admin/adminProList";
  	}


   @RequestMapping(value="adminProDetail" ,method=RequestMethod.GET)
   public String updateProductPage(int pro_number, Model model, HttpServletRequest request){
      String id = request.getParameter("pro_number");
      pro_number = Integer.parseInt(id);
      
      model.addAttribute("list", ps.selectProOne(pro_number));
      return "admin/adminProUpdate";
   }
   
   @RequestMapping(value = "/updatePro", method = RequestMethod.GET)
   public String proDetails(@RequestParam("pro_number") int pro_number,ProVO vo) {
      System.out.println(vo);
      ps.updatePro(vo);
      
      return "/admin/adminProList";
   }
   @RequestMapping(value = "/updateSoldOut", method = RequestMethod.POST)
	   public String proSoldOutUpdate(@RequestParam("pro_number") int pro_number,ProVO vo) {
		   ps.updateSoludOut(vo);
		   return "/admin/adminProList";
	   }
   @RequestMapping(value = "/updateOnSale", method = RequestMethod.POST)
   public String proSoldOnSale(@RequestParam("pro_number") int pro_number,ProVO vo) {
	   ps.updateOnSale(vo);
	   return "/admin/adminProList";
   }
   }
   
