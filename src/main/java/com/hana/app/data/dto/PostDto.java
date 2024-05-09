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

    // 좋아요 누른 사람 여부
    private Integer isLiked;

    // 스크랩 누른 사람 여부
    private Integer isScraped;

    private LocalDateTime createDate;
    private LocalDateTime updateDate;

    // 사용자 정의 getDate 메서드
    public String getCreateDate() {
        if (createDate == null) {
            return ""; // createDate가 null인 경우 빈 문자열 반환
        }
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd HH시 mm분");
        return createDate.plusHours(9).format(formatter);
    }
}