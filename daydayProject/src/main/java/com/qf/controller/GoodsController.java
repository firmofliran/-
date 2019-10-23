package com.qf.controller;

import com.qf.pojo.Category;
import com.qf.pojo.Detail;
import com.qf.pojo.Goods;
import com.qf.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    GoodsService gs;

    @RequestMapping("queryCategory")
    public String queryAllCategory(HttpServletRequest request) {
        List<Category> categoryList = gs.queryAllCategory();
        request.setAttribute("categoryList", categoryList);
        return "category";
    }

    @RequestMapping("/queryGoodsByCategoryId/{id}")
    public String queryGoodsByCategoryId(@PathVariable Integer id, HttpServletRequest request) {
        if (id == null) {
            return null;
        }
        List<Goods> categoryGoodsList = gs.queryGoodsByIdCategory(id);
        request.setAttribute("categoryGoodsList", categoryGoodsList.subList(0, 4));
        request.setAttribute("moreGoodsList", categoryGoodsList.subList(4, 7));
        if (!categoryGoodsList.isEmpty())
            request.setAttribute("bannerPath", categoryGoodsList.get(0).getBannerPath());
        return "categoryGoods";
    }

    @RequestMapping("/queryGoodsDetail/{id}")
    public String queryGoodsDetail(@PathVariable Integer id, HttpServletRequest request) {
        if (id == null) return null;
        Detail detail = gs.queryGoodsDetail(id);
        request.setAttribute("detail", detail);
        return "detail";
    }
}
