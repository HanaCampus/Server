package com.hana.post;

import com.hana.app.data.dto.PostDto;
import com.hana.app.service.PostService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;
import java.util.List;

@SpringBootTest
@Slf4j
public class SelectByKeywordTests {

    @Autowired
    PostService postService;

    @Test
    void contextLoads() {
        try {
            List<PostDto> postDtoList= postService.selectByKeyword(1, 1, "서윤");
            for(PostDto p : postDtoList){
                log.info(p.toString());
            }
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
