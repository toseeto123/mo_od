package kr.co.mood;


import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	
	  //네이버 로그인
	@RequestMapping(value="/naverSave", method=RequestMethod.POST)
	
    public @ResponseBody String naverSave(UserVO uservo,  HttpSession session ) throws Exception {
		
    System.out.println(uservo); 
    String email = uservo.getEmail();
    String name = uservo.getName();
    String age = uservo.getAge();
    String gender = uservo.getGender();

    
    UserVO naver = new UserVO();
    
    naver.setId(email);
    naver.setEmail(email);
    naver.setName(name);
    naver.setAge(age);
    naver.setGender(gender);
    
    
    String str = "no";
    System.out.println(naver);
  
  int result = userservice.idChk(naver);
  System.out.println(result);
  
  try {
     if(result == 1) {
    	
        return "/";
        
     }else if(result == 0) {
    	System.out.println("가입바로진행~");
        userservice.insertnaver(naver);
        session.setAttribute("login_info", naver);
        return "/";
     }
     
  }catch (Exception e) {
     throw new RuntimeException();
  }
  

   
   if(uservo!=null) {
	   str = "ok";
   }
   return str;
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
				return "redirect:admin/chart.do";
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
    public String mypage(UserVO vo,HttpSession session , Model model) {
      UserVO uvo = (UserVO)session.getAttribute("login_info");
      System.out.println(uvo);
      int userid = uvo.getNo();
      System.out.println(userid);
      
      model.addAttribute("map");
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
 	   public String deletemember(UserVO vo,HttpSession session,RedirectAttributes rttr, @RequestParam("pwd1") String pwd) throws Exception {
 		 UserVO ssvo = (UserVO)session.getAttribute("login_info");
 		 String sspwd = ssvo.getPwd();
 		 System.out.println("sspwd : " + sspwd);
 		System.out.println("pwd : " + pwd);
 		 if(!(sspwd.equals(pwd)) ||  pwd==null) {
 			 rttr.addFlashAttribute("msg", false);
 			 return null;
 		 }
 		 userservice.deleteUser(vo);
 		 session.invalidate();
 	     return "redirect:index.jsp";
 	   }
 	   
 	@RequestMapping(value = "/updatemyinfo.do", method = RequestMethod.POST)
 	public String update(UserVO vo, HttpSession session) throws Exception {
 		System.out.println("야미");
 		
 		userservice.updateUser(vo);
 		session.invalidate();
 		return "redirect:/";
 	}
 	
 	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
       
       /* 뷰(View)로부터 넘어온 데이터 확인 */

             
       /* 인증번호(난수) 생성 */
       Random random = new Random();
       int checkNum = random.nextInt(888888) + 111111;

       
       /* 이메일 보내기 */
       String setFrom = "cwj9799@naver.com";
       String toMail = email;
       String title = "회원가입 인증 이메일 입니다.";
       String content = 
             "홈페이지를 방문해주셔서 감사합니다." +
             "<br><br>" + 
             "인증 번호는 " + checkNum + "입니다." + 
             "<br>" + 
             "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";      
       
       try {
          
          MimeMessage message = mailSender.createMimeMessage();
          MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
          helper.setFrom(setFrom);
          helper.setTo(toMail);
          helper.setSubject(title);
          helper.setText(content,true);
          mailSender.send(message);
          
       }catch(Exception e) {
          e.printStackTrace();
       }      
       
       String num = Integer.toString(checkNum);
       
       return num;
       
    }
 	
 	

}