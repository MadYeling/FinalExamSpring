package com.yeling.servlet;

import com.yeling.beans.CartBean;
import com.yeling.beans.UserBean;
import com.yeling.model.CartDao;
import com.yeling.model.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "UserServlet")
public class UserServlet extends HttpServlet {
    private UserDao userDao;

    {
        try {
            userDao = new UserDao();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        if (request.getParameter("login") != null) {
            String name = request.getParameter("username");
            String pass = request.getParameter("passwd");
            if (userDao.check(name, pass)) {
                UserBean userBean = userDao.getUserByName(name);
                session.setAttribute("userAlreadyLogin", userBean);
                jumpToFinish(request, response, userBean);
            } else {
                out.print("<script>alert('用户名或密码错误，请重新登录！'); window.location='orderFormLogin.jsp' </script>");
            }
            return;
        }

        if (request.getParameter("returnToCart") != null) {
            response.sendRedirect("ShoppingCartServlet?state=init");
            return;
        }

        if (request.getParameter("alt") != null) {
            UserBean userBean = (UserBean) session.getAttribute("userAlreadyLogin");
            request.setAttribute("userBean", userBean);
            request.getRequestDispatcher("altUserMessage.jsp").forward(request, response);
            return;
        }

        if (request.getParameter("finish") != null) {
            return;
        }

        if (request.getParameter("altNow") != null) {
            String userName = request.getParameter("username");
            String truename = request.getParameter("truename");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String postcode = request.getParameter("postcode");
            UserBean userBean = (UserBean) session.getAttribute("userAlreadyLogin");
            userBean.setUsername(userName);
            userBean.setTruename(truename);
            userBean.setAddress(address);
            userBean.setPhone(phone);
            userBean.setEmail(email);
            userBean.setPostcode(postcode);
            userDao.altUser(userBean);
            session.setAttribute("userAlreadyLogin", userBean);

            out.print("<script>alert('修改完成！'); window.location='UserServlet?state=alreadyLogin' </script>");
            return;
        }

        if (request.getParameter("register") != null) {
            String userName = request.getParameter("username");
            String passwd = request.getParameter("passwd");
            String truename = request.getParameter("truename");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String postcode = request.getParameter("postcode");
            UserBean userBean = new UserBean();
            userBean.setUsername(userName);
            userBean.setPasswd(passwd);
            userBean.setTruename(truename);
            userBean.setAddress(address);
            userBean.setPhone(phone);
            userBean.setEmail(email);
            userBean.setPostcode(postcode);
            userBean.setGrade(1);
            userDao.addUser(userBean);
            out.print("<script>alert('注册完成！'); window.location='login.jsp' </script>");
            return;
        }

        if (request.getParameter("loginFromOut") != null) {
            String name = request.getParameter("username");
            String pass = request.getParameter("passwd");
            if (userDao.check(name, pass)) {
                UserBean userBean = userDao.getUserByName(name);
                session.setAttribute("userAlreadyLogin", userBean);
                out.print("<script>alert('登录成功！'); window.location='index.jsp' </script>");
            } else {
                out.print("<script>alert('用户名或密码错误，请重新登录！'); window.location='login.jsp' </script>");
            }
            return;
        }

        if (request.getParameter("reg") != null) {
            response.sendRedirect("userRegister.jsp");
        }

        String state = request.getParameter("state");
        if (state != null) {
            UserBean userBean = (UserBean) session.getAttribute("userAlreadyLogin");
            switch (state) {
                case "alreadyLogin":
                    jumpToFinish(request, response, userBean);
                    break;
                case "myAccount":
                    if (userBean == null) {
                        response.sendRedirect("login.jsp");
                        return;
                    }
                    request.setAttribute("userBean", userBean);
                    request.getRequestDispatcher("myMessage.jsp").forward(request, response);
                    break;
                default:
                    break;
            }
            return;
        }

        response.getWriter().println("<h1>无效的请求</h1>");
    }

    private void jumpToFinish(HttpServletRequest request, HttpServletResponse response, UserBean userBean) throws ServletException, IOException {
        HttpSession session = request.getSession();
        CartDao cartDao = (CartDao) session.getAttribute("cartDao");
        List<CartBean> cartBean = cartDao.showCarts();
        request.setAttribute("userBean", userBean);
        request.setAttribute("cartDao", cartDao);
        request.setAttribute("cartBeans", cartBean);
        request.getRequestDispatcher("shopMessage.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
