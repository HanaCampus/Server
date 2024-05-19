package com.hana.app.repository;

import com.hana.app.data.dto.ScrapDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ScrapRepository extends HanaRepository<Integer, ScrapDto> {

    // 로그인 사용자가 스크랩을 눌렀는지 확인하는 기능
    ScrapDto isScrapedByUserId(@Param("postId") Integer postId, @Param("userId") Integer userId);

}