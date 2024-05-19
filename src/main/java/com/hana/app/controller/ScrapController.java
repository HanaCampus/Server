package com.hana.app.controller;

import com.hana.app.data.dto.*;
import com.hana.app.repository.ScrapRepository;
import com.hana.app.service.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/scraps")
@RequiredArgsConstructor
@Slf4j
public class ScrapController {

    String dir = "scraps/";

    final ScrapRepository scrapService;
    final PostService postService;

    @ResponseBody
    @PostMapping("/post")
    public String getScrapPost(@RequestParam("id") Integer id, HttpSession httpSession) {
        try {
            Integer userId = (Integer) httpSession.getAttribute("id");
            ScrapDto scrapDto = ScrapDto.builder().userId(userId).postId(id).build();
            scrapService.insert(scrapDto);
            postService.modifyScrapCount(id);
            PostDto postDto = postService.get(id);
            String likeNum = String.valueOf(postDto.getScraps());
            return likeNum;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    @ResponseBody
    @DeleteMapping("/post")
    public String deleteScrapPost(@RequestParam("id") Integer id, HttpSession httpSession) {
        try {
            Integer userId = (Integer) httpSession.getAttribute("id");
            ScrapDto scrapDto = scrapService.isScrapedByUserId(id, userId);
            scrapService.delete(scrapDto.getScrapId());
            postService.modifyScrapCount(id);
            PostDto postDto = postService.get(id);
            String likeNum = String.valueOf(postDto.getScraps());
            return likeNum;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

}
