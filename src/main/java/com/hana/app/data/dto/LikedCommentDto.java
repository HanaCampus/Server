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
public class LikedCommentDto {
    private int likedCommentId;
    private int commentId;
    private int userId;
    private LocalDate createDate;
    private LocalDate updateDate;
}
