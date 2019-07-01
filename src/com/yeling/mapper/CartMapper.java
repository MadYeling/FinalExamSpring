package com.yeling.mapper;

import com.yeling.beans.GoodsBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartMapper {
    /**
     * 查询部分商品
     *
     * @param integers 数组，存放了物品id
     * @return 商品
     */
    List<GoodsBean> queryGoodsBySomeId(@Param("integers") List<Integer> integers);
}
