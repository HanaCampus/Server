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
public class ReportedCommentDto {
    private int reportedCommentId;
    private int userId;
    private CommentDto commentDto;
    private LocalDate createDate;
    private LocalDate updateDate;
    private ReportCategoryDto reportCategoryDto;
}
