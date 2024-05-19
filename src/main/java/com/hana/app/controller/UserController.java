package com.hana.app.controller;

import com.hana.app.common.type.UType;
import com.hana.app.data.dto.PostDto;
import com.hana.app.data.dto.UserDto;
import com.hana.app.service.PostService;
import com.hana.app.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/users")
@RequiredArgsConstructor
@Slf4j
public class UserController {

    String dir = "users/";

    final UserService userService;
    final PostService postService;

    @ResponseBody
    @PostMapping("/sign-out")
    public String userSignOut(HttpSession httpSession){
        Object id = httpSession.getAttribute("id");
        UserDto userDto = UserDto.builder()
                .userId(Integer.parseInt(String.valueOf(id)))
                .status(UType.Deleted)
                .build();
        try {
            userService.modify(userDto);
            return "1";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("/mypage")
    public String userMyPage(Model model, HttpSession httpSession) {
        try {
            Object id = httpSession.getAttribute("id");
            UserDto userDto = userService.get(String.valueOf(id));
            model.addAttribute("user", userDto);
            model.addAttribute("center", dir + "mypage");
            return "index";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("/myscraps")
    public String userMyScraps(Model model, HttpSession httpSession) {
        try {
            Object id = httpSession.getAttribute("id");
            List<PostDto> postDtoList = postService.getScrapList((Integer) id, 1);
            log.info(postDtoList.toString());
            model.addAttribute("posts", postDtoList);
            model.addAttribute("center", dir + "myscraps");
            return "index";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("/myposts")
    public String userMyPosts(Model model, HttpSession httpSession) {
        try {
            Object id = httpSession.getAttribute("id");
            UserDto userDto = userService.get(String.valueOf(id));
            List<PostDto> postDtoList = postService.getMyPostList((Integer) id, 1);
            model.addAttribute("user", userDto);
            model.addAttribute("posts", postDtoList);
            model.addAttribute("center", dir + "myposts");
            return "index";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("/agree")
    public String userAgree(Model model, HttpSession httpSession) {
        if (httpSession.getAttribute("id") != null) {
            return "redirect:/";
        }
        if (httpSession.getAttribute("email") == null) {
            return "redirect:/auth/sign-in";
        }
        model.addAttribute("center", dir + "agree");
        return "index";
    }

    @GetMapping("/info")
    public String userInfo(Model model, HttpSession httpSession) {
        try {
            Object id = httpSession.getAttribute("id");
            UserDto userDto = userService.get(String.valueOf(id));
            model.addAttribute("user", userDto);
            model.addAttribute("center", dir + "info");
            return "index";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @ResponseBody
    @PostMapping("/edit-info")
    public String userEditInfo(UserDto userDto) {
        try {
            userService.modify(userDto);
            return "1";
        } catch (Exception e) {
            return "0";
        }
    }

}
