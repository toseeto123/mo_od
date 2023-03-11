package kr.co.mood;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mood.user.dao.UserService;
import kr.co.mood.user.dao.UserVO;

@Controller
public class AdminLoginController {
	
	@Autowired
	   private UserService userService;
	
	@RequestMapping("/adminLogin.do")
	public String adminLogin() {
		return "/admin/adminLogin";
	}
	
	   @RequestMapping(value = "/adminLogin.do", method = RequestMethod.POST)
	   public String adminLoginCheck(UserVO vo, HttpSession session, RedirectAttributes rttr) {
		   System.out.println("둥");
	      if(userService.selectId(vo) == null || !userService.selectId(vo).getId().equals("admin")) {
	         session.invalidate();
	         rttr.addFlashAttribute("msg", false);
	         return "redirect:/adminLogin.do";
	      }
	      session.setAttribute("login_info", userService.selectId(vo));
	      return "redirect:/admin/chart.do";
	   }

	   @RequestMapping("/adminLogout.do")
	   public String adminLogout(HttpSession session){
	      session.invalidate();
	      return "redirect:/adminLogin.do";
	   }
	   @RequestMapping("/goclient.do")
	   public String goClient(HttpSession session){
	      session.invalidate();
	      return "redirect:/";
	   }
	
}
