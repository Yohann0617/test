package com.service;

import com.po.MyUser;

import java.util.List;

public interface UserService {
    public List<MyUser> selectUserByUname(MyUser user);
}

