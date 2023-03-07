package kr.co.mood;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	   public String insertProduct(@RequestParam MultipartFile file,
	                        @RequestParam MultipartFile file1,
	                        @RequestParam MultipartFile file2,
	                        @RequestParam MultipartFile file3,
	                        @RequestParam MultipartFile file4,
	                                                      ProVO vo) throws IOException{
	      String fileRealName1 = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
	      String fileRealName2 = file1.getOriginalFilename();
	      String fileRealName3 = file2.getOriginalFilename();
	      String fileRealName4 = file3.getOriginalFilename();
	      String fileRealName5 = file4.getOriginalFilename();
//	      long size = file.getSize(); //파일 사이즈
//	      System.out.println("파일명 : "  + fileRealName1);
//	      System.out.println("용량크기(byte) : " + size);
//	      String fileExtension = fileRealName1.substring(fileRealName1.lastIndexOf("."),fileRealName1.length());
//	      String uploadFolder = "D:/up";
	      
//	      File saveFile = new File(uploadFolder+"\\" + fileExtension);  // 적용 후
	      try {
//	         file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
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
	

	
	
	//관리자 상품리스트 페이지 이동
	@RequestMapping(value="adminProList.do")
	public String ProductList(ArrayList<ProVO> vo,Model model){
		List<ProVO> list = ps.selectProList(vo);
		model.addAttribute("list", list);
		return "adminPage/adminProList";
	}
	
	//관리자 상품업데이트 페이지이동
	@RequestMapping(value="adminProDetail" ,method=RequestMethod.GET)
	public String updateProductPage(int pro_number, Model model, HttpServletRequest request){
		//mav.setViewName("adminPage/adminProUpdate");
		//model.addObject("list", ps.selectProOne(pro_number));
		String id = request.getParameter("pro_number");
		//System.out.println("이거 :"+id);
		pro_number = Integer.parseInt(id);
		
		//System.out.println("이거 :"+pro_number);
		
		model.addAttribute("list", ps.selectProOne(pro_number));
		return "adminPage/adminProUpdate";
	}
	
	
}
