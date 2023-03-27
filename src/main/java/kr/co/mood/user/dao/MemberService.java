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
         sb.append("&client_id=e862dc15e41ee83edaac20240a8bc9e5"); //본인이 발급받은 key
//         sb.append("&redirect_uri=http://localhost:8080/member/kakaoLogin"); 
         sb.append("&redirect_uri=http://3.39.221.200:8080/member/kakaoLogin"); 
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
         
         userInfo.put("nickname", nickname);
         userInfo.put("email", email);
         userInfo.put("age_range", age_range);
         
         
      } catch (IOException e) {
         e.printStackTrace();
      }

      // catch 아래 코드 추가.
      UserVO result = userdao.findkakao(userInfo);
      // 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
      if(result==null) {
      // result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
         userdao.kakaoinsert(userInfo);
         // 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
         return userdao.findkakao(userInfo);
         // 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
         //  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
      } else {
         return result;
         
      }
        
   }
   

   public String getNaverAccessToken (String authorize_code,HttpSession session) {
         String access_Token = "";
         String reqURL = "https://nid.naver.com/oauth2.0/token";
        
           try {
               URL url = new URL(reqURL);
               HttpURLConnection conn = (HttpURLConnection) url.openConnection();
               
               //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
               conn.setRequestMethod("POST");
               conn.setDoOutput(true);
               //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
               BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
               StringBuilder sb = new StringBuilder();
               sb.append("grant_type=authorization_code");
               sb.append("&client_id=dClx55_VYi9U61rOGPS2");
               sb.append("&client_secret=MtrUDxfIj0");

//             sb.append("&redirect_uri=http://localhost:8080/login.do");
               sb.append("&redirect_uri=http://3.39.221.200:8080/login.do");

               sb.append("&code="+authorize_code);
               sb.append("&state=url_parameter");

               
               session.setAttribute("sb", sb);
               bw.write(sb.toString());
               bw.flush();
               
               
               //결과 코드가 200이라면 성공
               int responseCode = conn.getResponseCode();
               if(responseCode==200){
                  //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
                  BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                  String line = "";
                  String result = "";
                  
                  while ((line = br.readLine()) != null) {
                      result += line;
                  }
                  
                  //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
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
       //요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
       HashMap<String, Object> naverUserInfo = new HashMap<String, Object>();
       String reqURL = "https://openapi.naver.com/v1/nid/me";
       try {
           URL url = new URL(reqURL);
           HttpURLConnection conn = (HttpURLConnection) url.openConnection();
           conn.setRequestMethod("POST");
          
           //요청에 필요한 Header에 포함될 내용
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
    // catch 아래 코드 추가.
          UserVO result = userdao.findNaver(naverUserInfo);
          // 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
          
          if(result==null) {
          // result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
             userdao.NaverInsert(naverUserInfo);
             // 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
             
             
             return userdao.findNaver(naverUserInfo);
             // 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
             //  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
             
             
          } else {
             
             return result;
             
          }
   }
   
}
   
