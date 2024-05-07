package com.hana.reportedpost;

import com.hana.app.data.dto.PostDto;
import com.hana.app.data.dto.ReportCategoryDto;
import com.hana.app.data.dto.ReportedCommentDto;
import com.hana.app.data.dto.ReportedPostDto;
import com.hana.app.service.ReportedCommentService;
import com.hana.app.service.ReportedPostService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;
import java.util.ArrayList;

@SpringBootTest
@Slf4j
class InsertTests {

    @Autowired
    ReportedPostService reportedPostService;

    @Test
    void contextLoads() {

        ReportedPostDto reportedPostDto = ReportedPostDto.builder()
                .userId(1)
                .postDto(PostDto.builder().postId(2).build())
                .reportCategoryDto(ReportCategoryDto.builder().reportCategoryId(3).build())
                .build();

        try {
            reportedPostService.add(reportedPostDto);
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