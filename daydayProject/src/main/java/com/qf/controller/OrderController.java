package com.qf.controller;

import com.qf.pojo.CartGoods;
import com.qf.pojo.User;
import com.qf.service.CartService;
import com.qf.service.UserService;
import com.qf.utils.R;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.rmi.server.UID;
import java.util.List;

@Controller
@RequestMapping("order")
public class OrderController {
    @Autowired
    CartService cartService;

    @Autowired
    UserService userService;

    @RequestMapping("addCart")
    @ResponseBody
    public R addCart(Integer detailId, Integer num) {
        if (num == null || detailId == null) {
            return null;
        }
        if(SecurityUtils.getSubject().isAuthenticated()){
            return R.error("login");
        }
        User user = userService.queryUser((String) SecurityUtils.getSubject().getPrincipal());
        int count = cartService.addCart(user.getId(), detailId, num);
        if (count > 0) {
            return R.ok();
        }
        return R.error("添加购物车失败");
    }

    @RequestMapping("queryCartCount")
    @ResponseBody
    public R queryCartCount() {
        User user = userService.queryUser((String) SecurityUtils.getSubject().getPrincipal());
        if (user == null) {
            return R.error();
        }
        int count = cartService.queryCartCount(user.getId());
        return R.ok(count+"");
    }

    @RequiresAuthentication
    @RequestMapping("queryAllCartInfo")
    public String queryAllCartInfo(HttpServletRequest request){
        User user = userService.queryUser((String) SecurityUtils.getSubject().getPrincipal());
        List<CartGoods> cartGoodsList = cartService.queryAllCartByUid(user.getId());
        request.setAttribute("cartGoodsList",cartGoodsList);
        return "cart";
    }

}
