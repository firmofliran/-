package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartGoods {
    private Integer goodId;
    private String  mainTitle;
    private BigDecimal price;
    private Integer num;
    private BigDecimal totalMoney;
    private String imgPath;
}
