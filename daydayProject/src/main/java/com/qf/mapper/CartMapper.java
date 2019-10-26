package com.qf.mapper;

import com.qf.pojo.Cart;
import com.qf.pojo.CartGoods;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

public interface CartMapper {
    int addCart(@Param("uid") int uid,@Param("detailId")int detailId ,@Param("num") int num,@Param("money")BigDecimal money);

    //查询购物车中的商品
    Cart queryGoodsByCart(@Param("uid") int uid,@Param("detailId") int detailId);

    //更新购物车中的数量
    int updateCart(@Param("uid") int uid, @Param("detailId") int detailId, @Param("num") int num, @Param("money") BigDecimal money);

    List<CartGoods> queryAllCartByUid(int uid);

    //查询该用户购物车中的数量
    int queryCartCount(int uid);
}
