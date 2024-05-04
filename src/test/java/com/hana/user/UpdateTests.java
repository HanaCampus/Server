package com.hana.user;

import com.hana.app.common.type.UType;
import com.hana.app.data.dto.CommentDto;
import com.hana.app.data.dto.UserDto;
import com.hana.app.service.CommentService;
import com.hana.app.service.UserService;
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
    UserService userService;

    @Test
    void contextLoads() {
        UserDto userDto = UserDto.builder()
                .userId(4)
                .nickname("완전 새로운 닉네임")
                .status(UType.Active)
                .build();
        try {
            userService.modify(userDto);
            log.info("-----🌟---- SUCCESS ----------");
            UserDto userDto1 =  userService.get("4");
            log.info(userDto1.toString());
        } catch (Exception e) {
            if(e instanceof SQLException) {
                log.info("------🌟---- SQLException ----------");
            } else if(e instanceof DuplicateKeyException) {
                log.info("----🌟------ DuplicateKeyException ----------");
            } else {
                log.info("----🌟------ Else.. Run 'e.printStackTrace()' ----------");
                e.printStackTrace();
            }
        }
    }
}