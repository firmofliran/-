package com.qf.pojo;

import lombok.*;

import java.util.Date;
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Category {
    private Integer id;
    private String title;
    private String bannerPath;
    private String className;
    private Date createTime;
}
