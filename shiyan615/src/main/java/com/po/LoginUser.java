package com.po;

import lombok.Data;

import java.io.Serializable;

@Data
public class LoginUser implements Serializable {
    private Integer id;
    private String username;
    private String password;
}
