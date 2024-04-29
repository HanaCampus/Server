package com.hana.app.repository;

import com.hana.app.data.dto.LikedCommentDto;
import com.hana.app.data.dto.LikedPostDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface LikedPostRepository extends HanaRepository<Integer, LikedPostDto> {
    // 로그인 사용자가 좋아요를 눌렀는지 확인하는 기능
    LikedPostDto isLikedByUserId(@Param("postId") Integer postId, @Param("userId") Integer userId);
}