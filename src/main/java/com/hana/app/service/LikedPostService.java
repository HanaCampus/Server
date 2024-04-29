package com.hana.app.service;

import com.hana.app.data.dto.LikedPostDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.LikedPostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LikedPostService implements HanaService<Integer, LikedPostDto> {

    final LikedPostRepository likedPostRepository;

    @Override
    public int add(LikedPostDto likedPostDto) throws Exception {
        return likedPostRepository.insert(likedPostDto);
    }

    @Override
    public int del(Integer id) throws Exception {
        return likedPostRepository.delete(id);
    }

    @Override
    public int modify(LikedPostDto likedPostDto) throws Exception {
        return likedPostRepository.update(likedPostDto);
    }

    @Override
    public LikedPostDto get(Integer id) throws Exception {
        return likedPostRepository.selectOne(id);
    }

    @Override
    public List<LikedPostDto> get() throws Exception {
        return likedPostRepository.select();
    }

    public LikedPostDto isLikedByUserId(Integer postId, Integer userId) throws Exception {
        return likedPostRepository.isLikedByUserId(postId, userId);
    }
}
