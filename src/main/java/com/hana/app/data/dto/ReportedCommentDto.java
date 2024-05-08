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
public class ReportedCommentDto {
    private int reportedCommentId;
    private int userId; // 신고자 정보
    private UserDto writerDto; // Comment 작성자 정보
    private CommentDto commentDto;
    private LocalDateTime createDate;
    private LocalDateTime updateDate;
    private ReportCategoryDto reportCategoryDto;
    private String status; // 활성 : Active , 완료 : Completed

    // 신고 받은 각 category 개수
    private int total;
    private int cntCategory1;
    private int cntCategory2;
    private int cntCategory3;
    private int cntCategory4;
    private int cntCategory5;
    private int cntCategory6;
    private int cntCategory7;
}
