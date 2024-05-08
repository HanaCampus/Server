package com.hana.app.controller;

import com.hana.app.data.dto.*;
import com.hana.app.service.ReportCategoryService;
import com.hana.app.service.ReportedCommentService;
import com.hana.app.service.ReportedPostService;
import com.hana.app.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/admins")
@RequiredArgsConstructor
@Slf4j
public class AdminController {

    String dir = "admin/";

    final UserService userService;
    final ReportedPostService reportedPostService;
    final ReportedCommentService reportedCommentService;
    final ReportCategoryService reportCategoryService;

    @RequestMapping("")
    public String main(Model model, @ModelAttribute("alert") String alertMessage) throws Exception {
        if (alertMessage != null && !alertMessage.isEmpty()) {
            model.addAttribute("alertMessage", alertMessage);
        }
        return dir + "index";
    }

    @GetMapping("/reportedposts")
    public String reportedPosts(Model model) throws Exception {
        List<ReportedPostDto> reportedPostDtoList= reportedPostService.get();
        log.info(reportedPostDtoList.toString());
        model.addAttribute("posts", reportedPostDtoList);
        model.addAttribute("center", dir + "reportedposts");
        return "index";
    }

    @GetMapping("/reportedposts/complete")
    public String completedPosts(Model model) throws Exception {
        List<ReportedPostDto> reportedPostDtoList= reportedPostService.completedReports();
        log.info(reportedPostDtoList.toString());
        model.addAttribute("posts", reportedPostDtoList);
        model.addAttribute("center", dir + "completedposts");
        return "index";
    }

    @GetMapping("/postInfo")
    public String getReportedPost(Model model, @RequestParam("id") Integer postId) throws Exception {
        ReportedPostDto reportedPostDto= reportedPostService.get(postId);
        List<ReportCategoryDto> reportCategoryDtoList = reportCategoryService.get();
        log.info(reportedPostDto.toString());
        model.addAttribute("post", reportedPostDto);
        model.addAttribute("category", reportCategoryDtoList);
        model.addAttribute("center", dir + "reportedpost");
        return "index";
    }

    @GetMapping("/reportedcomments")
    public String reportedComments(Model model) throws Exception {
        List<ReportedCommentDto> reportedCommentDtoList= reportedCommentService.get();
        log.info(reportedCommentDtoList.toString());
        model.addAttribute("comments", reportedCommentDtoList);
        model.addAttribute("center", dir + "reportedcomments");
        return "index";
    }

    @GetMapping("/reportedcomments/complete")
    public String completedComments(Model model) throws Exception {
        List<ReportedCommentDto> reportedCommentDtoList= reportedCommentService.completedReports();
        log.info(reportedCommentDtoList.toString());
        model.addAttribute("comments", reportedCommentDtoList);
        model.addAttribute("center", dir + "completedcomments");
        return "index";
    }

    @GetMapping("/commentInfo")
    public String getReportedComment(Model model, @RequestParam("id") Integer commentId) throws Exception {
        ReportedCommentDto reportedCommentDto= reportedCommentService.get(commentId);
        List<ReportCategoryDto> reportCategoryDtoList = reportCategoryService.get();
        log.info(reportedCommentDto.toString());
        model.addAttribute("comment", reportedCommentDto);
        model.addAttribute("category", reportCategoryDtoList);
        model.addAttribute("center", dir + "reportedcomment");
        return "index";
    }

    @PostMapping("/updateSuspendDate")
    public String updateSuspendDate(@RequestParam("userId") Integer userId, @RequestParam(value = "postId", required = false) Integer postId, @RequestParam(value = "commentId", required = false) Integer commentId, @RequestParam("suspend_days") String suspendDays) throws Exception {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime suspendDate = null;

        if (!"all".equals(suspendDays)) {
            if("영구 정지".equals(suspendDays)){
                suspendDate = now.plusYears(100); // 'all'을 영구 정지로 간주할 경우
            }
            else {
                int daysToAdd = Integer.parseInt(suspendDays);
                suspendDate = now.plusDays(daysToAdd);
            }

            UserDto userDto = userService.get(String.valueOf(userId));
            userDto.setSuspendedDate(suspendDate);
            userService.modify(userDto);

            if(postId != null) {
                reportedPostService.completeReport(postId);
                return "redirect:/admins/reportedposts"; // 처리 후 리디렉트할 페이지
            }
            if(commentId != null) {
                reportedCommentService.completeReport(commentId);
                return "redirect:/admins/reportedcomments"; // 처리 후 리디렉트할 페이지
            }
        }

        return "redirect:/admins";
    }
}
