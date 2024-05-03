package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.ArrayList;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostDto {
    private int postId;
    private String title;
    private String content;
    private boolean isAnonymous;
    private int scraps;
    private int likes;
    private String status; // 'Active', 'Deleted'
    private UserDto userDto;
    private int boardId;
    private int commentCount;

    // 좋아요 누른 사람 여부
    private int isLiked;

    // 스크랩 누른 사람 여부
    private int isScraped;

    private LocalDate createDate;
    private LocalDate updateDate;
}