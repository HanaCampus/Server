package com.hana.likedcomment;

import com.hana.app.data.dto.CommentDto;
import com.hana.app.data.dto.LikedCommentDto;
import com.hana.app.service.LikedCommentService;
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
    LikedCommentService likedCommentService;

    @Test
    void contextLoads() {
        LikedCommentDto likedCommentDto = LikedCommentDto.builder()
                .commentId(2)
                .userId(1)
                .createDate(LocalDate.now())
                .build();
        try {
            likedCommentService.add(likedCommentDto);
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