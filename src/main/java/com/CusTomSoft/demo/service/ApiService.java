package com.CusTomSoft.demo.service;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.stereotype.Service;

import com.CusTomSoft.demo.dto.ApiDto;

@Service
public class ApiService {
   
   
   private String clientId = "Kh9GukjWseVG6vEELsFW";
   
   private String clientSecret="o6rkzUAjWn";
      
   public String getChinese(ApiDto dd) {
      String korean = dd.getKorean();
      String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
      String text;
      String result = "";
      String line = "";
      System.out.println("1차");
      try {
         text = URLEncoder.encode(korean, "UTF-8");
         String param = "source=ko&target=zh-CN&text=" + text;
         URL url = new URL(apiURL);
         HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
         con.setRequestProperty("X-Naver-Client-Id", clientId);
         con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
         con.setRequestMethod("POST");
         con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
         con.setDoInput(true);
         con.setDoOutput(true);
         con.setUseCaches(false);
         con.setDefaultUseCaches(false);   

         OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream());
         osw.write(param);
         osw.flush();

         int responseCode = con.getResponseCode();
			/*
			 * result += "responseCode  : " + responseCode; result += "\n"; //주석처리 한 이유 json형태가 깨짐
			 */
            // 200코드가 아니면 오류인데 무엇이 오류 인지 디버깅 
         if (responseCode != 200) {
            Map<String, List<String>> map = con.getRequestProperties();
            result += "Printing Response Header...\n";
            for (Map.Entry<String, List<String>> entry : map.entrySet()) {
               if (entry.getKey().equals("apikey")) {
                  result += "";
               } else {
                  result += "Key : " + entry.getKey() + " ,Value : " + entry.getValue();
               }
            }
         }

         BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            // 여긴 출력 
         while ((line = br.readLine()) != null) {
            result += line + "\n";
         }
         br.close();

      } catch (UnsupportedEncodingException e) {
         throw new RuntimeException("인코딩 실패", e);
      } catch (IOException e) {
         result = e.getMessage();
      }

      return result;
   }
//English
   public String getEnglish(ApiDto dd) {
      String korean = dd.getKorean();
      String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
      String text;
      String result = "";
      String line = "";
      System.out.println("2차");
      try {
         text = URLEncoder.encode(korean, "UTF-8");
         String param = "source=ko&target=en&text=" + text;		  
         URL url = new URL(apiURL);
         HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
         con.setRequestProperty("X-Naver-Client-Id", clientId);
         con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
         con.setRequestMethod("POST");
         con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
         con.setDoInput(true);
         con.setDoOutput(true);
         con.setUseCaches(false);
         con.setDefaultUseCaches(false);   

         OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream());
         osw.write(param);
         osw.flush();

         int responseCode = con.getResponseCode();
         System.out.println(responseCode);
			/*
			 * result += "responseCode  : " + responseCode; result += "\n";
			 */
            // 200코드가 아니면 오류인데 무엇이 오류 인지 디버깅 
         if (responseCode != 200) {
            Map<String, List<String>> map = con.getRequestProperties();
            result += "Printing Response Header...\n";
            for (Map.Entry<String, List<String>> entry : map.entrySet()) {
               if (entry.getKey().equals("apikey")) {
                  result += "";
               } else {
                  result += "Key : " + entry.getKey() + " ,Value : " + entry.getValue();
               }
            }
         }

         BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            // 여긴 출력 
         while ((line = br.readLine()) != null) {
            result += line + "\n";
         }
         br.close();

      } catch (UnsupportedEncodingException e) {
         throw new RuntimeException("인코딩 실패", e);
      } catch (IOException e) {
         result = e.getMessage();
      }

      return result;
   }

   

   
          
       

}
   

