package com.hana.app.repository;

import com.hana.app.data.dto.ReportedCommentDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ReportedCommentRepository extends HanaRepository<Integer, ReportedCommentDto> {

}