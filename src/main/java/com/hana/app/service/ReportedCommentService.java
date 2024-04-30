package com.hana.app.service;

import com.hana.app.data.dto.ReportedCommentDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.ReportedCommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReportedCommentService implements HanaService<Integer, ReportedCommentDto> {

    private final ReportedCommentRepository reportedCommentRepository;

    @Override
    public int add(ReportedCommentDto reportedCommentDto) throws Exception {
        return reportedCommentRepository.insert(reportedCommentDto);
    }

    @Override
    public int del(Integer id) throws Exception {
        return reportedCommentRepository.delete(id);
    }

    @Override
    public int modify(ReportedCommentDto reportedCommentDto) throws Exception {
        return reportedCommentRepository.update(reportedCommentDto);
    }

    @Override
    public ReportedCommentDto get(Integer id) throws Exception {
        return reportedCommentRepository.selectOne(id);
    }

    @Override
    public List<ReportedCommentDto> get() throws Exception {
        return reportedCommentRepository.select();
    }
}