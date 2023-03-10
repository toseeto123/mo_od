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

   // 로그인이 없을시 로그인으로 넘어가야 할 사이트 '/' 빼고 기술해주세요
   static final String[] CLIENT_SITE_LIST = {};// Client만
   static final String[] ADMIN_SITE_LIST = { "chart.do", "payment.do", 
         "admincate.do", "insert.do", "adminProList.do", "adminProDetail" };//Admin만
   
   
   static final String[] COMMON_LIST = new String[CLIENT_SITE_LIST.length + ADMIN_SITE_LIST.length];

   static {
      int count = 0;
      for (String all : CLIENT_SITE_LIST) {
         COMMON_LIST[count++] = all;
      }
      for (String all : ADMIN_SITE_LIST) {
         COMMON_LIST[count++] = all;
      }
   }

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      String reqUrl = request.getRequestURI().toString();
      HttpSession session = request.getSession();
      UserVO userVO = (UserVO) session.getAttribute("login_info");

      String[] uriToken = reqUrl.split("/");

      for (String common : COMMON_LIST) {
         for (int i = 0; i < uriToken.length; i++) {
            if (common.matches(uriToken[i])) {
               if (userVO == null) {
                  response.sendRedirect(request.getContextPath() + "/login.do");
                  return false;
               }
            }
         }

      }

      for (String admin : ADMIN_SITE_LIST) {
         for (int i = 0; i < uriToken.length; i++) {
            if (admin.matches(uriToken[i])) {
               if (!userVO.getId().equals("admin")) {
                  session.invalidate();//혹시 몰라서 추가했을 뿐 삭제해도 상관없어 보입니다.
                  response.sendRedirect(request.getContextPath() + "/login.do");
                  return false;
               }
            }
         }
      }

      return true;
   }

}