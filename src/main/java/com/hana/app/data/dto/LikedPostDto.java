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
public class LikedPostDto {
    private int likedPostId;
    private int userId;
    private int postId;
    private LocalDate createDate;
    private LocalDate updateDate;
}
