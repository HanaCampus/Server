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
public class CommentDto {
    private int commentId;
    private String content;
    private int likes; // 좋아요 수
    private String status; // 'Active', 'Deleted', 'Reported'
    private int userId;
    private int postId;
    private int parentId; // 대댓글일 경우 부모 댓글의 id
    private LocalDate createDate;
    private LocalDate updateDate;
}
