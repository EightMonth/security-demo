package com.example.securitydemo.mapper;

import com.example.securitydemo.entity.RolePermisson;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author kezhijie@co-mall.com
 * @date 2021/7/10
 */
@Mapper
public interface PermissionMapper {
    @Select( "SELECT A.NAME AS roleName,C.url FROM role AS A LEFT JOIN role_permission B ON A.id=B.role_id LEFT JOIN permission AS C ON B.permission_id=C.id" )
    List<RolePermisson> getRolePermissions();
}
