package com.hana.app.repository;

import com.hana.app.data.dto.CommentDto;
import com.hana.app.data.dto.PostDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CommentRepository extends HanaRepository<Integer, CommentDto> {

    // 로그인 사용자가 댓글의 좋아요를 눌렀는지 확인하기 위한 기능
    // isLiked column에 null 또는 not null 값이 들어간 isLikedCommentCheckDto List를 반환
    List<CommentDto> selectIsLikedComment(@Param("postId") Integer postId, @Param("userId") Integer userId);

    int updateLikeCount(Integer id) throws Exception;

    int report(Integer id) throws Exception;

    int insertByAnonymous(CommentDto commentDto) throws Exception;

    int insertByNotAnonymous(CommentDto commentDto) throws Exception;

}