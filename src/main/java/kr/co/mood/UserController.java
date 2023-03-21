package kr.co.mood;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.mood.Payment.VO.userOrderProductVO;
import kr.co.mood.Payment.VO.userOrderVO;
import kr.co.mood.cate.DAO.CateService;
import kr.co.mood.cate.vo.CateVO;
import kr.co.mood.pay.DAO.productPaymentService;
import kr.co.mood.pay.DAO.userPaymentService;
import kr.co.mood.user.dao.UserService;
import kr.co.mood.user.dao.UserVO;

@Controller
@SessionAttributes("loginUser")
public class UserController {
	@Autowired
	private UserService userservice;
	private SqlSessionTemplate mybatis;
	private UserVO vo;
	private ModelAndView mav;

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private CateService cateService;
	@Autowired
	userPaymentService payService;
	@Autowired
	productPaymentService productPayService;
	

	@RequestMapping(value = "/googleSave", method = RequestMethod.POST)
	@ResponseBody
	public String googleSave(@RequestBody String googleJsonData, HttpSession session) throws Exception {

		ObjectMapper mapper = new ObjectMapper();
		JsonNode jsonParsing;
		jsonParsing = mapper.readTree(googleJsonData);
		int age = Integer.parseInt(jsonParsing.get("age").asText()) / 10;
		
		UserVO googleVO = new UserVO();
		googleVO.setEmail(jsonParsing.get("email").asText());
		googleVO.setId(jsonParsing.get("email").asText());
		googleVO.setName(jsonParsing.get("name").asText());
		googleVO.setAge((age * 10) + "~" + ((age * 10) + 9));
		
		int result = userservice.idChk(googleVO);
		
		if (result == 0) {
			userservice.insertnaver(googleVO);
			session.setAttribute("login_info", googleVO);
		} else {
			session.setAttribute("login_info", googleVO);
		}

		return (String) session.getAttribute("path");
	}

	// 占쎄퐬占쎌뵠甕곤옙 嚥≪뮄�젃占쎌뵥
	@RequestMapping(value = "/naverSave", method = RequestMethod.POST)

	public @ResponseBody String naverSave(UserVO uservo, HttpSession session) throws Exception {

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
			if (result == 1) {

				return "/";

			} else if (result == 0) {
				System.out.println("揶쏉옙占쎌뿯獄쏅뗀以덌쭪袁る뻬~");
				userservice.insertnaver(naver);
				session.setAttribute("login_info", naver);
				return "/";
			}

		} catch (Exception e) {
			throw new RuntimeException();
		}

		if (uservo != null) {
			str = "ok";
		}
		return str;
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
   @RequestMapping(value = "/login.do", method = RequestMethod.POST)
   public String loginAction(@ModelAttribute("cvo") CateVO cvo,UserVO vo, HttpSession session, HttpServletRequest request, RedirectAttributes ra,Model model) {
       UserVO vo1 = userservice.selectId(vo);
       
       if (vo1 == null) {
           session.setAttribute("login_info", null);
           request.setAttribute("msg", false);
           return "redirect:/login.do";
       } else {
           session.setAttribute("login_info", vo1);
           
           // path 가져오기
           String path = (String) session.getAttribute("path");
           
           if (path == null) {
               return "redirect:/index.jsp";
           } else if (path.contains("catelogin.do")) { // 장바구니 페이지에서 왔다면
        	   session.setAttribute("path", request.getRequestURI()); // 현재 경로 저장
               return "redirect:/cate.do";
           } else if (path.contains("proCatelogin.do")) {
        	   session.setAttribute("path", request.getRequestURI()); // 현재 경로 저장
        	   CateVO sessionCvo = (CateVO) session.getAttribute("cvo"); // 세션에서 CateVO 객체를 받아옴;
               int userid = vo1.getNo();
               sessionCvo.setUser_no(userid);
        	   if (sessionCvo != null) {
        		   cateService.addcate(sessionCvo, vo1, null);
               }
               return "redirect:/cate.do";
           } else if(path.contains("payBeLogin.do")) {	   
        	session.setAttribute("path", request.getRequestURI()); // 현재 경로 저장
        	

         	userOrderVO sessionordervo = (userOrderVO) session.getAttribute("ordervo");
         	userOrderProductVO sessionorderprovo = (userOrderProductVO) session.getAttribute("orderProVo");
         	int userid = vo1.getNo();

         	sessionordervo.setUserNo(userid);
         	payService.insert(sessionordervo, vo1, null);
         	int orderid = sessionordervo.getOrderId();
         	sessionorderprovo.setUserno(userid);
         	sessionorderprovo.setOrderId(orderid);

            productPayService.insert(sessionorderprovo, vo1, null);
            
            
            model.addAttribute("orders", productPayService.selectList(orderid));

         	return "/User/userPayOne";
           }
           else {
               return "redirect:" + path;
           }
       }
   }

