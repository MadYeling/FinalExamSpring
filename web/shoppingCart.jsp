<%@ page import="com.yeling.beans.CartBean" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/22
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <style>
        * {
            padding: 0;
        }
    </style>
</head>
<body>

<%
    List<CartBean> cartBeans = (List<CartBean>) request.getAttribute("cartBeans");
    float price = (float) request.getAttribute("price");
%>

<table width="80%" align="center">
    <tr>
        <td height="113" align="center">
            <jsp:include page="components/header.jsp"/>
        </td>
    </tr>
    <tr>
        <td>
            <form method="post" action="ShoppingCartServlet">
                <table width="100%" border="1">
                    <tr>
                        <td colspan="6" align="center"><img src="image/shopcart1.png" alt=""></td>
                    </tr>
                    <tr>
                        <td width="25%" align="center">编号</td>
                        <td width="25%" align="center">名称</td>
                        <td width="25%" align="center">单价</td>
                        <td colspan="3" align="center">数量</td>
                    </tr>

                    <%
                        if (cartBeans.isEmpty()) {
                    %>
                    <tr>
                        <td align="center" colspan="6">
                            <h1>购物车中暂无商品</h1>
                        </td>
                    </tr>
                    <%

                    } else {
                        for (CartBean cartBean : cartBeans) {
                    %>
                    <tr>
                        <td align="center">
                            <%=cartBean.getGoodsId()%>
                        </td>
                        <td align="center">
                            <%=cartBean.getGoodsName()%>
                        </td>
                        <td align="center">
                            ￥<%=cartBean.getGoodsPrice()%>
                        </td>
                        <td width="9%" align="center">
                            <label for="textfield"></label>
                            <input name="number<%=cartBean.getGoodsId()%>" type="number" oninput="if(value<1)value=1" id="textfield" size="7"
                                   value="<%=cartBean.getNumber()%>"/></td>
                        <td width="8%" align="center">
                            <a href="ShoppingCartServlet?state=delOne&goodId=<%=cartBean.getGoodsId()%>">删除</a></td>
                        <td width="8%" align="center">
                            <a href="IndexServlet?&id=<%=cartBean.getGoodsId()%>">查看</a></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    <tr>
                        <td></td>
                        <td align="center"><input type="submit" name="del" id="button" value="删除全部书籍"/></td>
                        <td align="center"><input type="submit" name="alt" id="button2" value="修 改 数 量"/></td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="6">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">您共选择了价值￥<%=price%>的商品，点击<a href="IndexServlet?state=init">此处</a>继续购物</td>
                        <td colspan="4" align="right"><a href="ShoppingCartServlet?state=toLogin">下一步</a></td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td align="center">
            <jsp:include page="components/tail.jsp"/>
        </td>
    </tr>
</table>

</body>
</html>
