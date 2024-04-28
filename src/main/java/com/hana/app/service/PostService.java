package com.hana.app.service;

import com.hana.app.data.dto.CommentDto;
import com.hana.app.data.dto.PostDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.CommentRepository;
import com.hana.app.repository.PostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PostService implements HanaService<Integer, PostDto> {

    private final PostRepository postRepository;

    @Override
    public int add(PostDto postDto) throws Exception {
        // 성공 시 1, 실패 시 0 return
        return postRepository.insert(postDto);
    }

    @Override
    public int del(Integer id) throws Exception {
        return postRepository.delete(id);
    }

    @Override
    public int modify(PostDto postDto) throws Exception {
        return postRepository.update(postDto);
    }

    @Override
    public PostDto get(Integer id) throws Exception {
        return postRepository.selectOne(id);
    }

    @Override
    public List<PostDto> get() throws Exception {
        return postRepository.select();
    }
}
