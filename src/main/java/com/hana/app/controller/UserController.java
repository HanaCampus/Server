package com.hana.app.controller;


import com.hana.app.data.dto.UserDto;
import com.hana.app.service.UserService;
import com.hana.util.kakao.KakaoKey;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/users")
@RequiredArgsConstructor
@Slf4j
public class UserController {

    final UserService userService;
    String dir= "users/";


    @ResponseBody
    @DeleteMapping("/sign-out")
    public String userSignOut(String s){
        try {
            userService.del(s);
            return "1";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("/mypage")
    public String userMyPage(Model model, HttpSession httpSession){
        try {
            Object id = httpSession.getAttribute("id");
            UserDto userDto = userService.get(String.valueOf(id));
            model.addAttribute("user", userDto);
            model.addAttribute("center", dir+"mypage");
            return "index";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("/myscraps")
    public String usermyscraps(Model model,HttpSession httpSession){
        try {
            Object id = httpSession.getAttribute("id");
            UserDto userDto = userService.get(String.valueOf(id));
            model.addAttribute("user", userDto);
            model.addAttribute("center", dir+"myscraps");
            return "index";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("/myposts")
    public String usermyposts(Model model,HttpSession httpSession){
        try {
            Object id = httpSession.getAttribute("id");
            UserDto userDto = userService.get(String.valueOf(id));
            model.addAttribute("user", userDto);
            model.addAttribute("center", dir+"myposts");
            return "index";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }



    @GetMapping("/info")
    public String userInfo(Model model,HttpSession httpSession){
        try {
            Object id = httpSession.getAttribute("id");
            UserDto userDto = userService.get(String.valueOf(id));
            model.addAttribute("user", userDto);
            model.addAttribute("center", dir+"info");
            return "index";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @ResponseBody
    @PostMapping("/edit-info")
    public String userEditInfo(UserDto userDto){
        try {
            userService.modify(userDto);
            return "1";
        } catch (Exception e) {
            return "0";
//            throw new RuntimeException(e);
        }
    }


}
