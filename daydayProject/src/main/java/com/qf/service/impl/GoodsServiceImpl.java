package com.qf.service.impl;

import com.github.pagehelper.PageHelper;
import com.qf.mapper.GoodsMapper;
import com.qf.pojo.Category;
import com.qf.pojo.Detail;
import com.qf.pojo.Goods;
import com.qf.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    GoodsMapper goodsMapper;
    @Override
    public List<Category> queryAllCategory() {
        return goodsMapper.queryAllCategory();
    }

    @Override
    public List<Goods> queryGoodsByIdCategory(int id) {
        return goodsMapper.queryGoodsByIdCategory(id);
    }

    @Override
    public Detail queryGoodsDetail(Integer id) {
        return goodsMapper.queryGoodsDetail(id);
    }

    @Override
    public List<Detail> queryAllGoodsByCategoryId(Integer id,int currentPage,int pageSize,String isPriceSort) {
        PageHelper.startPage(currentPage,pageSize);
        return goodsMapper.queryAllGoodsByCategoryId( id,isPriceSort);
    }

}
