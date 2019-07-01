<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<style>
    * {
        padding: 0;
    }

    .my {
        font-size: 16px;
    }

    .fo {
        width: 11%;
        text-align: center;
        background-color: rgba(0, 153, 0, 0.4);
    }
</style>

<table width="100%" height="116" border="0" align="center">
    <tr>
        <td height="5" colspan="3" bgcolor="#FF99FF"></td>
    </tr>
    <tr>
        <td width="11%" height="92" rowspan="2">
            <img src="../image/title.PNG" width="145" height="76"/>
        </td>
        <td width="72%" rowspan="2" align="center">
            <img src="../image/sale.PNG" width="495" height="83"/>
        </td>
        <td width="17%" height="43">
            <img src="../image/dq.PNG" width="20" height="20"/>
            <a href="UserServlet?state=myAccount" class="my">【我的账号】</a>
        </td>
    </tr>
    <tr>
        <td height="24">
            <img src="../image/gwc.PNG" width="20" height="20"/>
            <a href="ShoppingCartServlet?state=init" class="my">【我的购物车】</a>
        </td>
    </tr>
    <tr>
        <td height="5" colspan="3" bgcolor="#FF99FF"></td>
    </tr>
    <tr>
        <td height="15" colspan="3">
            <table width="100%" border="0">
                <tr>
                    <td width="11%" align="center">

                    </td>
                    <td class="fo">
                        <strong><a href="../index.jsp">首页</a></strong>
                    </td>
                    <td width="11%" align="center">

                    </td>
                    <td class="fo">
                        <strong><a href="#">香港电影</a></strong>
                    </td>
                    <td width="11%" align="center">

                    </td>
                    <td class="fo">
                        <strong><a href="#">大陆电影</a></strong>
                    </td>
                    <td width="11%" align="center">

                    </td>
                    <td class="fo">
                        <strong><a href="#">关于我们</a></strong>
                    </td>
                    <td width="11%" align="center">

                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
