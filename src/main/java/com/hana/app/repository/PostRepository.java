package com.hana.app.repository;

import com.github.pagehelper.Page;
import com.hana.app.data.dto.PostDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface PostRepository extends HanaRepository<Integer, PostDto> {

    PostDto selectOne(@Param("postId") Integer postId, @Param("userId") Integer userId) throws Exception;

    Page<PostDto> getPostList(@Param("userId") Integer userId, @Param("boardId") Integer boardId) throws Exception;

    Page<PostDto> getMyPostList(Integer userId) throws Exception;

    Page<PostDto> getScrapList(Integer userId) throws Exception;

    int insertByAnonymous(PostDto postDto) throws Exception;

    int insertByNotAnonymous(PostDto postDto) throws Exception;

    int updateLikeCount(Integer id) throws Exception;

    int updateScrapCount(Integer id) throws Exception;

    Page<PostDto> selectByKeyword(@Param("boardId") Integer boardId, @Param("userId") Integer userId, @Param("keyword") String keyword) throws Exception;

}