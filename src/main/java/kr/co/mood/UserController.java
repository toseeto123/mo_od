package kr.co.mood;


import org.mybatis.spring.SqlSessionTemplate;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
   public String loginAction(UserVO vo) {
	  UserVO vo1 =  userservice.selectId(vo);
	  if(vo1.getId()==null || vo1.getId().equals("")) {
		  System.out.println("null값이얌");
		  return "redirect:login.jsp";
	  } else {
		  if(vo1.getId().equals("admin")) {
			  System.out.println("admin 로그인 성공");
				return "redirect:adminPage/chart.jsp";
			} else {
				System.out.println("로그인 성공 + " + vo1);
				
				return "redirect:index.jsp";
			}
	  }
		
   }
   //develop
   @RequestMapping(value = "/login.do" , method = RequestMethod.POST)
   public String login(HttpServletRequest request){
       String returnURL = "";
       //웹페이지에서받은 아이디,패스워드 일치시 admin 세션key 생성
       if(request.getParameter("id").equals("admin") && request.getParameter("pwd").equals("1234")) {
           Map<String, Object> map = new HashMap<String,Object>();
           map.put("admin_id", "admin");
           map.put("admin_name", "관리자");
           request.getSession().setAttribute("admin", map);
           returnURL = "redirect:/admin_main";
       //일치하지 않으면 로그인페이지 재이동
       }else {
           returnURL = "redirect:/mood"; 
       }
       return returnURL;
   }

   @RequestMapping("/admin_main")
   public String admin_main(){
       return "adminmain";
   }
  

}