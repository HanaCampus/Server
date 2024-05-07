package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReportedPostDto {
    private int reportedPostId;
    private int userId;
    private PostDto postDto;
    private LocalDateTime createDate;
    private LocalDateTime updateDate;
    private ReportCategoryDto reportCategoryDto;

    // 신고 받은 각 category 개수
    private int cntCategory1;
    private int cntCategory2;
    private int cntCategory3;
    private int cntCategory4;
    private int cntCategory5;
    private int cntCategory6;
    private int cntCategory7;
}
