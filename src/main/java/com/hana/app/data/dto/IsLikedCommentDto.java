package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class IsLikedCommentDto extends CommentDto {
    /* (SQL JOIN문을 통해 반환받는 데이터 DTO) */

    // 댓글의 좋아요 등록 여부 정보가 포함된 정보
    // null 값이면 등록 x, 아니면 등록 o
    private int isLiked;
}
