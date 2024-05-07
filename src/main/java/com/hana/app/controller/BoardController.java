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

        // pagination.jsp 파일에서 path 설정 시 사용
        String paginationPath = "boards";

        model.addAttribute("paginationPath", paginationPath);
        model.addAttribute("boardId", boardId);
        model.addAttribute("cpage", p);
        model.addAttribute("center", dir + "index");
        return "index";
    }

    @PostMapping("/search")
    public String search(Model model, HttpSession httpSession,
                         @RequestParam("searchKeyword") String searchKeyword,
                         @RequestParam("id") Integer boardId,
                         @RequestParam("pageNo") Integer pageNo) throws Exception {
        Integer userId = (Integer) httpSession.getAttribute("id");

        PageInfo<PostDto> p;
        p = new PageInfo<>(postService.selectByKeyword(boardId, userId, searchKeyword, pageNo), 5);

        // pagination.jsp 파일에서 path 설정 시 사용
        String paginationPath = "boards/search";

        model.addAttribute("paginationPath", paginationPath);
        model.addAttribute("boardId", boardId);
        model.addAttribute("cpage", p);
        model.addAttribute("center", dir + "index");

        return "index";
    }
}
