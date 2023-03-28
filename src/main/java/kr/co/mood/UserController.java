package kr.co.mood;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	private UserService userservice;
	@Autowired
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
//	private SqlSessionTemplate mybatis;
//	private UserVO vo;
//	private ModelAndView mav;

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
			session.setAttribute("login_info", userservice.selectIdCheck(googleVO.getId()));
		} else {
			session.setAttribute("login_info", userservice.selectIdCheck(googleVO.getId()));
		}

		return (String) session.getAttribute("path");
	}

	@RequestMapping("/naverLogin")
	 public void naverLogin(@RequestParam("code") String code, HttpSession session, HttpServletResponse response, HttpServletRequest request,Model model) throws IOException {
	       String access_Token = ms.getNaverAccessToken(code, session);
	       UserVO naverUserInfo =  ms.getNaverUserInfo(access_Token, session);
	       session.setAttribute("login_info", naverUserInfo);
	       session.setAttribute("access_token", access_Token);
	       String path = (String) session.getAttribute("path");
	      
	       String pathgo = "";
	       if (path.contains("catelogin.do")) {
	           pathgo = "/users/bucket";
	       } else if (path.contains("proCatelogin.do")) {
	           CateVO sessionCvo = (CateVO) session.getAttribute("cvo");
	           int userid = naverUserInfo.getNo();
	           sessionCvo.setUser_no(userid);
	           if (sessionCvo != null) {
	               cateService.addcate(sessionCvo, naverUserInfo, null);
	           }
	           pathgo = "cate.do";
	       } else if (path.contains("payBeLogin.do")) {
	           userOrderVO sessionordervo = (userOrderVO) session.getAttribute("ordervo");
	           userOrderProductVO sessionorderprovo = (userOrderProductVO) session.getAttribute("orderProVo");
	           int userid = naverUserInfo.getNo();
	           sessionordervo.setUserNo(userid);
	           payService.insert(sessionordervo, naverUserInfo, null);
	           int orderid = sessionordervo.getOrderId();
	           sessionorderprovo.setUserno(userid);
	           sessionorderprovo.setOrderId(orderid);
	           productPayService.insert(sessionorderprovo, naverUserInfo, null);
	           model.addAttribute("onelist", productPayService.selectList(orderid));
	           pathgo = "orders";
	           
	       } else {
	           pathgo = path;
	       }
	       
	       String referer = request.getHeader("Referer") != null ? request.getHeader("Referer") : "http://localhost:8080/"+pathgo;
//	       String referer = request.getHeader("Referer") != null ? request.getHeader("Referer") : "http://3.39.221.200:8080";
	       
	       System.out.println(referer);
	       System.out.println(request.getHeader("Referer"));
	       response.setContentType("text/html; charset=UTF-8");
	       PrintWriter out = response.getWriter();
	       out.println("<script>");
	       out.println("window.opener.location.href='" + referer + "';");
	       out.println("window.close();");
	       out.println("</script>");
	       out.flush();
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		String naverUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=dClx55_VYi9U61rOGPS2&redirect_uri=http://localhost:8080/users/naverLogin&state=bd5ab073-7709-4a54-b537-86cd901cf301";
		model.addAttribute("naverUrl", naverUrl);
		return "User/login";
	}

	
	@RequestMapping(value={"/kakaoLogin" ,"/member/*"}, method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpServletRequest request, Model model , HttpSession session) throws Exception {
	    String access_Token = ms.getAccessToken(code);
	    UserVO userInfo = ms.getUserInfo(access_Token);
	    String path = (String) session.getAttribute("path");
	    session.setAttribute("login_info", userInfo);
	    if (path == null) {
	        return "redirect:/";
	    } else {
	        session.setAttribute("path", request.getRequestURI());
	        if (path.contains("catelogin.do")) {
	            return "redirect:/users/bucket";
	        } else if (path.contains("proCatelogin.do")) {
	            CateVO sessionCvo = (CateVO) session.getAttribute("cvo");
	            int userid = userInfo.getNo();
	            sessionCvo.setUser_no(userid);
	            if (sessionCvo != null) {
	                cateService.addcate(sessionCvo, userInfo, null);
	            }
	            return "redirect:/users/bucket";
	        } else if(path.contains("payBeLogin.do")) {
	            userOrderVO sessionordervo = (userOrderVO) session.getAttribute("ordervo");
	            userOrderProductVO sessionorderprovo = (userOrderProductVO) session.getAttribute("orderProVo");
	            int userid = userInfo.getNo();
	            sessionordervo.setUserNo(userid);
	            payService.insert(sessionordervo, userInfo, null);
	            int orderid = sessionordervo.getOrderId();
	            sessionorderprovo.setUserno(userid);
	            sessionorderprovo.setOrderId(orderid);
	            productPayService.insert(sessionorderprovo, userInfo, null);
	            model.addAttribute("onelist", productPayService.selectList(orderid));
	            return "/User/userPay";
	        } else {
	            return "redirect:" + path;
	        }
	    }
	}


	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "User/join";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginAction(@ModelAttribute("cvo") CateVO cvo, UserVO vo, HttpSession session,
			HttpServletRequest request, RedirectAttributes ra, Model model) {
		System.out.println("post방식");
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
			} else if (path.contains("payBeLogin.do")) {
				session.setAttribute("path", request.getRequestURI());

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
			} else {
				return "redirect:" + path;
			}
		}
	}
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(UserVO vo) throws Exception {
		int result = userservice.idChk(vo);
		return result;
	}

	@RequestMapping(value = "/catelogin.do", method = RequestMethod.GET)
	public String catelogin(HttpSession session, HttpServletRequest request) {
		session.setAttribute("path", request.getRequestURI()); // �쁽�옱 寃쎈줈 ���옣

		return "redirect:/users/login";
	}

	@RequestMapping(value = "/proCatelogin.do", method = RequestMethod.GET)
	public String proCatelogin(@ModelAttribute("cvo") CateVO cvo, HttpSession session, ModelAndView mav,
			HttpServletRequest request) {
		session.setAttribute("path", request.getRequestURI()); // �쁽�옱 寃쎈줈 ���옣

		session.setAttribute("cvo", cvo); // CateVO 媛앹껜瑜� �꽭�뀡�뿉 ���옣
		return "redirect:/users/login";
	}

	@RequestMapping(value = "/payBeLogin.do", method = RequestMethod.GET)
	public String payBeLogin(@ModelAttribute("ordervo") userOrderVO ordervo,
			@ModelAttribute("orderProVo") userOrderProductVO orderProVo, HttpSession session, ModelAndView mav,
			HttpServletRequest request) {
		session.setAttribute("path", request.getRequestURI()); // �쁽�옱 寃쎈줈 ���옣

		return "redirect:/users/login";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.getAttribute("login_info");
		session.invalidate();

		return "redirect:/";

	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(UserVO vo, HttpSession session, Model model) {
		UserVO uvo = (UserVO) session.getAttribute("login_info");
		String str = uvo.getAdr();
		if (str == null) {
			session.setAttribute("myinfo_adr1", "  ");
			session.setAttribute("myinfo_adr2", "  ");
			session.setAttribute("myinfo_adr3", "  ");
		} else {
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
		return "/User/login";
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
