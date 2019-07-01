package com.yeling.model;

import com.yeling.beans.CartBean;

import java.util.List;

public interface IntCartDao {
    /**
     * 添加货物
     *
     * @param goodsId 货物id
     * @param number  数量
     */
    void addGoods(int goodsId, int number);

    /**
     * 删除货物
     *
     * @param goodsId 货物id
     */
    void delGoods(int goodsId);

    /**
     * 删除所有货物
     */
    void cleanGoods();

    /**
     * 修改货物数量
     *
     * @param goodsId 货物id
     * @param number  数量
     */
    void updateGoodsNumber(int goodsId, int number);

    /**
     * 获取购物车
     *
     * @return 返回购物车集合
     */
    List<CartBean> showCarts();

    /**
     * 获取总价
     *
     * @return 总价
     */
    float getTotalPrice();
}
