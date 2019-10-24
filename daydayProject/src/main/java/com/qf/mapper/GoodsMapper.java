package com.qf.mapper;

import com.qf.pojo.Category;
import com.qf.pojo.Detail;
import com.qf.pojo.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsMapper {
    //查询所有类别
    List<Category> queryAllCategory();

    //查询某个类别的所有商品通过类别id
    List<Goods> queryGoodsByIdCategory(int id);

    //通过商品id查看商品详情
    Detail queryGoodsDetail(Integer id);

    //查询所有商品通过类别id
    List<Detail> queryAllGoodsByCategoryId(@Param("id") Integer id, @Param("isPriceSort") String isPriceSort);
}
