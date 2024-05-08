package com.hana.app.service;

import com.hana.app.data.dto.ReportedCommentDto;
import com.hana.app.data.dto.ReportedPostDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.ReportedCommentRepository;
import com.hana.app.repository.ReportedPostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReportedPostService implements HanaService<Integer, ReportedPostDto> {

    private final ReportedPostRepository reportedPostRepository;

    @Override
    public int add(ReportedPostDto reportedPostDto) throws Exception {
        return reportedPostRepository.insert(reportedPostDto);
    }

    @Override
    public int del(Integer id) throws Exception {
        return reportedPostRepository.delete(id);
    }

    @Override
    public int modify(ReportedPostDto reportedPostDto) throws Exception {
        return reportedPostRepository.update(reportedPostDto);
    }

    @Override
    public ReportedPostDto get(Integer id) throws Exception {
        return reportedPostRepository.selectOne(id);
    }

    @Override
    public List<ReportedPostDto> get() throws Exception {
        return reportedPostRepository.select();
    }

    public ReportedPostDto findDuplicateOne(Integer postId, Integer userId) throws Exception {
        return reportedPostRepository.selectDuplicateOne(postId, userId);
    }

    public int completeReport(Integer postId) throws Exception {
        return reportedPostRepository.completeReport(postId);
    }

    public List<ReportedPostDto> completedReports() throws Exception{
        return reportedPostRepository.completedReports();
    }
}
