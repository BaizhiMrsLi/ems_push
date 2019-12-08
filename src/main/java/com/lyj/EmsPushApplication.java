package com.lyj;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan("com.lyj.dao")
public class EmsPushApplication {

    public static void main(String[] args) {
        SpringApplication.run(EmsPushApplication.class, args);
    }

}
