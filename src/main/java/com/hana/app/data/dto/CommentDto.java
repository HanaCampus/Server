package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
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
    private int postId;
    private int parentId;
    private boolean isAnonymous;
    private ArrayList<CommentDto> children;

    // 좋아요 누른 사람 여부
    private int isLiked;

    private LocalDateTime createDate;
    private LocalDateTime updateDate;
}
