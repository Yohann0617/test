package com.dao;

import com.po.MyUser;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
@Mapper
/*使用Spring自动扫描MyBatis的接口并装配
（Spring将指定包中所有被@Mapper注解标注的接口自动装配为MyBatis的映射接口*/
public interface UserDao {
    /**log4j.properties
     * 接口方法对应SQL映射文件UserMapper.xml中的id
     */
    public List<MyUser> selectUserByUname(MyUser user);
}

