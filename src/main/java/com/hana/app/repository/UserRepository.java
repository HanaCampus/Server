package com.hana.app.repository;

import com.hana.app.data.dto.UserDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserRepository extends HanaRepository<String, UserDto> {
    UserDto findByNickname(String string) throws Exception;
    UserDto findByEmail(String string) throws Exception;
}
