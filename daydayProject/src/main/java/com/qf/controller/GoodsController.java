package com.qf.controller;

import com.github.pagehelper.PageInfo;
import com.qf.pojo.Category;
import com.qf.pojo.Detail;
import com.qf.pojo.Goods;
import com.qf.service.CartService;
import com.qf.service.GoodsService;
import com.qf.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
    @RequestMapping("/queryAllById/{id}")
    public String queryAllGoodsByCategoryId(@PathVariable Integer id, HttpServletRequest request) {
        if (id == null) return null;
        List<Detail> detailList = gs.queryAllGoodsByCategoryId(id,1,4,null);
        PageInfo<Detail> detailPageInfo = new PageInfo<>(detailList);
        request.setAttribute("detailPageInfo", detailPageInfo);
        return "list";
    }
    @ResponseBody
    @RequestMapping("/queryAllByIdJson")
    public PageInfo queryAllGoodsByCategoryIdByJson( Integer id,Integer currentPage,Integer pageSize,String isPriceSort, HttpServletRequest request) {
        if (id == null) return null;
        if(currentPage==null||currentPage<=0){
            currentPage=1;
        }
        if(pageSize==null){
            pageSize=4;
        }
        if("false".equals(isPriceSort)){
            isPriceSort=null;
        }
        List<Detail> detailList = gs.queryAllGoodsByCategoryId(id,currentPage,pageSize,isPriceSort);
        PageInfo<Detail> detailPageInfo = new PageInfo<>(detailList);
        request.setAttribute("detailPageInfo", detailPageInfo);
        return detailPageInfo;
    }
}
