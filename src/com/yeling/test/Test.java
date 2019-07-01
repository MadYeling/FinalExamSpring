package com.yeling.test;

import com.yeling.beans.GoodsBean;
import com.yeling.beans.UserBean;
import com.yeling.mapper.CartMapper;
import com.yeling.mapper.UserMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.ResourceBundle;

public class Test {

    public static void main(String[] args) throws IOException {
//        System.out.println(getPageSizeFromProperties());

        Reader reader = Resources.getResourceAsReader("com/yeling/conf.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(reader);
        SqlSession session = factory.openSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        UserBean userBean = mapper.queryUserByName("yeling");
        System.out.println(userBean.toString());
        session.commit();
        session.close();
    }

    private static String getPageSizeFromProperties() {
        //config为属性文件名，放在包com.test.config下，如果是放在src下，直接用config即可
        ResourceBundle resource = ResourceBundle.getBundle("com/yeling/db");
        String key = resource.getString("pageSize");
        return key;
    }
}
