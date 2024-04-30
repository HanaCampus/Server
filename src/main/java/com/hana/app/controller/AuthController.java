package com.hana.app.controller;

import com.hana.app.data.dto.UserDto;
import com.hana.app.service.UserService;
import com.hana.util.kakao.KakaoApi;
import com.hana.util.kakao.KakaoKey;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/auth")
@RequiredArgsConstructor
@Slf4j
public class AuthController {
    private final KakaoKey kakaoKey;

    final UserService userService;

    String dir= "auth/";
    @GetMapping("/sign-in")
    public String login(Model model){
        model.addAttribute("kakaoApiKey", kakaoKey.getKakaoApiKey());
        model.addAttribute("redirectUrl", kakaoKey.getKakaoRedirectUrl());
        model.addAttribute("center", dir+"signIn");
        return "index";
    }


    @GetMapping("/oauth2/kakao")
    public String kakaoLogin(Model model, @RequestParam("code") String code, HttpSession httpSession){
        KakaoApi kakaoApi = new KakaoApi(kakaoKey.getKakaoApiKey(), kakaoKey.getKakaoRedirectUrl());
        String accessToken = kakaoApi.getAccessToken(code);
        Map<String, Object> userInfo = kakaoApi.getUserInfo(accessToken);

        String email = (String)userInfo.get("email");
        httpSession.setAttribute("email", email);
        try {
            UserDto userDto = userService.findByEmail(email);
            //이미 회원가입 되어있는 경우 바로 로그인 되도록
            if(userDto != null){
                httpSession.setAttribute("id", userDto.getUserId());
                return "redirect:/";
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/auth/register";
    }
    @GetMapping("/register")
    public String register(Model model, HttpSession httpSession){
        if (httpSession.getAttribute("email") == null){
            return "redirect:/auth/sign-in";
        }
        model.addAttribute("email", httpSession.getAttribute("email"));
        model.addAttribute("center", dir+"register");
        return "index";
    }

    @ResponseBody
    @PostMapping("/registerimpl")
    public String registerimpl(UserDto userDto, HttpSession httpSession){
        try {
            UserDto userDto1 = userService.findByNickname(userDto.getNickname());
            if (userDto1 != null) {
                return "3"; //닉네임 중복
            }
            userService.add(userDto);
            httpSession.setAttribute("id", userDto.getUserId());
            return "1";
        } catch (Exception e) {
            return "0";
        }
    }
}
