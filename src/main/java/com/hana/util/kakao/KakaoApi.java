package com.hana.util.kakao;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

@Data
@NoArgsConstructor
@Builder
@Component
@Slf4j
public class KakaoApi {

    String kakaoApiKey;
    String kakaoRedirectUrl;

    public KakaoApi(String kakaoApiKey, String kakaoRedirectUrl) {
        this.kakaoApiKey = kakaoApiKey;
        this.kakaoRedirectUrl = kakaoRedirectUrl;
    }

    // access_token 추출 함수
    public String getAccessToken(String code) {
        RestTemplate rt = new RestTemplate();
        String accessToken = "";
        // HTTP header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // MultiValueMap을 사용해서 body 데이터를 담을 Object 생성
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", kakaoApiKey);
        params.add("redirect_uri", kakaoRedirectUrl);
        params.add("code", code);

        // 헤더(Header)와 데이터(Body) 합침
        HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

        // POST 방식으로 Http 요청. 그리고 response 변수의 응답
        ResponseEntity<String> response = rt.exchange(
                "https://kauth.kakao.com/oauth/token",
                HttpMethod.POST,
                kakaoTokenRequest,
                String.class
        );
        try {
            JSONParser parser = new JSONParser();
            JSONObject jsonObject = (JSONObject) parser.parse(response.getBody().toString());
            // accessToken 추출
            accessToken = (String) jsonObject.get("access_token");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accessToken;
    }

    // getAccessToken 함수로 추출한 accessToken으로 유저 정보 요청
    public HashMap<String, Object> getUserInfo(String accessToken) {
        HashMap<String, Object> userInfo = new HashMap<>();
        String reqUrl = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

            int responseCode = conn.getResponseCode();
            log.info("[KakaoApi.getUserInfo] responseCode : {}", responseCode);

            BufferedReader br;
            if (responseCode >= 200 && responseCode <= 300) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            String line = "";
            StringBuilder responseSb = new StringBuilder();
            while ((line = br.readLine()) != null) {
                responseSb.append(line);
            }
            String result = responseSb.toString();
            log.info("responseBody = {}", result);
            JSONParser parser = new JSONParser();

            Object obj = parser.parse(result);
            JSONObject jsonObject = (JSONObject) obj;
            JSONObject kakaoAccount = (JSONObject) jsonObject.get("kakao_account");
            String email = (String) kakaoAccount.get("email");

            userInfo.put("email", email);

            br.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userInfo;
    }

    // 카카오 로그아웃 로직
    public void kakaoLogout(String accessToken) {
        String reqUrl = "https://kapi.kakao.com/v1/user/logout";

        try {
            URL url = new URL(reqUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

            int responseCode = conn.getResponseCode();
            log.info("[KakaoApi.kakaoLogout] responseCode : {}", responseCode);

            BufferedReader br;
            if (responseCode >= 200 && responseCode <= 300) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            String line = "";
            StringBuilder responseSb = new StringBuilder();
            while ((line = br.readLine()) != null) {
                responseSb.append(line);
            }
            String result = responseSb.toString();
            log.info("kakao logout - responseBody = {}", result);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
