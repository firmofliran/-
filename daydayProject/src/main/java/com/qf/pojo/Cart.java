package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
    private Integer id;
    private Integer uid;
    private Integer goodsId;
    private Integer num;
    private BigDecimal money;
}
