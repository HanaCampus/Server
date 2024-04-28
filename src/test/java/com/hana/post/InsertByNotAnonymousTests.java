package com.hana.post;

import com.hana.app.data.dto.PostDto;
import com.hana.app.service.PostService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;
import java.time.LocalDate;

@SpringBootTest
@Slf4j
class InsertByNotAnonymousTests {

    @Autowired
    PostService postService;

    @Test
    void contextLoads() {
        PostDto postDto = PostDto.builder()
                .title("8일간의 프로젝트 시작")
                .content("일주일만에 끝내고 마지막은 회식 ㄱ")
                .userId(1)
                .boardId(1)
                .createDate(LocalDate.now())
                .build();
        try {
            postService.addByNotAnonymous(postDto);
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