package kr.co.mood;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.mood.Product.DAO.ProductService;
import kr.co.mood.Product.VO.ProPaginVO;
import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.module.ModuleCommon;
import kr.co.mood.user.dao.UserService;
import kr.co.mood.user.dao.UserVO;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	private ProductService ps;

	@Autowired
	private ProPaginVO paginVO;

	@Autowired
	private ModuleCommon module;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProPaginVO vo1;


   @RequestMapping("/chart.do")
   public String adminIndex(Model model) {
      return "admin/chart";   
   }
   
   @RequestMapping("/adminMemberList.do")
   public String adminMember() {
	   return "redirect:/admin/adminMemberList.do/1";
   }
  
   
   @RequestMapping("/adminMemberList.do/{paging}")
   public String adminMemberList(@PathVariable String paging, Model model) {//추가된 부분
	   List<UserVO> userList = userService.selectAll(null);
	   module.pagingModule(model, paginVO, userList, paging, 10);
	   List<UserVO> showUserList = userService.selectAll(paginVO);
	   model.addAttribute("userList", showUserList);
	   return "admin/adminMemberList";
   }
  
   @RequestMapping("/adminMemberDetail.do/{userNo}")
   public String adminMemberDetail(@PathVariable String userNo, UserVO vo, Model model){
	   UserVO vo1 = userService.selectMemberNo(Integer.parseInt(userNo));
	   model.addAttribute("userInfo", vo1);
	   return "admin/adminMemeberDetail";
   }
   
   @RequestMapping("admincate.do")
   public String adminCate(){
      
      return "admin/admincate";
   }
   
   @RequestMapping(value="insert.do" ,method=RequestMethod.GET)
   public String insertProductPage(){
      return "admin/insertPro";
   }
   
   @RequestMapping(value="adinsert.do" ,method=RequestMethod.POST)
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
         return "admin/chart";
      }
   

   
   

      @RequestMapping(value = "adminProList.do")
      public String ProductList(ArrayList<ProVO> vo, Model model) {
         return "redirect:/admin/adminProList.do/1";
      }

  	@RequestMapping(value = "/adminProList.do/{page}") // FIX
  	public String ProductListPage(@PathVariable String page, ArrayList<ProVO> vo, Model model) {
  		List<ProVO> allList = ps.selectProList(vo);
  		module.pagingModule(model, paginVO, allList, page, 7);
  		List<ProVO> showList = ps.selectProListPaging(paginVO);
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
   
}