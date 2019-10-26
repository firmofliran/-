package com.qf.service.impl;

import com.qf.mapper.CartMapper;
import com.qf.mapper.GoodsMapper;
import com.qf.pojo.Cart;
import com.qf.pojo.CartGoods;
import com.qf.pojo.Detail;
import com.qf.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    CartMapper cartMapper;
    @Autowired
    GoodsMapper goodsMapper;

    @Override
    public int addCart(int uid, int detailId, int num) {
        //获取商品的价格
        Detail detail = goodsMapper.queryGoodsDetail(detailId);
        BigDecimal money = detail.getPrice().multiply(new BigDecimal(num));
        //购物车中是否含有此商品，有则修改，没有则添加
        Cart cart = cartMapper.queryGoodsByCart(uid, detailId);
        if (cart == null) {
            return cartMapper.addCart(uid, detailId, num, money);
        }
        return cartMapper.updateCart(uid, detailId, num, money);
    }

    @Override
    public List<CartGoods> queryAllCartByUid(int uid) {
        //查询一个用户的所有购物车的商品的信息，用来展示购物商品用的
        return cartMapper.queryAllCartByUid(uid);
    }

    @Override
    public int queryCartCount(int uid) {
        return cartMapper.queryCartCount(uid);
    }

}
