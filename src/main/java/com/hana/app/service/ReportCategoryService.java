package com.hana.app.service;

import com.hana.app.data.dto.PostDto;
import com.hana.app.data.dto.ReportCategoryDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.ReportCategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReportCategoryService implements HanaService<Integer, ReportCategoryDto> {
    private final ReportCategoryRepository reportCategoryRepository;

    @Override
    public int add(ReportCategoryDto reportCategoryDto) throws Exception {
        return reportCategoryRepository.insert(reportCategoryDto);
    }

    @Override
    public int del(Integer integer) throws Exception {
        return reportCategoryRepository.delete(integer);
    }

    @Override
    public int modify(ReportCategoryDto reportCategoryDto) throws Exception {
        return reportCategoryRepository.update(reportCategoryDto);
    }

    @Override
    public ReportCategoryDto get(Integer integer) throws Exception {
        return reportCategoryRepository.selectOne(integer);
    }

    @Override
    public List<ReportCategoryDto> get() throws Exception {
        return reportCategoryRepository.select();
    }
}
