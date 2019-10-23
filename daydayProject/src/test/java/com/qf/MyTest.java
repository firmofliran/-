package com.qf;


import com.qf.mapper.GoodsMapper;
import com.qf.pojo.Goods;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class MyTest {
    @Test
    public void test(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        GoodsMapper goodsMapper = context.getBean("goodsMapper", GoodsMapper.class);
//        List<Goods> goodsList = goodsMapper.queryGoodsByIdCategory(1);
//        System.out.println(goodsList);
        System.out.println(goodsMapper.queryGoodsDetail(2));
    }
    @Test
    public void testQueryGoods(){

    }
}
