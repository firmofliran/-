package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Detail {
    private Integer id;
    private String mainTitle;
    private String subTitle;
    private BigDecimal price;
    private String product;
    private Integer goodsId;
    private String imgPath;
    private Integer categoryId;
}
