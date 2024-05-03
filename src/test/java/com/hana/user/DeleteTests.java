package com.hana.user;

import com.hana.app.common.type.UType;
import com.hana.app.data.dto.UserDto;
import com.hana.app.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;
import java.util.List;

@SpringBootTest
@Slf4j
class DeleteTests {

    @Autowired
    UserService userService;

    @Test
    void contextLoads() {
        try {
            userService.del("5");
            log.info("-----🌟---- SUCCESS ----------");
            List<UserDto> userDto =  userService.get();
            log.info(userDto.toString());
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