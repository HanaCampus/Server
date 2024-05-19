package com.hana.app.controller;

import com.hana.app.data.dto.CommentDto;
import com.hana.app.data.dto.LikedCommentDto;
import com.hana.app.data.dto.LikedPostDto;
import com.hana.app.data.dto.PostDto;
import com.hana.app.service.CommentService;
import com.hana.app.service.LikedCommentService;
import com.hana.app.service.LikedPostService;
import com.hana.app.service.PostService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/likes")
@RequiredArgsConstructor
@Slf4j
public class LikeController {

    String dir = "likes/";

    final LikedPostService likedPostService;
    final PostService postService;
    final LikedCommentService likedCommentService;
    final CommentService commentService;

    @ResponseBody
    @PostMapping("/post")
    public String getLikePost(@RequestParam("id") Integer id, HttpSession httpSession) {
        try {
            Integer userId = (Integer) httpSession.getAttribute("id");
            LikedPostDto likedPostDto = LikedPostDto.builder().userId(userId).postId(id).build();
            likedPostService.add(likedPostDto);
            postService.modifyLikeCount(id);
            PostDto postDto = postService.get(id);
            String likeNum = String.valueOf(postDto.getLikes());
            return likeNum;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    @ResponseBody
    @DeleteMapping("/post")
    public String deleteLikePost(@RequestParam("id") Integer id, HttpSession httpSession) {
        try {
            Integer userId = (Integer) httpSession.getAttribute("id");
            LikedPostDto likedPostDto = likedPostService.isLikedByUserId(id, userId);
            likedPostService.del(likedPostDto.getLikedPostId());
            postService.modifyLikeCount(id);
            PostDto postDto = postService.get(id);
            String likeNum = String.valueOf(postDto.getLikes());
            return likeNum;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    @ResponseBody
    @PostMapping("/comment")
    public String getLikeComment(@RequestParam("id") Integer id, HttpSession httpSession) throws Exception {
        Integer userId = (Integer) httpSession.getAttribute("id");
        LikedCommentDto likedCommentDto = LikedCommentDto.builder().userId(userId).commentId(id).build();
        likedCommentService.add(likedCommentDto);
        commentService.modifyLikeCount(id);
        CommentDto commentDto = commentService.get(id);
        String likeNum = String.valueOf(commentDto.getLikes());
        return likeNum;
    }


    @ResponseBody
    @DeleteMapping("/comment")
    public String deleteLikeComment(@RequestParam("id") Integer id, HttpSession httpSession) {
        try {
            Integer userId = (Integer) httpSession.getAttribute("id");
            LikedCommentDto likedCommentDto = likedCommentService.isLikedCommentByUserId(id, userId);
            likedCommentService.del(likedCommentDto.getLikedCommentId());
            commentService.modifyLikeCount(likedCommentDto.getCommentId());
            CommentDto commentDto = commentService.get(id);
            String likeNum = String.valueOf(commentDto.getLikes());
            return likeNum;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

}
