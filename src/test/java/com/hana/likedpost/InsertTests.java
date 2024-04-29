package com.hana.likedpost;

import com.hana.app.data.dto.LikedPostDto;
import com.hana.app.service.LikedPostService;
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
    LikedPostService likedPostService;

    @Test
    void contextLoads() {
        LikedPostDto likedPostDto = LikedPostDto.builder()
                .postId(2)
                .userId(1)
                .build();
        try {
            likedPostService.add(likedPostDto);
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