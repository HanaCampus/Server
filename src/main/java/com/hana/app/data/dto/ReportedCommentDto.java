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
    private String content;
    private int userId;
    private int commentId;
    private LocalDate createDate;
    private LocalDate updateDate;
}
