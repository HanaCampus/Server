package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

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
    private int userId;
    private int boardId;
    private LocalDate createDate;
    private LocalDate updateDate;
}