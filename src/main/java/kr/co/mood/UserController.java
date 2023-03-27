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

@RequestMapping("/users")
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
	
	@RequestMapping("/naverLogin")
	   public void naverLogin(@RequestParam("code") String code, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
	       String access_Token = ms.getNaverAccessToken(code, session);
	       UserVO naverUserInfo =  ms.getNaverUserInfo(access_Token, session);
	       session.setAttribute("login_info", naverUserInfo);
	       session.setAttribute("access_token", access_Token);
	       String path = (String) session.getAttribute("path");
	       
	       String referer = request.getHeader("Referer") != null ? request.getHeader("Referer") : "http://localhost:8080";
	
	       response.setContentType("text/html; charset=UTF-8");
	       PrintWriter out = response.getWriter();
	       out.println("<script>");
	       out.println("window.opener.location.href='" + referer + "';");
	       out.println("window.close();");
	       out.println("</script>");
	       out.flush();
	       
	   }
	   @RequestMapping(value = "/login" , method = RequestMethod.GET)
	   public String login(ModelMap model) {
		   System.out.println("get諛⑹떇");
		   String naverUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=dClx55_VYi9U61rOGPS2&redirect_uri=http://localhost:8080/users/naverLogin&state=bd5ab073-7709-4a54-b537-86cd901cf301";
	       model.addAttribute( "naverUrl", naverUrl ); 
	      
	      return "User/login";
	      }
		
		@RequestMapping(value = "/join" , method = RequestMethod.GET)
	   public String join() {
	      return "User/join";
	   }
		@RequestMapping(value = "/join", method = RequestMethod.POST)
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
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(UserVO vo) throws Exception {
		int result = userservice.idChk(vo);
		return result;
	}
   

   @RequestMapping(value = "/login", method = RequestMethod.POST)
   public String loginAction(@ModelAttribute("cvo") CateVO cvo,UserVO vo, HttpSession session, HttpServletRequest request, RedirectAttributes ra,Model model) {
	   System.out.println("post諛⑹떇");
       UserVO vo1 = userservice.selectId(vo);
       
       if (vo1 == null || vo1.getId().equals("admin")) {
           session.setAttribute("login_info", null);
           ra.addFlashAttribute("msg", false);
           return "redirect:/users/login";
       } else {
           session.setAttribute("login_info", vo1);
           String path = (String) session.getAttribute("path");
           
           if (path == null) {
               return "redirect:/";
           } else if (path.contains("catelogin.do")) {
        	   session.setAttribute("path", request.getRequestURI()); 
               return "redirect:/users/bucket";
           } else if (path.contains("proCatelogin.do")) {
        	   session.setAttribute("path", request.getRequestURI()); 
        	   CateVO sessionCvo = (CateVO) session.getAttribute("cvo"); 
               int userid = vo1.getNo();
               sessionCvo.setUser_no(userid);
        	   if (sessionCvo != null) {
        		   cateService.addcate(sessionCvo, vo1, null);
               }
               return "redirect:/users/bucket";
           } else if(path.contains("payBeLogin.do")) {	   
        	session.setAttribute("path", request.getRequestURI()); // 占쎌겱占쎌삺 野껋럥以� 占쏙옙占쎌삢
        	

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
       session.setAttribute("path", request.getRequestURI()); // 占쎌겱占쎌삺 野껋럥以� 占쏙옙占쎌삢
       
       return "redirect:/login.do";
   }
   @RequestMapping(value = "/proCatelogin.do", method = RequestMethod.GET)
   public String proCatelogin(@ModelAttribute("cvo") CateVO cvo, HttpSession session, ModelAndView mav,HttpServletRequest request) {
	  session.setAttribute("path", request.getRequestURI()); // 占쎌겱占쎌삺 野껋럥以� 占쏙옙占쎌삢
	  
      session.setAttribute("cvo", cvo); // CateVO 揶쏆빘猿쒐몴占� 占쎄쉭占쎈�∽옙肉� 占쏙옙占쎌삢
      return "redirect:/login.do";
   }
   @RequestMapping(value = "/payBeLogin.do", method = RequestMethod.GET)
   public String payBeLogin(@ModelAttribute("ordervo") userOrderVO ordervo,@ModelAttribute("orderProVo") userOrderProductVO orderProVo, HttpSession session, ModelAndView mav,HttpServletRequest request) {
	  session.setAttribute("path", request.getRequestURI()); // 占쎌겱占쎌삺 野껋럥以� 占쏙옙占쎌삢
      

      return "redirect:/login.do";
   }
   
   @RequestMapping("/logout")
   public String logout(HttpSession session) {
      session.getAttribute("login_info");
      session.invalidate();
      
      return "redirect:/";
   }

 	@RequestMapping(value = "/mypage" , method = RequestMethod.GET)
    public String mypage(UserVO vo,HttpSession session , Model model) {
		UserVO uvo = (UserVO) session.getAttribute("login_info");
		String str = uvo.getAdr();
		if(str==null) {
			session.setAttribute("myinfo_adr1", "  ");
			session.setAttribute("myinfo_adr2", "  ");
			session.setAttribute("myinfo_adr3", "  ");
		}else {
		String[] array = str.split("   ");
		session.setAttribute("myinfo_adr1", array[0]);
		session.setAttribute("myinfo_adr2", array[1]);
		session.setAttribute("myinfo_adr3", array[2]);
		}
		int userid = uvo.getNo();
		model.addAttribute("map", cateService.selectCateList(userid));
		model.addAttribute("orders", kakaoService.selectlist(userid));
		return "User/mypage";
	}


	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String deletemember(HttpSession session) throws Exception {
		UserVO ssvo = (UserVO) session.getAttribute("login_info");
		String ssid = ssvo.getId();
		userservice.delete(ssid);
		session.invalidate();
		return "redirect:index.jsp";
	}

	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String update(UserVO vo, HttpSession session) throws Exception {
		userservice.update(vo);
		session.invalidate();
		return "User/login";
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
