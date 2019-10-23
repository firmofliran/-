package com.qf.service;

import com.qf.pojo.User;

public interface UserService {
    int register(User user);

    User queryUser(String identity);

    User queryHasUsername(String username);

    User queryHasEmail(String email);
}
