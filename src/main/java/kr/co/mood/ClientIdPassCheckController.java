package kr.co.mood;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("/searchEmailCheck")
	@ResponseBody
	public Map<String, Object> searchEmailChecking(String email) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		if(userService.findEmail(email) != null) {

			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;

			/*String setFrom = "kjm1709@naver.com";
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
			}*/

			String num = Integer.toString(checkNum);
			map.put("num", num);
			map.put("id", userService.findEmail(email).getId());
			System.out.println("1");
			return map;			

		}else {
		map.put("num", "none");
		System.out.println("2");
		}
		return map;
	}
	
}
