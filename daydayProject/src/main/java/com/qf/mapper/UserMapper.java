package com.qf.mapper;

import com.qf.pojo.User;

public interface UserMapper {
    int insertUser(User user);

    User queryUser(String identity);

    User queryHasUsername(String username);

    User queryHasEmail(String email);
}
