package com.hana.board;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.data.dto.LikedPostDto;
import com.hana.app.service.BoardService;
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
    BoardService boardService;

    @Test
    void contextLoads() {
        BoardDto boardDto = BoardDto.builder()
                .name("테스트 게시판")
                .build();
        try {
            boardService.add(boardDto);
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