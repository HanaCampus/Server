package com.hana.comment;

import com.hana.app.data.dto.CommentDto;
import com.hana.app.service.CommentService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;
import java.time.LocalDate;

@SpringBootTest
@Slf4j
class InsertTests {

    @Autowired
    CommentService commentService;

    @Test
    void contextLoads() {
        CommentDto commentDto = CommentDto.builder()
                .content("댓글1")
                .userId(1)
                .postId(1)
                .createDate(LocalDate.now())
                .updateDate(LocalDate.now())
                .build();
        try {
            commentService.add(commentDto);
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