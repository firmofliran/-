package com.qf.service;

import com.qf.mapper.GoodsMapper;
import com.qf.pojo.Category;
import com.qf.pojo.Detail;
import com.qf.pojo.Goods;

import java.util.List;
public interface GoodsService {

    List<Category> queryAllCategory();
    List<Goods> queryGoodsByIdCategory(int id);

    Detail queryGoodsDetail(Integer id);

}
