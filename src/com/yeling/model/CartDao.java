package com.yeling.model;

import com.yeling.beans.CartBean;
import com.yeling.beans.GoodsBean;
import com.yeling.mapper.CartMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class CartDao implements IntCartDao {
    /**
     * 购物车集合
     */
    private HashMap<Integer, Integer> cart = new HashMap<>();

    @Override
    public void addGoods(int goodsId, int number) {
        int n = number;
        if (cart.get(goodsId) != null) {
            n += cart.get(goodsId);
        }
        cart.put(goodsId, n);
    }

    @Override
    public void delGoods(int goodsId) {
        cart.remove(goodsId);
    }

    @Override
    public void cleanGoods() {
        cart.clear();
    }

    @Override
    public void updateGoodsNumber(int goodsId, int number) {
        cart.put(goodsId, number);
    }

    @Override
    public List<CartBean> showCarts() {
        List<CartBean> carts = new ArrayList<>();
        Iterator<Integer> iterator = cart.keySet().iterator();
        List<Integer> integers = new ArrayList<>();
        while (iterator.hasNext()) {
            integers.add(iterator.next());
        }
        try {
            if (integers.size() > 0) {
                System.out.println(integers.toString());
                Reader reader = Resources.getResourceAsReader("com/yeling/conf.xml");
                SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(reader);
                SqlSession session = factory.openSession();
                CartMapper mapper = session.getMapper(CartMapper.class);
                List<GoodsBean> goodsBeans = mapper.queryGoodsBySomeId(integers);
                session.close();
                for (GoodsBean goodsBean : goodsBeans) {
                    CartBean cartBean = new CartBean(goodsBean.getGoodsId(),
                            goodsBean.getGoodsName(),
                            Float.parseFloat(goodsBean.getGoodsPrice()),
                            cart.get(goodsBean.getGoodsId()));
                    carts.add(cartBean);
                    System.out.println(goodsBean.getGoodsName());
                }
            }
            return carts;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return carts;
    }

    @Override
    public float getTotalPrice() {
        List<CartBean> carts = this.showCarts();
        float price = 0;
        for (CartBean cartBean : carts) {
            price += cartBean.getGoodsPrice() * cartBean.getNumber();
        }
        return price;
    }
}
