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
         sb.append("&client_id=e862dc15e41ee83edaac20240a8bc9e5"); //蹂몄씤�씠 諛쒓툒諛쏆� key


//         sb.append("&redirect_uri=http://localhost:8080/users/kakaoLogin"); 
         sb.append("&redirect_uri=http://mo-od.co.kr/users/kakaoLogin");



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

      // catch �븘�옒 肄붾뱶 異붽�.
      UserVO result = userdao.findkakao(userInfo);
      // �쐞 肄붾뱶�뒗 癒쇱� �젙蹂닿� ���옣�릺�엳�뒗吏� �솗�씤�븯�뒗 肄붾뱶.
      if(result==null) {
      // result媛� null�씠硫� �젙蹂닿� ���옣�씠 �븞�릺�엳�뒗嫄곕�濡� �젙蹂대�� ���옣.
         userdao.kakaoinsert(userInfo);
         // �쐞 肄붾뱶媛� �젙蹂대�� ���옣�븯湲� �쐞�빐 Repository濡� 蹂대궡�뒗 肄붾뱶�엫.
         return userdao.findkakao(userInfo);
         // �쐞 肄붾뱶�뒗 �젙蹂� ���옣 �썑 而⑦듃濡ㅻ윭�뿉 �젙蹂대�� 蹂대궡�뒗 肄붾뱶�엫.
         //  result瑜� 由ы꽩�쑝濡� 蹂대궡硫� null�씠 由ы꽩�릺誘�濡� �쐞 肄붾뱶瑜� �궗�슜.
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
               
               //POST �슂泥��쓣 �쐞�빐 湲곕낯媛믪씠 false�씤 setDoOutput�쓣 true濡�
               conn.setRequestMethod("POST");
               conn.setDoOutput(true);
               //POST �슂泥��뿉 �븘�슂濡� �슂援ы븯�뒗 �뙆�씪誘명꽣 �뒪�듃由쇱쓣 �넻�빐 �쟾�넚
               BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
               StringBuilder sb = new StringBuilder();
               sb.append("grant_type=authorization_code");
               sb.append("&client_id=dClx55_VYi9U61rOGPS2");
               sb.append("&client_secret=MtrUDxfIj0");

//             sb.append("&redirect_uri=http://localhost:8080/users/login");
               sb.append("&redirect_uri=http://mo-od.co.kr/users/login");

               sb.append("&code="+authorize_code);
               sb.append("&state=url_parameter");

               
               session.setAttribute("sb", sb);
               bw.write(sb.toString());
               bw.flush();
               
               
               //寃곌낵 肄붾뱶媛� 200�씠�씪硫� �꽦怨�
               int responseCode = conn.getResponseCode();
               if(responseCode==200){
                  //�슂泥��쓣 �넻�빐 �뼸�� JSON���엯�쓽 Response 硫붿꽭吏� �씫�뼱�삤湲�
                  BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                  String line = "";
                  String result = "";
                  
                  while ((line = br.readLine()) != null) {
                      result += line;
                  }
                  
                  //Gson �씪�씠釉뚮윭由ъ뿉 �룷�븿�맂 �겢�옒�뒪濡� JSON�뙆�떛 媛앹껜 �깮�꽦
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
       //�슂泥��븯�뒗 �겢�씪�씠�뼵�듃留덈떎 媛�吏� �젙蹂닿� �떎瑜� �닔 �엳湲곗뿉 HashMap���엯�쑝濡� �꽑�뼵
       HashMap<String, Object> naverUserInfo = new HashMap<String, Object>();
       String reqURL = "https://openapi.naver.com/v1/nid/me";
       try {
           URL url = new URL(reqURL);
           HttpURLConnection conn = (HttpURLConnection) url.openConnection();
           conn.setRequestMethod("POST");
          
           //�슂泥��뿉 �븘�슂�븳 Header�뿉 �룷�븿�맆 �궡�슜
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
    // catch �븘�옒 肄붾뱶 異붽�.
          UserVO result = userdao.findNaver(naverUserInfo);
          // �쐞 肄붾뱶�뒗 癒쇱� �젙蹂닿� ���옣�릺�엳�뒗吏� �솗�씤�븯�뒗 肄붾뱶.
          
          if(result==null) {
          // result媛� null�씠硫� �젙蹂닿� ���옣�씠 �븞�릺�엳�뒗嫄곕�濡� �젙蹂대�� ���옣.
             userdao.NaverInsert(naverUserInfo);
             // �쐞 肄붾뱶媛� �젙蹂대�� ���옣�븯湲� �쐞�빐 Repository濡� 蹂대궡�뒗 肄붾뱶�엫.
             
             
             return userdao.findNaver(naverUserInfo);
             // �쐞 肄붾뱶�뒗 �젙蹂� ���옣 �썑 而⑦듃濡ㅻ윭�뿉 �젙蹂대�� 蹂대궡�뒗 肄붾뱶�엫.
             //  result瑜� 由ы꽩�쑝濡� 蹂대궡硫� null�씠 由ы꽩�릺誘�濡� �쐞 肄붾뱶瑜� �궗�슜.
             
             
          } else {
             
             return result;
             
          }
   }
   
}