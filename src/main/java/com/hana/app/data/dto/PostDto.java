package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostDto {
    private int postId;
    private String title;
    private String content;
    private boolean anonymous;
    private int scraps;
    private int likes;
    private String status; // 'Active', 'Deleted'
    private UserDto userDto;
    private int boardId;
    private int commentCount;
    private Integer isLiked; // 좋아요 누른 사람 여부
    private Integer isScraped; // 스크랩 누른 사람 여부
    private LocalDateTime createDate;
    private LocalDateTime updateDate;

    public String getCreateDate() {
        if (createDate == null) {
            return "";
        }

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd HH시 mm분");
        return createDate.plusHours(9).format(formatter);
    }
}