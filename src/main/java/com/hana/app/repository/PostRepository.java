package com.hana.app.repository;

import com.hana.app.data.dto.PostDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PostRepository extends HanaRepository<Integer, PostDto> {

    int insertByAnonymous(PostDto postDto) throws Exception;
    int insertByNotAnonymous(PostDto postDto) throws Exception;
    int updateLikeCount(Integer id) throws Exception;

}