package com.yeling.servlet;

import com.yeling.beans.CartBean;
import com.yeling.beans.UserBean;
import com.yeling.model.CartDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        CartDao cartDao;
        // 判断是否创建过购物车
        if (session.getAttribute("cartDao") == null) {
            cartDao = new CartDao();
        } else {
            cartDao = (CartDao) session.getAttribute("cartDao");
        }

        // 点击了删除按钮
        if (request.getParameter("del") != null) {
            cartDao.cleanGoods();
            session.setAttribute("cartDao", cartDao);
            response.sendRedirect("IndexServlet?state=init");
            return;
        }

        // 点击了修改数量按钮
        if (request.getParameter("alt") != null) {
            List<CartBean> cartBeans = cartDao.showCarts();
            for (CartBean cartBean : cartBeans) {
                int nub = Integer.parseInt(request.getParameter("number" + cartBean.getGoodsId()));
                cartDao.updateGoodsNumber(cartBean.getGoodsId(), nub);
            }
            session.setAttribute("cartDao", cartDao);
            response.sendRedirect("ShoppingCartServlet?state=init");
            return;
        }

        String state = request.getParameter("state");
        // 判断是否有state参数
        if (state == null) {
            response.getWriter().println("<h1>无效的请求！</h1>");
            return;
        }

        // 初始化购物车
        if ("init".equals(state)) {
            List<CartBean> cartBeans = cartDao.showCarts();
            float price = cartDao.getTotalPrice();
            request.setAttribute("price", price);
            request.setAttribute("cartBeans", cartBeans);
            request.getRequestDispatcher("shoppingCart.jsp").include(request, response);
            return;
        }

        // 从商品详情页面点击购买
        if ("buy".equals(state)) {
            int goodId = Integer.parseInt(request.getParameter("goodId"));
            cartDao.addGoods(goodId, 1);
            response.sendRedirect("ShoppingCartServlet?state=init");
            session.setAttribute("cartDao", cartDao);
            return;
        }

        // 删除一个商品
        if ("delOne".equals(state)) {
            int goodId = Integer.parseInt(request.getParameter("goodId"));
            cartDao.delGoods(goodId);
            response.sendRedirect("ShoppingCartServlet?state=init");
            session.setAttribute("cartDao", cartDao);
            return;
        }

        // 跳转到登录
        if ("toLogin".equals(state)) {
            List<CartBean> cartBeans = cartDao.showCarts();
            if (cartBeans.size() == 0) {
                out.print("<script>alert('您还未选择任何商品！'); window.location='index.jsp' </script>");
                return;
            }
            if (session.getAttribute("userAlreadyLogin") != null) {
                response.sendRedirect("UserServlet?state=alreadyLogin");
                return;
            } else {
                response.sendRedirect("orderFormLogin.jsp");
                return;
            }
        }

        response.getWriter().println("<h1>无效的请求！</h1>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
