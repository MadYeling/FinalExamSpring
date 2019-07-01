package com.yeling.model;

import com.yeling.beans.GoodsBean;
import com.yeling.mapper.GoodsMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

// 已将连接方式改为MyBatis
public class GoodsDao implements IntGoodsDao {
    private SqlSessionFactory factory;
    private SqlSession session;
    private GoodsMapper mapper;

    public GoodsDao() throws IOException {
        Reader reader = Resources.getResourceAsReader("com/yeling/conf.xml");
        factory = new SqlSessionFactoryBuilder().build(reader);
    }

    // 初始化session和mapper
    private void buildSession() {
        session = factory.openSession();
        mapper = session.getMapper(GoodsMapper.class);
    }

    // 使用MyBatis的获取
    @Override
    public GoodsBean getGoodsById(int id) {
        buildSession();
        GoodsBean goodsBean = mapper.queryGoodsById(id);
        session.close();
        return goodsBean;
    }

    // 使用MyBatis的分页
    @Override
    public List<GoodsBean> getGoodsSeparatePage(int pageSize, int pageNow) {
        int limit = pageSize * (pageNow - 1);
        buildSession();
        List<GoodsBean> list = mapper.getGoodsSeparatePage(limit, pageSize);
        session.close();
        return list;
    }

    // 使用MyBatis的页数获取
    @Override
    public int getCount(int pageSize) {
        int count = 0;
        buildSession();
        int all = mapper.getCount();
        session.close();
        count = (all % pageSize == 0) ? all / pageSize : all / pageSize + 1;
        return count;
    }

}
