package com.yeling.model;

import com.yeling.beans.GoodsBean;

import java.util.List;

public interface IntGoodsDao {
    /**
     * 通过id获取商品
     *
     * @param id 商品id
     * @return 封装类 GoodsBean
     */
    GoodsBean getGoodsById(int id);

    /**
     * 分页显示方法
     *
     * @param pageSize 每页显示数量
     * @param pageNow  当前页
     * @return 返回封装类集合
     */
    List<GoodsBean> getGoodsSeparatePage(int pageSize, int pageNow);

    /**
     * 获取总数
     *
     * @return 数量
     */
    int getCount(int pageSize);
}
