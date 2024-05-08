package com.hana.app.controller;

import com.hana.app.data.dto.PostDto;
import com.hana.app.data.dto.ReportCategoryDto;
import com.hana.app.data.dto.ReportedCommentDto;
import com.hana.app.data.dto.ReportedPostDto;
import com.hana.app.service.ReportCategoryService;
import com.hana.app.service.ReportedCommentService;
import com.hana.app.service.ReportedPostService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admins")
@RequiredArgsConstructor
@Slf4j
public class AdminController {

    String dir = "admin/";

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
    public String reportedposts(Model model) throws Exception {
        List<ReportedPostDto> reportedPostDtoList= reportedPostService.get();
        log.info(reportedPostDtoList.toString());
        model.addAttribute("posts", reportedPostDtoList);
        model.addAttribute("center", dir + "reportedposts");
        return "index";
    }

    @GetMapping("/postInfo")
    public String getReportedpost(Model model, @RequestParam("id") Integer postId) throws Exception {
        ReportedPostDto reportedPostDto= reportedPostService.get(postId);
        List<ReportCategoryDto> reportCategoryDtoList = reportCategoryService.get();
        log.info(reportedPostDto.toString());
        model.addAttribute("post", reportedPostDto);
        model.addAttribute("category", reportCategoryDtoList);
        model.addAttribute("center", dir + "reportedpost");
        return "index";
    }

    @GetMapping("/reportedcomments")
    public String reportedcomments(Model model) throws Exception {
        List<ReportedCommentDto> reportedCommentDtoList= reportedCommentService.get();
        log.info(reportedCommentDtoList.toString());
        model.addAttribute("comments", reportedCommentDtoList);
        model.addAttribute("center", dir + "reportedcomments");
        return dir + "index";
    }
}
