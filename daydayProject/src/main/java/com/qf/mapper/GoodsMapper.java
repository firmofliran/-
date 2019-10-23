package com.qf.mapper;

import com.qf.pojo.Category;
import com.qf.pojo.Detail;
import com.qf.pojo.Goods;

import java.util.List;

public interface GoodsMapper {
        List<Category> queryAllCategory();
        List<Goods> queryGoodsByIdCategory(int id);

    Detail queryGoodsDetail(Integer id);
}
