package com.hana.comment;

import com.hana.app.data.dto.CommentDto;
import com.hana.app.data.dto.PostDto;
import com.hana.app.data.dto.UserDto;
import com.hana.app.service.CommentService;
import com.hana.app.service.PostService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;

@SpringBootTest
@Slf4j
class InsertByNotAnonymousTests {

    @Autowired
    CommentService commentService;

    @Test
    void contextLoads() {
        CommentDto commentDto = CommentDto.builder()
                .content("내 댓글3333")
                .userDto(UserDto.builder().userId(10).build())
                .postId(29)
                .build();
        try {
            commentService.addByNotAnonymous(commentDto);
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