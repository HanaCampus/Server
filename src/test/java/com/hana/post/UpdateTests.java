package com.hana.post;

import com.hana.app.data.dto.CommentDto;
import com.hana.app.service.CommentService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;

@SpringBootTest
@Slf4j
class UpdateTests {

    @Autowired
    CommentService commentService;

    @Test
    void contextLoads() {
        CommentDto commentDto = CommentDto.builder()
                .commentId(1)
                .content("수정1")
                .build();
        try {
            commentService.modify(commentDto);
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