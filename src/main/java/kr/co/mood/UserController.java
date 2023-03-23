package kr.co.mood;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
import kr.co.mood.pay.DAO.KakaoPayApprovalService;
import kr.co.mood.pay.DAO.productPaymentService;
import kr.co.mood.pay.DAO.userPaymentService;
import kr.co.mood.user.dao.MemberService;
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
	private HttpSession session;
	
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private CateService cateService;
	@Autowired
	private KakaoPayApprovalService kakaoService;
	@Autowired
	userPaymentService payService;
	@Autowired
	productPaymentService productPayService;
	@Autowired
	private MemberService ms;
	
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
	@RequestMapping(value="/user/*")
	public class MemberController {
		@Autowired
		private MemberService ms;
		@Autowired
		private HttpSession session;

		@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
		public String kakaoLogin(@RequestParam(value = "code", required = false) String code ) throws Exception {
			System.out.println("#########" + code);
			
			String access_Token = ms.getAccessToken(code);
			
			
			UserVO userInfo = ms.getUserInfo(access_Token);	
			// �븘�옒 肄붾뱶媛� 異붽��릺�뒗 �궡�슜

			// �쐞 肄붾뱶�뒗 session媛앹껜�뿉 �떞湲� �젙蹂대�� 珥덇린�솕 �븯�뒗 肄붾뱶.
			session.setAttribute("login_info", userInfo);
			System.out.println("fdfd"+userInfo);
			
			return "redirect:/";
	    	}

	}
	
	@RequestMapping("/naverLogin")
	   public void naverLogin(@RequestParam("code") String code, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
	       String access_Token = ms.getNaverAccessToken(code, session);
	       UserVO naverUserInfo =  ms.getNaverUserInfo(access_Token, session);
	       session.setAttribute("login_info", naverUserInfo);
	       session.setAttribute("access_token", access_Token);
	       
	       String referer = request.getHeader("Referer") != null ? request.getHeader("Referer") : "http://localhost:8080";

	       response.setContentType("text/html; charset=UTF-8");
	       PrintWriter out = response.getWriter();
	       out.println("<script>");
	       out.println("window.opener.location.href='" + referer + "';");
	       out.println("window.close();");
	       out.println("</script>");
	       out.flush();
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
   public String login(ModelMap model) {
	   String naverUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=dClx55_VYi9U61rOGPS2&redirect_uri=http://localhost:8080/naverLogin&state=bd5ab073-7709-4a54-b537-86cd901cf301";
       model.addAttribute( "naverUrl", naverUrl ); 
      
      return "User/login";
      }
   @RequestMapping(value = "/login.do", method = RequestMethod.POST)
   public String loginAction(@ModelAttribute("cvo") CateVO cvo,UserVO vo, HttpSession session, HttpServletRequest request, RedirectAttributes ra,Model model) {
       UserVO vo1 = userservice.selectId(vo);
       
       if (vo1 == null) {
           session.setAttribute("login_info", null);
           ra.addFlashAttribute("msg", false);
           return "redirect:/login.do";
       } else {
           session.setAttribute("login_info", vo1);
           
           // path 媛��졇�삤湲�
           String path = (String) session.getAttribute("path");
           
           if (path == null) {
               return "redirect:/index.jsp";
           } else if (path.contains("catelogin.do")) { // �옣諛붽뎄�땲 �럹�씠吏��뿉�꽌 �솕�떎硫�
        	   session.setAttribute("path", request.getRequestURI()); // �쁽�옱 寃쎈줈 ���옣
               return "redirect:/cate.do";
           } else if (path.contains("proCatelogin.do")) {
        	   session.setAttribute("path", request.getRequestURI()); // �쁽�옱 寃쎈줈 ���옣
        	   CateVO sessionCvo = (CateVO) session.getAttribute("cvo"); // �꽭�뀡�뿉�꽌 CateVO 媛앹껜瑜� 諛쏆븘�샂;
               int userid = vo1.getNo();
               sessionCvo.setUser_no(userid);
        	   if (sessionCvo != null) {
        		   cateService.addcate(sessionCvo, vo1, null);
               }
               return "redirect:/cate.do";
           } else if(path.contains("payBeLogin.do")) {	   
        	session.setAttribute("path", request.getRequestURI()); // �쁽�옱 寃쎈줈 ���옣
        	

         	userOrderVO sessionordervo = (userOrderVO) session.getAttribute("ordervo");
         	userOrderProductVO sessionorderprovo = (userOrderProductVO) session.getAttribute("orderProVo");
         	int userid = vo1.getNo();

         	sessionordervo.setUserNo(userid);
         	payService.insert(sessionordervo, vo1, null);
         	int orderid = sessionordervo.getOrderId();
         	sessionorderprovo.setUserno(userid);
         	sessionorderprovo.setOrderId(orderid);

            productPayService.insert(sessionorderprovo, vo1, null);
            
            
            model.addAttribute("onelist", productPayService.selectList(orderid));

         	return "/User/userPay";
           }
           else {
               return "redirect:" + path;
           }
       }
   }
   @RequestMapping(value = "/catelogin.do", method = RequestMethod.GET)
   public String catelogin(HttpSession session, HttpServletRequest request) {
       session.setAttribute("path", request.getRequestURI()); // �쁽�옱 寃쎈줈 ���옣
       
       return "redirect:/login.do";
   }
   @RequestMapping(value = "/proCatelogin.do", method = RequestMethod.GET)
   public String proCatelogin(@ModelAttribute("cvo") CateVO cvo, HttpSession session, ModelAndView mav,HttpServletRequest request) {
	  session.setAttribute("path", request.getRequestURI()); // �쁽�옱 寃쎈줈 ���옣
	  
      session.setAttribute("cvo", cvo); // CateVO 媛앹껜瑜� �꽭�뀡�뿉 ���옣
      return "redirect:/login.do";
   }
   @RequestMapping(value = "/payBeLogin.do", method = RequestMethod.GET)
   public String payBeLogin(@ModelAttribute("ordervo") userOrderVO ordervo,@ModelAttribute("orderProVo") userOrderProductVO orderProVo, HttpSession session, ModelAndView mav,HttpServletRequest request) {
	  session.setAttribute("path", request.getRequestURI()); // �쁽�옱 寃쎈줈 ���옣
      

      return "redirect:/login.do";
   }
   
   @RequestMapping("/logout.do")
   public String logout(HttpSession session) {
      session.getAttribute("login_info");
      System.out.println("濡쒓렇�븘�썐1");
      session.invalidate();
      
      return "redirect:index.jsp";
   }

 	@RequestMapping(value = "/mypage.do" , method = RequestMethod.GET)
    public String mypage(UserVO vo,HttpSession session , Model model) {
		UserVO uvo = (UserVO) session.getAttribute("login_info");
		System.out.println(uvo);
		int userid = uvo.getNo();
		System.out.println(userid);
		model.addAttribute("map", cateService.selectCateList(userid));
		model.addAttribute("orders", kakaoService.selectlist(userid));
		System.out.println(kakaoService);
		System.out.println(kakaoService.selectlist(userid));
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
		System.out.println("�뾽�뜲�씠�듃�븯�옄!");
		
		userservice.updateUser(vo);
		System.out.println(vo);
		
		return "User/mypage";
		
	}

	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		String setFrom = "cwj9799@naver.com";
		String toMail = email;
		String title = "�쉶�썝媛��엯 �씤利� �씠硫붿씪 �엯�땲�떎.";
		String content = "�솃�럹�씠吏�瑜� 諛⑸Ц�빐二쇱뀛�꽌 媛먯궗�빀�땲�떎." + "<br><br>" + "�씤利� 踰덊샇�뒗 " + checkNum + "�엯�땲�떎." + "<br>"
				+ "�빐�떦 �씤利앸쾲�샇瑜� �씤利앸쾲�샇 �솗�씤���뿉 湲곗엯�븯�뿬 二쇱꽭�슂.";

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
