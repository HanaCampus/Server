package com.hana.app.controller;

import com.hana.app.data.dto.UserDto;
import com.hana.app.service.BoardService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/boards")
@RequiredArgsConstructor
@Slf4j
public class BoardController {

    final BoardService boardService;

    String dir = "boards/";

    @GetMapping("")
    public String main(Model model, @RequestParam("id") Integer boardId) {
        // 자유게시판
        if(boardId == 1) {
            model.addAttribute("center", dir + "free");
        }

        return "index";
    }


}
