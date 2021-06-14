package com.po;

import lombok.Data;

/**
 *springtest数据库中user表的持久化类
 */
@Data
public class MyUser {
    private Integer uid;
    private String uname;
    private String usex;
    //省略setter和getter方法
}
