package com.hana.app.controller;

import com.hana.app.data.dto.PostDto;
import com.hana.app.service.PostService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/posts")
@RequiredArgsConstructor
@Slf4j
public class PostController {

    final PostService postService;

    String dir = "posts/";

    @GetMapping("")
    public String main(Model model, @RequestParam("id") Integer postId, HttpSession httpSession) {
        model.addAttribute("id", httpSession.getAttribute("id"));
        model.addAttribute("center", dir + "post");

        return "index";
    }

    @GetMapping("/writepost")
    public String writePost(Model model) {
        model.addAttribute("center", dir + "writepost");

        return "index";
    }
//    @ResponseBody
//    @PostMapping("/writepost")
//    public String writePost(Model model, HttpSession httpSession){
//        if(){ // 익명 체크했으면
//            model.addAttribute(httpSession.setAttribute("id", postService.addByAnonymous()));
//        }
//        else{ // 익명 체크 안했으면
//            model.addAttribute(httpSession.setAttribute("id", postService.addByNotAnonymous()));
//        }
//
//        model.addAttribute("center", dir + "writepost");
//
//        return "index";
//    }
}
