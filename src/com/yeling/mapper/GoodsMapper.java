package com.yeling.mapper;

import com.yeling.beans.GoodsBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 这是MyBatis的约定接口, 无需实现
 */
public interface GoodsMapper {
    /**
     * 通过id获取商品
     *
     * @param id 商品id
     * @return 封装类 GoodsBean
     */
    GoodsBean queryGoodsById(int id);

    /**
     * 分页显示方法
     *
     * @param limit    从第几个开始查询
     * @param pageSize 查询几个
     * @return 返回封装类集合
     */
    // 通过注解申明了传入的参数
    List<GoodsBean> getGoodsSeparatePage(@Param("limit") int limit, @Param("pageSize") int pageSize);

    /**
     * 获取总数
     *
     * @return 数量
     */
    int getCount();
}
