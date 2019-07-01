<%@ page import="com.yeling.beans.UserBean" %>
<%@ page import="java.awt.*" %>
<%@ page import="com.yeling.beans.GoodsBean" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yeling.beans.CartBean" %>
<%@ page import="com.yeling.model.CartDao" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/3
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物信息</title>
</head>
<body>
<%
    UserBean userBean = (UserBean) request.getAttribute("userBean");
    List<CartBean> cartBean = (List<CartBean>) request.getAttribute("cartBeans");
    CartDao cartDao = (CartDao) request.getAttribute("cartDao");
%>
<form action="UserServlet?state=shopMSG">
    <table width="80%" border="0" align="center">
        <tr>
            <td align="center">
                <jsp:include flush="true" page="./components/header.jsp"/>
            </td>
        </tr>
        <tr>
            <td align="center">
                <table width="100%" border="1">
                    <tr>
                        <td align="center"><img src="image/shopcart3.png"/></td>
                    </tr>
                    <tr align="center">
                        <td>
                            <table width="60%" border="1">
                                <tr>
                                    <td colspan="2" align="center">购买人信息</td>
                                </tr>
                                <tr>
                                    <td width="50%" align="right">用户名：</td>
                                    <td width="50%">
                                        <input type="text" name="textfield" disabled value="<%=userBean.getUsername() %>"/></td>
                                </tr>
                                <tr>
                                    <td align="right">*真实姓名：</td>
                                    <td><input type="text" name="textfield2" disabled value="<%=userBean.getTruename() %>"/></td>
                                </tr>
                                <tr>
                                    <td align="right">*家庭住址：</td>
                                    <td><input type="text" name="textfield3" disabled value="<%=userBean.getAddress() %>"/></td>
                                </tr>
                                <tr>
                                    <td align="right">*联系电话：</td>
                                    <td><input type="text" name="textfield4" disabled value="<%=userBean.getPhone() %>"/></td>
                                </tr>
                                <tr>
                                    <td align="right">*电子邮件：</td>
                                    <td><input type="text" name="textfield5" disabled value="<%=userBean.getEmail() %>"/></td>
                                </tr>
                                <tr>
                                    <td align="right">*邮编：</td>
                                    <td><input type="text" name="textfield6" disabled value="<%=userBean.getPostcode() %>"/></td>
                                </tr>
                                <tr>
                                    <td align="right"><input type="submit" name="finish" id="button" value="完成订单"/></td>
                                    <td><input type="submit" name="alt" id="button2" value="修改个人信息"/></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table width="60%" border="1">
                                <tr>
                                    <td colspan="4" align="center">我的购物车情况</td>
                                </tr>
                                <tr>
                                    <td width="25%" align="center">编号</td>
                                    <td width="25%" align="center">商品名称</td>
                                    <td width="25%" align="center">单价</td>
                                    <td width="25%" align="center">数量</td>
                                </tr>

                                <%
                                    for (CartBean cb : cartBean) {
                                %>

                                <tr>
                                    <td align="center"><%=cb.getGoodsId() %>
                                    </td>
                                    <td align="center"><%=cb.getGoodsName() %>
                                    </td>
                                    <td align="center"><%=cb.getGoodsPrice() %>
                                    </td>
                                    <td align="center"><%=cb.getNumber() %>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>

                                <tr>
                                    <td colspan="4">您一共选择了价值￥<%=cartDao.getTotalPrice()%>的商品
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <input type="submit" name="returnToCart" id="button3" value="返回修改我的购物车"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="left"><a href="orderFormLogin.jsp">上一步</a></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <jsp:include flush="true" page="./components/tail.jsp"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
