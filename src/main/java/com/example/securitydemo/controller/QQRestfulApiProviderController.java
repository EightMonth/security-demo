package com.example.securitydemo.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author kezhijie@co-mall.com
 * @date 2021/7/10
 */
@RestController
@RequestMapping("/qq")
public class QQRestfulApiProviderController {

    @RequestMapping("/info/{qq}")
    public QQAccount info(@PathVariable("qq") String qq) {
        return InMemoryQQDatabase.database.get(qq);
    }

    @RequestMapping("/fans/{qq}")
    public List<QQAccount> fans(@PathVariable("qq") String qq) {
        return InMemoryQQDatabase.database.get(qq).getFans();
    }
}
