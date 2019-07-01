package com.yeling.model;

import com.yeling.beans.UserBean;

public interface IntUserDao {
    boolean check(String userName, String passwd);

    UserBean getUserById(int id);

    UserBean getUserByName(String name);

    void altUser(UserBean userBean);

    void addUser(UserBean userBean);
}
