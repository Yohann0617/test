package com.service;

import com.dao.UserDao;
import com.github.pagehelper.PageHelper;
import com.po.LoginUser;
import com.po.MyUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("userService")
@Transactional
/**加上注解@Transactional,可以指定这个类需要受Spring的事务管理
 注意@Transactional只能针对public属性范围内的方法添加，
 本案例并不需要处理事务，在这里只是告诉读者如何使用事务*/
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDao userDao;
    @Override
    public List<MyUser> selectUserByUname(MyUser user) {
        return userDao.selectUserByUname(user);
    }


    @Override
    public List<MyUser> findAllUser(int page,int size) {
        //开始分页
        PageHelper.startPage(page,size);
        return userDao.findAll();
    }

    @Override
    public boolean login(LoginUser loginUser) {
        //查询user表中是否有用户输入的账号和密码
        if (userDao.selectUser(loginUser) != null){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public int deleteUserById(int uid) {
        return userDao.deleteUserById(uid);
    }

    @Override
    public int updateUser(MyUser user) {
        return userDao.updateUser(user);
    }

    @Override
    public MyUser queryUserById(int uid) {
        return userDao.queryUserById(uid);
    }

    @Override
    public int addUser(MyUser user) {
        return userDao.addUser(user);
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}

