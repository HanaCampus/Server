package com.hana.app.service;

import com.hana.app.data.dto.LikedCommentDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.LikedCommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LikedCommentService implements HanaService<Integer, LikedCommentDto> {

    private final LikedCommentRepository likedCommentRepository;

    @Override
    public int add(LikedCommentDto likedCommentDto) throws Exception {
        return likedCommentRepository.insert(likedCommentDto);
    }

    @Override
    public int del(Integer id) throws Exception {
        return likedCommentRepository.delete(id);
    }

    @Override
    public int modify(LikedCommentDto likedCommentDto) throws Exception {
        return likedCommentRepository.update(likedCommentDto);
    }

    @Override
    public LikedCommentDto get(Integer id) throws Exception {
        return likedCommentRepository.selectOne(id);
    }

    @Override
    public List<LikedCommentDto> get() throws Exception {
        return likedCommentRepository.select();
    }
}
