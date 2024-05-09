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
public class CommentDto {
    private int commentId;
    private String content;
    private int likes; // 좋아요 수
    private String status; // 'Active', 'Deleted', 'Reported'
    private UserDto userDto;
    private Integer postId;
    private int parentId;
    private boolean anonymous;
//    private ArrayList<CommentDto> children;

    // 좋아요 누른 사람 여부
    private Integer isLiked;

    private LocalDateTime createDate;
    private LocalDateTime updateDate;

    public String getCreateDate() {
        if (createDate == null) {
            return ""; // createDate가 null인 경우 빈 문자열 반환
        }
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd HH시 mm분");
        return createDate.plusHours(9).format(formatter);
    }
}
