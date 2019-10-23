package com.qf.service.impl;

import com.qf.mapper.UserMapper;
import com.qf.pojo.User;
import com.qf.service.UserService;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public int register(User user) {

        User user1 = queryHasUsername(user.getUsername());
        User user2 = queryHasEmail(user.getEmail());
        //防止别人跳过前台，直接进入后台
        if(user1!=null||user2!=null){
            return 0;
        }
        user.setRegTime(new Date());
        user.setSalt(UUID.randomUUID().toString());
        String pwd = new Sha256Hash(user.getPassword(), user.getSalt(), 10000).toBase64();
        user.setPassword(pwd);
        return userMapper.insertUser(user);
    }

    @Override
    public User queryUser(String identity) {
        return userMapper.queryUser(identity);
    }

    @Override
    public User queryHasUsername(String username) {
        return userMapper.queryHasUsername(username);
    }

    @Override
    public User queryHasEmail(String email) {
        return userMapper.queryHasEmail(email);
    }
}
