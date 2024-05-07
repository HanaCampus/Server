package com.hana.app.controller;

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
    public String main(Model model, @RequestParam("id") Integer boardId, HttpSession httpSession) throws Exception {

        // 자유게시판
//        if(boardId == 1) {
//            model.addAttribute("boardId", boardId);
//            model.addAttribute("center", dir + "free");
//        }

        List<PostDto> postDtoList= postService.getPostList((Integer) httpSession.getAttribute("id"), boardId, 1);
        log.info(postDtoList.toString());
        model.addAttribute("boardId", boardId);
        model.addAttribute("posts", postDtoList);
        model.addAttribute("center", dir + "index");
        return "index";
    }


}
