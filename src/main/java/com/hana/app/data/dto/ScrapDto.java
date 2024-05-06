package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ScrapDto {
    private int scrapId;
    private int userId;
    private ArrayList<PostDto> posts;
    private LocalDateTime createDate;
    private LocalDateTime updateDate;
}
