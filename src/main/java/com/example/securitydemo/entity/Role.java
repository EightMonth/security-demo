package com.example.securitydemo.entity;

import org.springframework.security.core.GrantedAuthority;

/**
 * @author kezhijie@co-mall.com
 * @date 2021/7/10
 */
public class Role implements GrantedAuthority {
    private Long id;
    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String getAuthority() {
        return name;
    }

}
