package kr.co.mood;


import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mood.user.dao.UserService;
import kr.co.mood.user.dao.UserVO;


@Controller
@SessionAttributes("loginUser")
public class UserController {
	@Autowired
	private UserService userservice ;
	private SqlSessionTemplate mybatis;
	private UserVO vo;
	private ModelAndView mav;
	
	@RequestMapping(value = "/test.do" , method = RequestMethod.GET)
	   public String test() {
	      return "User/NewFile1";
	   }
	
   @RequestMapping(value = "/join.do" , method = RequestMethod.GET)
   public String join() {
      return "User/join";
   }

   @RequestMapping(value = "/idchk" , method = RequestMethod.POST)
   public String idchk() {
      return "User/join";
   }
   
   @RequestMapping(value = "/login.do" , method = RequestMethod.GET)
   public String login() {
	   
      return "User/login";
      }
  //lsg
   @RequestMapping(value = "/login.do" , method = RequestMethod.POST)
   public String loginAction(UserVO vo, HttpSession session , RedirectAttributes rttr) {
	  UserVO vo1 =  userservice.selectId(vo);
	  
	  if(vo1 == null) {
		  session.setAttribute("login_info", null);
		  System.out.println("로그인 실패");
		  
		  rttr.addFlashAttribute("msg", false);
		  return "redirect:login.do";
	  } else {
		  if(vo1.getId().equals("admin")) {
			  System.out.println("admin 로그인 성공");
			  	session.setAttribute("login_info", vo);
				return "adminPage/chart";
			} else {
				System.out.println("로그인 성공 + " + vo1);
				session.setAttribute("login_info", vo1);
				return "redirect:index.jsp";
			}
	  }	
   }
 	@RequestMapping("/logout.do")
 		public String logout(UserVO vo,HttpSession session) {
 			session.setAttribute("login_info", vo);
 			session.invalidate();
 			return "redirect:index.jsp";
 		}
 	@RequestMapping(value = "/mypage.do" , method = RequestMethod.GET)
    public String mypage(UserVO vo,HttpSession session) {
 		session.getAttribute("login_info");
       return "User/mypage";
       }
 	
 	@ResponseBody
 	@RequestMapping(value="/idChk", method = RequestMethod.POST)
 	public int idChk(UserVO vo) throws Exception {
 		int result = userservice.idChk(vo);
 		return result;
 	}
 	
 	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
 	public String postRegister(UserVO vo) throws Exception {
 		int result = userservice.idChk(vo);
 		try {
 			if(result == 1) {
 				return "/User/join";
 			}else if(result == 0) {
 				userservice.insert(vo);
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 		return "User/login";
 	}
 	
 	 @RequestMapping(value = "/deletemember.do" , method = RequestMethod.GET)
 	   public String deletemember(UserVO vo,HttpSession session,RedirectAttributes rttr) throws Exception {
 		 UserVO ssvo = (UserVO)session.getAttribute("login_info");
 		 String sspwd = ssvo.getPwd();
 		 String vopwd = vo.getPwd();
 		 String Id = vo.getId();
 		 if(!(sspwd.equals(vopwd))) {
 			 rttr.addFlashAttribute("msg", false);
 			 return "redirect:/User/mypage";
 		 }
 		 userservice.deleteUser(vo);
 		 session.invalidate();
 	     return "redirect:index.jsp";
 	   }
 	   
 	
 	

 	
 	

}