package kr.co.mood.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mood.user.dao.UserService;
import kr.co.mood.user.dao.UserVO;

@Controller
public class ClientIdPassCheckController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("/searchId")
	public String toGoIdCheck() {
		return "User/search_id";
	}
	
	@RequestMapping("/searchPwd")
	public String toGoPwdCheck() {
		return "User/search_pwd";
	}
	
	@RequestMapping("/searchIdCheck")
	@ResponseBody
	public String searchIdChecking(String id){
		UserVO vo = new UserVO();
		vo.setId(id);
		try {
			if(userService.idChk(vo) > 0) {
				return "Success";
			}else {
				return "Fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	@RequestMapping("/searchEmail")
	@ResponseBody
	public String emailCheck(String email) {
		try {
		if(userService.findEmail(email).get(0).getEmail()!= null) {
			return "Success";
		}
		}catch(Exception e) {
			return "Fail";
		}
		return "";
		
	}
	
	@RequestMapping("/searchIdEmail")
	@ResponseBody
	public String emailSearch(String id, String email) {
		for(UserVO vo : userService.findEmail(email)) {
			if(id.equals(vo.getId())) {
				return "Success";
			}
		}
		return "Fail";
		
	}
	
	
	@RequestMapping("/sendEmail")
	@ResponseBody
	public Map<String, Object> searchEmailChecking(String email) {
		
		Map<String, Object> map = new HashMap<String, Object>();


			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;

			String setFrom = "cwj9799@naver.com";
			String toMail = email;
			String title = "인증번호 이메일 입니다.";
			String content ="인증 번호는 " + checkNum + "입니다." + "<br>"
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
				System.out.println("에러야");
			}
			List<UserVO> list = userService.findEmail(email);
			for(int i=0; i<list.size(); i++) {
				list.get(i).setName("nope");
				list.get(i).setAdr("nope");
				list.get(i).setAdr2("nope");
				list.get(i).setAdr3("nope");
				list.get(i).setAge("nope");
				list.get(i).setGender("nope");
				list.get(i).setNo(0);
				list.get(i).setPartner_user_id(0);
				list.get(i).setPhone("nope");
				list.get(i).setPwd("nope");
			}
		
			String num = Integer.toString(checkNum);
			map.put("num", num);
			
			map.put("id",list);
			return map;			
	}
	
	
	@RequestMapping("/passwordChange")
	@ResponseBody
	public String passwordChange(String id, String email, String pwd) {
		UserVO userVo = new UserVO();
		userVo.setId(id);
		userVo.setPwd(pwd);
		try {
			userService.updatePwd(userVo);
		} catch (Exception e) {
			e.printStackTrace();
			return "False";
		}
		String setFrom = "cwj9799@naver.com";
		String toMail = email;
		String title = "임시 비밀번호 발급 이메일입니다.";
		String content ="임시 비밀번호는 " + pwd + "입니다.";

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
		
		return "Success";
	}
	
}
