package com.hana.app.repository;

import com.hana.app.data.dto.LikedCommentDto;
import com.hana.app.data.dto.LikedPostDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface LikedCommentRepository extends HanaRepository<Integer, LikedCommentDto> {

    LikedCommentDto isLikedCommentByUserId(@Param("commentId") Integer commentId, @Param("userId") Integer userId);

}