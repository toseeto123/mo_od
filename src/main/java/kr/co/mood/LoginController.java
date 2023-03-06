package kr.co.mood;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import kr.co.mood.user.dao.UserDAO;
import kr.co.mood.user.dao.UserVO;

public class LoginController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("로그인 처리");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPwd(pwd);
		
		UserDAO userDAO = new UserDAO();
		UserVO user = userDAO.getUser(vo);
		
		ModelAndView mav = new ModelAndView();
		if(user != null) {
			mav.setViewName("redirect:index.jsp");
		} else {
			mav.setViewName("redirect:login.jsp");
		}
		
		return mav;
	}


}
