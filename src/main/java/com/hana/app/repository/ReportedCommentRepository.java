package com.hana.app.repository;

import com.hana.app.data.dto.LikedPostDto;
import com.hana.app.data.dto.ReportedCommentDto;
import com.hana.app.data.dto.ReportedPostDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ReportedCommentRepository extends HanaRepository<Integer, ReportedCommentDto> {

    // 신고 중복 여부 확인을 위해 userId와 commentId로 데이터를 select
    ReportedCommentDto selectDuplicateOne(@Param("commentId") Integer commentId, @Param("userId") Integer userId);

    int completeReport(Integer commentId);

    List<ReportedCommentDto> completedReports();

}