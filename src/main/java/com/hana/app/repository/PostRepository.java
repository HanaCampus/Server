package com.hana.app.repository;

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
    List<PostDto> getPostList(Integer userId) throws Exception;
    List<PostDto> getMyPostList(Integer userId) throws Exception;
    List<PostDto> getScrapList(Integer userId) throws Exception;
    int insertByAnonymous(PostDto postDto) throws Exception;
    int insertByNotAnonymous(PostDto postDto) throws Exception;
    int updateLikeCount(Integer id) throws Exception;

}