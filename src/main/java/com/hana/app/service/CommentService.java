package com.hana.app.service;

import com.hana.app.data.dto.CommentDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.CommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentService implements HanaService<Integer, CommentDto> {

    private final CommentRepository commentRepository;

    @Override
    public int add(CommentDto commentDto) throws Exception {
        // 성공 시 1, 실패 시 0 return
        return commentRepository.insert(commentDto);
    }

    @Override
    public int del(Integer id) throws Exception {
        return commentRepository.delete(id);
    }

    @Override
    public int modify(CommentDto commentDto) throws Exception {
        return commentRepository.update(commentDto);
    }

    @Override
    public CommentDto get(Integer id) throws Exception {
        return commentRepository.selectOne(id);
    }

    @Override
    public List<CommentDto> get() throws Exception {
        return commentRepository.select();
    }

    public List<CommentDto> getIsLikedComment(Integer postId, Integer userId) throws Exception {
        return commentRepository.selectIsLikedComment(postId, userId);
    }

    public int modifyLikeCount(Integer id) throws Exception {
        // 성공 시 1, 실패 시 0 return
        return commentRepository.updateLikeCount(id);
    }

    public int report(Integer id) throws Exception{
        // 성공 시 1, 실패 시 0 return
        return commentRepository.report(id);
    }
}
