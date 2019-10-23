package com.qf.controller;

import cn.dsna.util.images.ValidateCode;
import com.qf.pojo.User;
import com.qf.service.UserService;
import com.qf.utils.R;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("/queryHasUsername")
    public String queryHasUsername(String username) {
        if (StringUtils.isEmpty(username)) {
            return "{\"msg\":\"yes\"}";
        }
        User user = userService.queryHasUsername(username);
        if (user != null) {
            return "{\"msg\":\"yes\"}";
        }
        return "{\"msg\":\"no\"}";
    }

    @RequestMapping("/queryHasEmail")
    public String queryHasEmail(String email) {
        if (StringUtils.isEmpty(email)) {
            return "{\"msg\":\"yes\"}";
        }
        User user = userService.queryHasEmail(email);
        if (user != null) {
            return "{\"msg\":\"yes\"}";
        }
        return "{\"msg\":\"no\"}";
    }

    @RequestMapping("/register")
    public String register(@RequestBody User user) {

        if (StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword()) || StringUtils.isEmpty(user.getEmail())) {
            return "{\"msg\":\"表单不能为空\"}";
        }
        int count = userService.register(user);
        if (count > 0) {
            return "{\"msg\":\"ok\"}";
        }
        return "{\"msg\":\"注册失败\"}";
    }

    @RequestMapping("login")
    public R login(HttpServletRequest request, String usernameOrEmail, String password, String vcode) {
        if (StringUtils.isEmpty(usernameOrEmail) || StringUtils.isEmpty(password)) {
            return R.error("账号或者密码不能为空");
        }
        String realCode = (String) request.getSession().getAttribute("vcode");
        if (!realCode.equalsIgnoreCase(vcode)) {
            return R.error("codeError");
        }
        UsernamePasswordToken token = new UsernamePasswordToken(usernameOrEmail, password);
        token.setRememberMe(true);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
        } catch (AuthenticationException e) {
            e.printStackTrace();
            return R.error("loginError");
        }
        return R.ok();
    }

    @RequestMapping("/createCode")
    public void createCode(HttpServletRequest request, HttpServletResponse response) {
        ValidateCode validateCode = new ValidateCode(100, 30, 4, 6);
        String code = validateCode.getCode();
        request.getSession().setAttribute("vcode", code);
        try {
            validateCode.write(response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
