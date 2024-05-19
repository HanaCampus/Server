package com.hana.app.service;

import com.hana.app.data.dto.ScrapDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.ScrapRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ScrapService implements HanaService<Integer, ScrapDto> {

    final ScrapRepository ScrapRepository;

    @Override
    public int add(ScrapDto ScrapDto) throws Exception {
        return ScrapRepository.insert(ScrapDto);
    }

    @Override
    public int del(Integer id) throws Exception {
        return ScrapRepository.delete(id);
    }

    @Override
    public int modify(ScrapDto ScrapDto) throws Exception {
        return ScrapRepository.update(ScrapDto);
    }

    @Override
    public ScrapDto get(Integer id) throws Exception {
        return ScrapRepository.selectOne(id);
    }

    @Override
    public List<ScrapDto> get() throws Exception {
        return ScrapRepository.select();
    }

    public ScrapDto isScrapedByUserId(Integer postId, Integer userId) throws Exception {
        return ScrapRepository.isScrapedByUserId(postId, userId);
    }

}
