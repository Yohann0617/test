package com.service;

import com.po.LoginUser;
import com.po.MyUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    public List<MyUser> selectUserByUname(MyUser user);

    public List<MyUser> findAllUser(int page,int size);

    boolean login(LoginUser loginUser);

    //根据id删除一个Book
    int deleteUserById(int uid);

    //修改用户
    int updateUser(MyUser user);

    //根据id查询,返回一个Book
    MyUser queryUserById(int uid);

    //增加一个User
    int addUser(MyUser user);
}

