package com.qf.service;

import com.qf.pojo.Cart;
import com.qf.pojo.CartGoods;

import java.math.BigDecimal;
import java.util.List;

public interface CartService {
    int addCart(int uid, int detailId, int num);

    List<CartGoods> queryAllCartByUid(int uid);

    int queryCartCount(int uid);
}
