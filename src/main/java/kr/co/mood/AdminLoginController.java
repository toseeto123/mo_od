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
	
	@RequestMapping("/adminLogin")
	public String adminLogin() {
		return "/admin/adminLogin";
	}
	
	   @RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	   public String adminLoginCheck(UserVO vo, HttpSession session, RedirectAttributes rttr) {
	      if(userService.selectId(vo) == null || !userService.selectId(vo).getId().equals("admin")) {
	         session.invalidate();
	         rttr.addFlashAttribute("msg", false);
	         return "redirect:/adminLogin";
	      }
	      session.setAttribute("login_info", userService.selectId(vo));
	      return "redirect:/admin/chart";
	   }

	   @RequestMapping("/adminLogout")
	   public String adminLogout(HttpSession session){
	      session.invalidate();
	      return "redirect:/adminLogin";
	   }
	   @RequestMapping("/goclient")
	   public String goClient(HttpSession session){
	      session.invalidate();
	      return "redirect:/";
	   }
	
}
