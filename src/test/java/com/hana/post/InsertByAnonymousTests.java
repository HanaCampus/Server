package com.hana.post;

import com.hana.app.data.dto.PostDto;
import com.hana.app.data.dto.UserDto;
import com.hana.app.service.PostService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;

@SpringBootTest
@Slf4j
class InsertByAnonymousTests {

    @Autowired
    PostService postService;

    @Test
    void contextLoads() {
        PostDto postDto = PostDto.builder()
                .title("5월4일")
                .content("테스트테스트")
                .userDto(UserDto.builder().userId(1).build())
                .boardId(1)
                .build();
        try {
            postService.addByAnonymous(postDto);
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