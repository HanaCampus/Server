package com.hana.app.controller;

import com.github.pagehelper.PageInfo;
import com.hana.app.data.dto.PostDto;
import com.hana.app.data.dto.UserDto;
import com.hana.app.service.BoardService;
import com.hana.app.service.PostService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/boards")
@RequiredArgsConstructor
@Slf4j
public class BoardController {

    final BoardService boardService;
    final PostService postService;

    String dir = "boards/";

    @GetMapping("")
    public String main(Model model, @RequestParam("id") Integer boardId, @RequestParam("pageNo") Integer pageNo, HttpSession httpSession) throws Exception {
        PageInfo<PostDto> p;
        p = new PageInfo<>(postService.getPostList((Integer) httpSession.getAttribute("id"), boardId, pageNo), 5); // navigatePages: 하단 네비게이션 개수

        List<PostDto> postDtoList = postService.getPostList((Integer) httpSession.getAttribute("id"), boardId, 1);

        model.addAttribute("boardId", boardId);
        model.addAttribute("cpage", p);
        model.addAttribute("center", dir + "index");
        return "index";
    }


}
