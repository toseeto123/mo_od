package kr.co.mood.user.dao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@Service
public class MemberService {
   @Autowired
   private UserDAO userdao;
   
   public String getAccessToken (String authorize_code) {
      String access_Token = "";
      String refresh_Token = "";
      String reqURL = "https://kauth.kakao.com/oauth/token";
      try {
         URL url = new URL(reqURL);
         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
         conn.setRequestMethod("POST");
         conn.setDoOutput(true);
         BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
         StringBuilder sb = new StringBuilder();
         sb.append("grant_type=authorization_code");

         sb.append("&client_id=e862dc15e41ee83edaac20240a8bc9e5"); 
         sb.append("&redirect_uri=http://localhost:8080/users/kakaoLogin"); 
//         sb.append("&redirect_uri=http://mo-od.co.kr/users/kakaoLogin");




         sb.append("&code=" + authorize_code);
         bw.write(sb.toString());
         bw.flush();
         int responseCode = conn.getResponseCode();
         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
         String line = "";
         String result = "";
         while ((line = br.readLine()) != null) {
            result += line;
         }
         JsonParser parser = new JsonParser();
         JsonElement element = parser.parse(result);
         access_Token = element.getAsJsonObject().get("access_token").getAsString();
         refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
         br.close();
         bw.close();
      } catch (IOException e) {
         e.printStackTrace();
      }
      return access_Token;
   }
    
   public UserVO getUserInfo(String access_Token) {
      HashMap<String, Object> userInfo = new HashMap<String, Object>();
      String reqURL = "https://kapi.kakao.com/v2/user/me";
      try {
         URL url = new URL(reqURL);
         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
         conn.setRequestMethod("GET");
         conn.setRequestProperty("Authorization", "Bearer " + access_Token);
         int responseCode = conn.getResponseCode();
         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
         String line = "";
         String result = "";
         while ((line = br.readLine()) != null) {
            result += line;
         }
         JsonParser parser = new JsonParser();
         JsonElement element = parser.parse(result);
         JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
         JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
         String nickname = properties.getAsJsonObject().get("nickname").getAsString();
         String email = kakao_account.getAsJsonObject().get("email").getAsString();
         String age_range = kakao_account.getAsJsonObject().get("age_range").getAsString();
         String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
         
         userInfo.put("nickname", nickname);
         userInfo.put("email", email);
         userInfo.put("age_range", age_range);
         userInfo.put("gender", gender);
         System.out.println("userInfo"+userInfo);
         
         
      } catch (IOException e) {
         e.printStackTrace();
      }


      UserVO result = userdao.findkakao(userInfo);
      System.out.println("result"+result);
      if(result==null) {

         userdao.kakaoinsert(userInfo);

         return userdao.findkakao(userInfo);

      } else {
         return result;
         
      }
        
   }
   

   public String getNaverAccessToken (String authorize_code,HttpSession session, String state) {
         String access_Token = "";
         String reqURL = "https://nid.naver.com/oauth2.0/token";
        
           try {
               URL url = new URL(reqURL);
               HttpURLConnection conn = (HttpURLConnection) url.openConnection();
               

               conn.setRequestMethod("POST");
               conn.setDoOutput(true);

               BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
               StringBuilder sb = new StringBuilder();
               sb.append("grant_type=authorization_code");
               sb.append("&client_id=dClx55_VYi9U61rOGPS2");
               sb.append("&client_secret=MtrUDxfIj0");


             sb.append("&redirect_uri=http://localhost:8080/users/login");
//               sb.append("&redirect_uri=http://mo-od.co.kr/users/login");


               sb.append("&code="+authorize_code);
               sb.append("&state="+state);

               
               session.setAttribute("sb", sb);
               bw.write(sb.toString());
               bw.flush();
               int responseCode = conn.getResponseCode();
               System.out.println(responseCode);
               if(responseCode==200){
                  
                  BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                  String line = "";
                  String result = "";
                 
                  while ((line = br.readLine()) != null) {
                      result += line;
                  }
               
                  JsonParser parser = new JsonParser();
                  JsonElement element = parser.parse(result);
                  
                  access_Token = element.getAsJsonObject().get("access_token").getAsString();
                //refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
                  br.close();
                  bw.close();
               }
           } catch (IOException e) {
               e.printStackTrace();
           } 
           
           return access_Token;
       }
   
   public UserVO getNaverUserInfo (String access_Token,HttpSession session) {
       
       HashMap<String, Object> naverUserInfo = new HashMap<String, Object>();
       String reqURL = "https://openapi.naver.com/v1/nid/me";
       try {
           URL url = new URL(reqURL);
           HttpURLConnection conn = (HttpURLConnection) url.openConnection();
           conn.setRequestMethod("POST");
          
        
           conn.setRequestProperty("Authorization", "Bearer " + access_Token);
           
           int responseCode = conn.getResponseCode();
           if(responseCode == 200){
              BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
             
              String line = "";
              String result = "";
              
              while ((line = br.readLine()) != null) {
                  result += line;
              }
              JsonParser parser = new JsonParser();
              JsonElement element = parser.parse(result);
              
              JsonObject response = element.getAsJsonObject().get("response").getAsJsonObject();
              
              String name = response.getAsJsonObject().get("name").getAsString();
              String email = response.getAsJsonObject().get("email").getAsString();
              String id = "NAVER_"+response.getAsJsonObject().get("id").getAsString();
              String age = response.getAsJsonObject().get("age").getAsString();
              String gender  = response.getAsJsonObject().get("gender").getAsString();
              String mobile  = response.getAsJsonObject().get("mobile").getAsString();
             
              naverUserInfo.put("name", name);
              naverUserInfo.put("email", email);
              naverUserInfo.put("id", email);
              naverUserInfo.put("age", age);
              naverUserInfo.put("gender", gender);
              naverUserInfo.put("phone", mobile);
              session.setAttribute("response", response);
           }
       } catch (IOException e) {
           e.printStackTrace();
           
       }

          UserVO result = userdao.findNaver(naverUserInfo);

          if(result==null) {
         
             userdao.NaverInsert(naverUserInfo);

             
             return userdao.findNaver(naverUserInfo);
          
             
             
          } else {
             
             return result;
             
          }
   }
   
}
