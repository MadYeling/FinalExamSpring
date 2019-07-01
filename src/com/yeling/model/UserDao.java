package com.yeling.model;

import com.yeling.beans.UserBean;
import com.yeling.mapper.UserMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

public class UserDao implements IntUserDao {
    private SqlSessionFactory factory;
    private SqlSession session;
    private UserMapper mapper;

    public UserDao() throws IOException {
        Reader reader = Resources.getResourceAsReader("com/yeling/conf.xml");
        factory = new SqlSessionFactoryBuilder().build(reader);
    }

    // 初始化session和mapper
    private void buildSession() {
        session = factory.openSession();
        mapper = session.getMapper(UserMapper.class);
    }

    @Override
    public boolean check(String userName, String passwd) {
        if (passwd == null) {
            return false;
        }
        buildSession();
        String queriedPassword = mapper.queryUserPassword(userName);
        session.close();
        return passwd.equals(queriedPassword);
    }

    @Override
    public UserBean getUserById(int id) {
        UserBean userBean;
        buildSession();
        userBean = mapper.queryUserById(id);
        session.close();
        return userBean;
    }

    @Override
    public UserBean getUserByName(String name) {
        UserBean userBean;
        buildSession();
        userBean = mapper.queryUserByName(name);
        session.close();
        return userBean;
    }

    @Override
    public void altUser(UserBean userBean) {
        buildSession();
        mapper.updateUser(userBean);
        session.commit();
        session.close();
    }

    @Override
    public void addUser(UserBean userBean) {
        buildSession();
        mapper.insertUser(userBean);
        session.commit();
        session.close();
    }
}
