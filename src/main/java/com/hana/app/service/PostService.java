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
    public int add(PostDto postDto) throws  Exception {
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

    public PostDto getPostInfo(Integer postId, Integer userId) throws Exception {
        return postRepository.selectOne(postId, userId);
    }

    public List<PostDto> getPostList(Integer userId, Integer boardId) throws Exception {
        return postRepository.getPostList(userId, boardId);
    }

    public List<PostDto> getMyPostList(Integer userId) throws Exception{
        return postRepository.getMyPostList(userId);
    }

    public List<PostDto> getScrapList(Integer userId) throws Exception{
        return postRepository.getScrapList(userId);
    }

    public int addByAnonymous(PostDto postDto) throws Exception {
        // 성공 시 1, 실패 시 0 return
        return postRepository.insertByAnonymous(postDto);
    }

    public int addByNotAnonymous(PostDto postDto) throws Exception {
        // 성공 시 1, 실패 시 0 return
        return postRepository.insertByNotAnonymous(postDto);
    }

    public int modifyLikeCount(Integer id) throws Exception {
        // 성공 시 1, 실패 시 0 return
        return postRepository.updateLikeCount(id);
    }
}
