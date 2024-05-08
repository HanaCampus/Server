package com.hana.app.repository;

import com.hana.app.data.dto.ReportCategoryDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ReportCategoryRepository extends HanaRepository<Integer, ReportCategoryDto> {
}
