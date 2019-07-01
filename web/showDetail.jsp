<%@ page import="com.yeling.beans.GoodsBean" %><%--
  Created by IntelliJ IDEA.
  User: ycc36
  Date: 2019/5/15
  Time: 15:52
  Nothing is true, everything is permitted.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    GoodsBean goodsBean = (GoodsBean) request.getAttribute("goods");
    if (goodsBean == null) {
        out.print("<h1>无效的请求！</h1>");
        return;
    }
    session.setAttribute("cartGoodsId", goodsBean.getGoodsId());
%>
<html>
<head>
    <title>详细</title>
    <style>
        * {
            padding: 0;
        }
    </style>
</head>
<body>
<table width="80%" border="0" align="center">
    <tr>
        <td align="center">
            <jsp:include page="components/header.jsp"/>
        </td>
    </tr>
    <tr>
        <td height="358" align="center">
            <table width="100%" border="1">
                <tr>
                    <td colspan="2" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="25%" rowspan="8" align="center">
                        <img src="<%=goodsBean.getPhoto()%>" width="240" height="240"/>
                    </td>
                    <td width="75%" align="center"><%=goodsBean.getGoodsName()%>
                    </td>
                </tr>
                <tr>
                    <td>价格：￥<%=goodsBean.getGoodsPrice()%>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>ISBN：<%=goodsBean.getGoodsId()%>
                    </td>
                </tr>
                <tr>
                    <td>类型：<%=goodsBean.getGoodstype()%>
                    </td>
                </tr>
                <tr>
                    <td>出版商：<%=goodsBean.getPublisher()%>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td height="122" valign="top">
                        <%=goodsBean.getGoodsIntro()%>
                    </td>
                </tr>
                <tr>
                    <td height="21" colspan="2" align="left">
                        <form method="post" action="IndexServlet" style="margin-top: 14px;text-align: center">
                            <input type="submit" name="buy" value="购买"/>
                            <input type="submit" name="back" value="返回购物大厅"/>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td height="21" colspan="2" align="center">&nbsp;</td>
                </tr>
            </table>
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
