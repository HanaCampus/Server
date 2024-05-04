package com.hana.app.controller;

import com.hana.app.service.BoardService;
import com.hana.app.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/posts")
@RequiredArgsConstructor
@Slf4j
public class PostController {

    final PostService postService;

    String dir = "posts/";

    @GetMapping("")
    public String main(Model model, @RequestParam("id") Integer postId) {
        model.addAttribute("center", dir + "post");

        return "index";
    }


}
