package com.hana.util.kakao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
@Slf4j
public class KakaoKey {

    @Value("${app.url.kakao-api-key}")
    private String kakaoApiKey;

    @Value("${app.url.kakao-redirect-url}")
    private String kakaoRedirectUrl;

}
