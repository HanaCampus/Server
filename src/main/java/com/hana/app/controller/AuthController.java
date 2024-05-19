package com.hana.app.controller;

import com.hana.app.common.type.UType;
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

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/auth")
@RequiredArgsConstructor
@Slf4j
public class AuthController {

    String dir = "auth/";

    private final KakaoKey kakaoKey;

    final UserService userService;

    @GetMapping("/sign-in")
    public String login(Model model) {
        model.addAttribute("kakaoApiKey", kakaoKey.getKakaoApiKey());
        model.addAttribute("redirectUrl", kakaoKey.getKakaoRedirectUrl());
        model.addAttribute("center", dir + "signIn");
        return "index";
    }

    @GetMapping("/oauth2/kakao")
    public String kakaoLogin(@RequestParam("code") String code,
                             HttpSession httpSession,
                             RedirectAttributes redirectAttributes) {
        KakaoApi kakaoApi = new KakaoApi(kakaoKey.getKakaoApiKey(), kakaoKey.getKakaoRedirectUrl());
        String accessToken = kakaoApi.getAccessToken(code);
        Map<String, Object> userInfo = kakaoApi.getUserInfo(accessToken);

        String email = (String) userInfo.get("email");
        httpSession.setAttribute("email", email);

        try {
            UserDto userDto = userService.findByEmail(email);
            // 이미 회원가입 되어있는 경우 자동 로그인
            if (userDto != null) {
                if (userDto.getStatus() == UType.Suspended) {
                    redirectAttributes.addFlashAttribute("alert", "정지된 회원입니다.");
                    return "redirect:/";
                }

                if (userDto.getStatus() == UType.Deleted) {
                    redirectAttributes.addFlashAttribute("alert", "탈퇴한 회원입니다.");
                    return "redirect:/";
                }

                httpSession.setAttribute("id", userDto.getUserId());

                // 관리자일 경우 관리자 페이지로 이동
                if (userDto.isAdmin()) {
                    return "redirect:/admins";
                }

                return "redirect:/";
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        // 비회원일 경우 회원가입 페이지로 이동
        return "redirect:/users/agree";
    }

    @GetMapping("/register")
    public String register(Model model, HttpSession httpSession) {
        // 로그인 상태에서 회원가입 페이지에 접근할 경우 메인 화면으로 강제 이동
        if (httpSession.getAttribute("id") != null) {
            return "redirect:/";
        }

        model.addAttribute("email", httpSession.getAttribute("email"));
        model.addAttribute("center", dir + "register");
        return "index";
    }

    @ResponseBody
    @PostMapping("/registerimpl")
    public String registerimpl(UserDto userDto, HttpSession httpSession) {
        try {
            // 닉네임 중복 체크
            UserDto duplicated = userService.findByNickname(userDto.getNickname());
            if (duplicated != null) {
                return "3"; // 닉네임 중복
            }

            // 회원가입
            userService.add(userDto);

            // 로그인
            UserDto signIn = userService.findByEmail(userDto.getEmail());
            httpSession.setAttribute("id", signIn.getUserId());
            return "1";
        } catch (Exception e) {
            return "0";
        }
    }

}
