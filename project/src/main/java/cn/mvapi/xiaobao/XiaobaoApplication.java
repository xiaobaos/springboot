package cn.mvapi.xiaobao;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan(basePackages = {"cn.mvapi.xiaobao.*"})
@SpringBootApplication
public class XiaobaoApplication {

    public static void main(String[] args) {
        SpringApplication.run(XiaobaoApplication.class, args);
        System.out.println("启动成功！");
    }

}
