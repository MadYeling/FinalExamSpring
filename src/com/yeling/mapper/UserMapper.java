package com.yeling.mapper;

import com.yeling.beans.UserBean;

public interface UserMapper {
    /**
     * 通过用户名查询密码
     *
     * @param userName 用户名
     * @return 密码
     */
    String queryUserPassword(String userName);

    /**
     * 通过id查询用户
     *
     * @param id 用户id
     * @return 用户
     */
    UserBean queryUserById(int id);

    /**
     * 通过用户名查询用户
     *
     * @param userName 用户名
     * @return 用户
     */
    UserBean queryUserByName(String userName);

    /**
     * 修改用户
     *
     * @param userBean 用户
     */
    void updateUser(UserBean userBean);

    /**
     * 插入用户
     *
     * @param userBean 用户
     */
    void insertUser(UserBean userBean);
}