   @RequestMapping(value = "/catelogin.do", method = RequestMethod.GET)
   public String catelogin(HttpSession session, HttpServletRequest request) {
       session.setAttribute("path", request.getRequestURI()); // 현재 경로 저장
       
       return "redirect:/login.do";
   }
   @RequestMapping(value = "/proCatelogin.do", method = RequestMethod.GET)
   public String proCatelogin(@ModelAttribute("cvo") CateVO cvo, HttpSession session, ModelAndView mav,HttpServletRequest request) {
	  session.setAttribute("path", request.getRequestURI()); // 현재 경로 저장
	  
      session.setAttribute("cvo", cvo); // CateVO 객체를 세션에 저장
      return "redirect:/login.do";
   }
   @RequestMapping(value = "/payBeLogin.do", method = RequestMethod.GET)
   public String payBeLogin(@ModelAttribute("ordervo") userOrderVO ordervo,@ModelAttribute("orderProVo") userOrderProductVO orderProVo, HttpSession session, ModelAndView mav,HttpServletRequest request) {
	  session.setAttribute("path", request.getRequestURI()); // 현재 경로 저장
      

      return "redirect:/login.do";
   }
   
   
   
   
 	@RequestMapping("/logout.do")
 		public String logout(UserVO vo,HttpSession session) {
 			session.setAttribute("login_info", vo);
 			session.invalidate();
 			return "redirect:index.jsp";
 		}



	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage(UserVO vo, HttpSession session, Model model) {
		UserVO uvo = (UserVO) session.getAttribute("login_info");
		System.out.println(uvo);
		int userid = uvo.getNo();
		System.out.println(userid);
		model.addAttribute("map", cateService.selectCateList(userid));
		return "User/mypage";
	}

	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(UserVO vo) throws Exception {
		int result = userservice.idChk(vo);
		return result;
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String postRegister(UserVO vo) throws Exception {
		int result = userservice.idChk(vo);
		try {
			if (result == 1) {
				return "/User/join";
			} else if (result == 0) {
				userservice.insert(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "User/login";
	}

	@RequestMapping(value = "/deletemember.do", method = RequestMethod.GET)
	public String deletemember(UserVO vo, HttpSession session, RedirectAttributes rttr,
			@RequestParam("pwd1") String pwd) throws Exception {
		UserVO ssvo = (UserVO) session.getAttribute("login_info");
		String sspwd = ssvo.getPwd();
		System.out.println("sspwd : " + sspwd);
		System.out.println("pwd : " + pwd);
		if (!(sspwd.equals(pwd)) || pwd == null) {
			rttr.addFlashAttribute("msg", false);
			return null;
		}
		userservice.deleteUser(vo);
		session.invalidate();
		return "redirect:index.jsp";
	}

	@RequestMapping(value = "/updatemyinfo.do", method = RequestMethod.POST)
	public String update(UserVO vo, HttpSession session) throws Exception {
		System.out.println("�뜝�럥�뒍亦껋꼻�삕");

		userservice.updateUser(vo);
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		String setFrom = "cwj9799@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);

		return num;

	}

}
