package kr.co.mood.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.mood.user.dao.UserVO;

public class Interceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String reqUrl = request.getRequestURI().toString();
		HttpSession session = request.getSession();

		String[] uriToken = reqUrl.split("/");
		
		if (((UserVO) session.getAttribute("login_info")) != null) {
			for (int i = 0; i < uriToken.length; i++) {
				if ("admin".matches(uriToken[i])) {
					if (!((UserVO) session.getAttribute("login_info")).getId().equals("admin")) {
						session.invalidate();
						response.sendRedirect(request.getContextPath() + "/adminLogin.do");
						return false;
					}
				}
			}
		}else {
			response.sendRedirect(request.getContextPath() + "/adminLogin.do");
			return false;
		}

		return true;
	}

}
