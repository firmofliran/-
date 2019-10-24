package com.qf;


import com.qf.mapper.GoodsMapper;
import com.qf.pojo.Goods;
import com.qf.service.impl.GoodsServiceImpl;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class MyTest {
    @Test
    public void test(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        GoodsServiceImpl goodsService = context.getBean("goodsServiceImpl", GoodsServiceImpl.class);
//        List<Goods> goodsList = goodsMapper.queryGoodsByIdCategory(1);
//        System.out.println(goodsList);
//        System.out.println(goodsMapper.queryGoodsDetail(2));
//        List<Goods> goodsList = goodsService.queryAllGoodsByCategoryId(1, 1, 3);
//        System.out.println(goodsList);
    }
    @Test
    public void testQueryGoods(){

    }
}
