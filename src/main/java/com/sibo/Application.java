package com.sibo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

/**
 * 启动程序
 *
 * @author chenzz
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
//@ServletComponentScan(basePackages = "com.sibo.netty")//扫描web服务
public class Application extends SpringBootServletInitializer {
    public static void main(String[] args) {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(Application.class, args);
        System.out.println("~~~~~~(_o_)-----555.running------(^o^)~~~~~~~");
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(Application.class);
    }

    @Bean
    public RestTemplate restTemplate() {

        SimpleClientHttpRequestFactory requestFactory = new SimpleClientHttpRequestFactory();
        requestFactory.setConnectTimeout(100000);
        requestFactory.setReadTimeout(100000);
        RestTemplate restTemplate = new RestTemplate(requestFactory);
        return restTemplate;
    }

}