package kr.co.mood;


import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mood.user.dao.UserService;
import kr.co.mood.user.dao.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService userservice ;
	private SqlSessionTemplate mybatis;
	private UserVO vo;
	private ModelAndView mav;
	
   @RequestMapping(value = "/join.do" , method = RequestMethod.GET)
   public String join() {
      return "User/join";
   }
   
   @RequestMapping(value = "/join.do" , method = RequestMethod.POST)
   public String joinAction(UserVO vo) {
	   userservice.insert(vo);
      return "User/login";
   }
   
   @RequestMapping(value = "/login.do" , method = RequestMethod.GET)
   public String login() {
      
      return "User/login";
      }
  //lsg
   @RequestMapping(value = "/login.do" , method = RequestMethod.POST)
   public String loginAction(UserVO vo, HttpSession session) {
	  UserVO vo1 =  userservice.selectId(vo);
	  if(vo1.getId()==null || vo1.getId().equals("")) {
		  System.out.println("null값이얌");
		  return "redirect:User/login.jsp";
	  } else {
		  if(vo1.getId().equals("admin")) {
			  System.out.println("admin 로그인 성공");
			  	session.setAttribute("login_info", vo);
				return "adminPage/chart";
			} else {
				System.out.println("로그인 성공 + " + vo1);
				session.setAttribute("login_info", vo);
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
    public String mypage() {
       
       return "User/mypage";
       }

}