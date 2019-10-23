package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Goods {
    private Integer id;
    private String title;
    private String imgPath;
    private BigDecimal price;
    private Date createTime;
    private Detail detail;
    private Integer categoryId;
    private String categoryName;
    private String bannerPath;

}
