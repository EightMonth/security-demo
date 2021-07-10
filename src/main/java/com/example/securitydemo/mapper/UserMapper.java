package com.example.securitydemo.mapper;

import com.example.securitydemo.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @author kezhijie@co-mall.com
 * @date 2021/7/10
 */
@Mapper
public interface UserMapper {
    @Select( "select id , username , password from user where username = #{username}" )
    User loadUserByUsername(@Param("username") String username);
}
