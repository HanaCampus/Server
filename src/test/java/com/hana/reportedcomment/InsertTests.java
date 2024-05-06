package com.hana.reportedcomment;

import com.hana.app.data.dto.CommentDto;
import com.hana.app.data.dto.ReportCategoryDto;
import com.hana.app.data.dto.ReportedCommentDto;
import com.hana.app.service.ReportedCommentService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;

@SpringBootTest
@Slf4j
class InsertTests {

    @Autowired
    ReportedCommentService reportedCommentService;

    @Test
    void contextLoads() {
        ReportedCommentDto reportedCommentDto = ReportedCommentDto.builder()
                .userId(1)
                .commentDto(CommentDto.builder().commentId(1).build())
                .reportCategoryDto(ReportCategoryDto.builder().reportCategoryId(1).build())
                .build();

        try {
            reportedCommentService.add(reportedCommentDto);
            log.info("---------- SUCCESS ----------");
        } catch (Exception e) {
            if(e instanceof SQLException) {
                log.info("---------- SQLException ----------");
            } else if(e instanceof DuplicateKeyException) {
                log.info("---------- DuplicateKeyException ----------");
            } else {
                log.info("---------- Else.. Run 'e.printStackTrace()' ----------");
                e.printStackTrace();
            }
        }
    }
}