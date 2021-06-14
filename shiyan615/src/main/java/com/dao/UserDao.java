package com.dao;

import com.po.LoginUser;
import com.po.MyUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
//@Mapper
/*使用Spring自动扫描MyBatis的接口并装配
（Spring将指定包中所有被@Mapper注解标注的接口自动装配为MyBatis的映射接口*/
public interface UserDao {
    /**log4j.properties
     * 接口方法对应SQL映射文件UserMapper.xml中的id
     */
    public List<MyUser> selectUserByUname(MyUser user);

    public List<MyUser> findAll();

    //根据id查询,返回一个Book
    MyUser queryUserById(@Param("uid") int uid);

    //修改用户
    int updateUser(MyUser user);

    //根据id删除一个User
    int deleteUserById(@Param("uid") int uid);

    //增加一个User
    int addUser(MyUser user);

    //验证登录
    //查询Select
    LoginUser selectUser(LoginUser loginUser);
}

