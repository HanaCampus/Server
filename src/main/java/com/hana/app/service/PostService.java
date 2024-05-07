package com.hana.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
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

    public Page<PostDto> getPostList(Integer userId, Integer boardId, int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 8); // 3: 한화면에 출력되는 개수
        return postRepository.getPostList(userId, boardId);
    }

    public Page<PostDto> getMyPostList(Integer userId, int pageNo) throws Exception{
        PageHelper.startPage(pageNo, 8); // 3: 한화면에 출력되는 개수
        return postRepository.getMyPostList(userId);
    }

    public Page<PostDto> getScrapList(Integer userId, int pageNo) throws Exception{
        PageHelper.startPage(pageNo, 8); // 3: 한화면에 출력되는 개수
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

    public int modifyScrapCount(Integer id) throws Exception {
        // 성공 시 1, 실패 시 0 return
        return postRepository.updateScrapCount(id);
    }

    public Page<PostDto> selectByKeyword(Integer boardId, Integer userId, String keyword, int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 8); // 3: 한화면에 출력되는 개수
        return postRepository.selectByKeyword(boardId, userId, keyword);
    }
}
