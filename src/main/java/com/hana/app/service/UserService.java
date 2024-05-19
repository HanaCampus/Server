package com.hana.app.service;

import com.hana.app.data.dto.UserDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService implements HanaService<String, UserDto> {

    final UserRepository userRepository;

    @Override
    public int add(UserDto userDto) throws Exception {
        return userRepository.insert(userDto);
    }

    @Override
    public int del(String s) throws Exception {
        return userRepository.delete(s);
    }

    @Override
    public int modify(UserDto userDto) throws Exception {
        return userRepository.update(userDto);
    }

    @Override
    public UserDto get(String s) throws Exception {
        return userRepository.selectOne(s);
    }

    @Override
    public List<UserDto> get() throws Exception {
        return userRepository.select();
    }

    public UserDto findByNickname(String s) throws Exception {
        return userRepository.findByNickname(s);
    }

    public UserDto findByEmail(String s) throws Exception {
        return userRepository.findByEmail(s);
    }

}
