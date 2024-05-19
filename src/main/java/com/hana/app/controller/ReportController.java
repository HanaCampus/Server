package com.hana.app.controller;

import com.hana.app.data.dto.*;
import com.hana.app.service.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/reports")
@RequiredArgsConstructor
@Slf4j
public class ReportController {

    final ReportedPostService reportedPostService;
    final ReportedCommentService reportedCommentService;

    @PostMapping("/post")
    public String post(HttpSession httpSession,
                       @RequestParam("id") int postId,
                       @RequestParam("reportCategoryId") int reportCategoryId) throws Exception {
        Integer userId = (Integer) httpSession.getAttribute("id");

        // 신고 내역이 있으면 return "0"
        if (reportedPostService.findDuplicateOne(postId, userId) != null) {
            return "0";
        }

        ReportedPostDto reportedPostDto = ReportedPostDto.builder()
                .userId(userId)
                .postDto(PostDto.builder().postId(postId).build())
                .reportCategoryDto(ReportCategoryDto.builder().reportCategoryId(reportCategoryId).build())
                .build();

        // 성공적으로 신고 접수 후 return "1"
        reportedPostService.add(reportedPostDto);
        return "1";
    }

    @PostMapping("/comment")
    public String comment(HttpSession httpSession,
                          @RequestParam("id") int commentId,
                          @RequestParam("reportCategoryId") int reportCategoryId) throws Exception {
        Integer userId = (Integer) httpSession.getAttribute("id");

        // 신고 내역이 있으면 return "0"
        if (reportedCommentService.findDuplicateOne(commentId, userId) != null) {
            return "0";
        }

        ReportedCommentDto reportedCommentDto = ReportedCommentDto.builder()
                .userId(userId)
                .commentDto(CommentDto.builder().commentId(commentId).build())
                .reportCategoryDto(ReportCategoryDto.builder().reportCategoryId(reportCategoryId).build())
                .build();

        // 성공적으로 신고 접수 후 return "1"
        reportedCommentService.add(reportedCommentDto);
        return "1";
    }

}
