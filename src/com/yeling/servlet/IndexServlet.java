package com.yeling.servlet;

import com.yeling.beans.GoodsBean;
import com.yeling.model.GoodsDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;
import java.util.ResourceBundle;

public class IndexServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        int pageSize = getPageSizeFromProperties();

        if (request.getParameter("back") != null) {
            response.sendRedirect("IndexServlet?state=init");
            return;
        }

        if (request.getParameter("buy") != null) {
            if (session.getAttribute("cartGoodsId") != null) {
                int goodId = (int) session.getAttribute("cartGoodsId");
                System.out.println(goodId);
                response.sendRedirect("ShoppingCartServlet?state=buy&goodId=" + goodId);
            } else {
                response.sendRedirect("IndexServlet?state=init");
            }
            return;
        }

        GoodsDao goodsDao = new GoodsDao();

        String goodId = request.getParameter("id");
        if (goodId != null) {
            int id = Integer.parseInt(goodId);
            GoodsBean goodsBean = goodsDao.getGoodsById(id);
            request.setAttribute("goods", goodsBean);
            request.getRequestDispatcher("showDetail.jsp").include(request, response);
            return;
        }

        String state = request.getParameter("state");
        // 获取商品总数用以分页
        int count = goodsDao.getCount(6);
        request.setAttribute("count", count);

        // 判断是否有state参数
        if (state == null) {
            response.getWriter().append("<h1>无效的请求！</h1>");
            return;
        }

        // 初始化
        if ("init".equals(state)) {
            List<GoodsBean> list = goodsDao.getGoodsSeparatePage(pageSize, 1);
            request.setAttribute("goods", list);
            request.setAttribute("page", 1);
            request.getRequestDispatcher("index.jsp").include(request, response);
            return;
        }

        // 分页
        if ("next".equals(state)) {
            int pageNow = Integer.parseInt(request.getParameter("page"));
            List<GoodsBean> list = goodsDao.getGoodsSeparatePage(pageSize, pageNow);
            request.setAttribute("goods", list);
            request.setAttribute("page", pageNow);
            request.getRequestDispatcher("index.jsp").include(request, response);
            return;
        }
    }

    private int getPageSizeFromProperties() {
        ResourceBundle resource = ResourceBundle.getBundle("com/yeling/db");
        String key = resource.getString("pageSize");
        if ("".equals(key)) {
            key = "6";
        }
        return Integer.parseInt(key);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
