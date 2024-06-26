package com.hana.app.repository;

import com.hana.app.data.dto.ReportedPostDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ReportedPostRepository extends HanaRepository<Integer, ReportedPostDto> {

    // 신고 중복 여부 확인을 위해 userId와 postId로 데이터를 select
    ReportedPostDto selectDuplicateOne(@Param("postId") Integer postId, @Param("userId") Integer userId);

    int completeReport(Integer postId);

    List<ReportedPostDto> completedReports();
}