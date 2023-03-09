package kr.co.mood;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("/chart.do")
	public String adminIndex(Model model) {
		
		return "adminPage/chart";	
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
	
	
	//������ ��ǰ��������� �̵�
	@RequestMapping(value="insert.do" ,method=RequestMethod.GET)
	public String insertProductPage(){
		return "adminPage/insertPro";
	}
	
	//������ ��ǰ���
	   @RequestMapping(value="insert.do" ,method=RequestMethod.POST)
	   public String insertProduct(@RequestParam MultipartFile file,
	                        @RequestParam MultipartFile file1,
	                        @RequestParam MultipartFile file2,
	                        @RequestParam MultipartFile file3,
	                        @RequestParam MultipartFile file4,
	                                                      ProVO vo) throws IOException{
	      String fileRealName1 = file.getOriginalFilename(); //���ϸ��� �� �� �ִ� �޼���!
	      String fileRealName2 = file1.getOriginalFilename();
	      String fileRealName3 = file2.getOriginalFilename();
	      String fileRealName4 = file3.getOriginalFilename();
	      String fileRealName5 = file4.getOriginalFilename();
//	      long size = file.getSize(); //���� ������
//	      System.out.println("���ϸ� : "  + fileRealName1);
//	      System.out.println("�뷮ũ��(byte) : " + size);
//	      String fileExtension = fileRealName1.substring(fileRealName1.lastIndexOf("."),fileRealName1.length());
//	      String uploadFolder = "D:/up";
	      
//	      File saveFile = new File(uploadFolder+"\\" + fileExtension);  // ���� ��
	      try {
//	         file.transferTo(saveFile); // ���� ���� ����޼���(filewriter �۾��� �ս��� �ѹ濡 ó�����ش�.)
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
	

	
	
	//������ ��ǰ����Ʈ ������ �̵�
	@RequestMapping(value="adminProList.do")
	public String ProductList(ArrayList<ProVO> vo,Model model){
		List<ProVO> list = ps.selectProList(vo);
		model.addAttribute("list", list);
		return "adminPage/adminProList";
	}
	
	//������ ��ǰ������Ʈ �������̵�
	@RequestMapping(value="adminProDetail" ,method=RequestMethod.GET)
	public String updateProductPage(int pro_number, Model model, HttpServletRequest request){
		//mav.setViewName("adminPage/adminProUpdate");
		//model.addObject("list", ps.selectProOne(pro_number));
		String id = request.getParameter("pro_number");
		//System.out.println("�̰� :"+id);
		pro_number = Integer.parseInt(id);
		
		//System.out.println("�̰� :"+pro_number);
		
		model.addAttribute("list", ps.selectProOne(pro_number));
		return "adminPage/adminProUpdate";
	}
	
	
}
