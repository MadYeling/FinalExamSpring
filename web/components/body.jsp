<%@ page import="java.util.List" %>
<%@ page import="com.yeling.beans.GoodsBean" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/15
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .dy {
        height: 244px;
    }

    .message {
        height: 100px;
    }

    .ma {
        color: black;
    }

    #thisPage {
        color: coral;
    }
</style>

<%
    List<GoodsBean> list = (List<GoodsBean>) request.getAttribute("goods");
    int count = (int) request.getAttribute("count");
    int pageNow = (int) request.getAttribute("page");
%>

<table width="100%" border="0" style="margin-top: 7px">
    <tr>
        <td colspan="3" align="center" style="background-color: rgba(255,195,47,0.2)">
            <img src="../image/sptj.PNG" width="616" height="90" align="middle"/>
        </td>
    </tr>
    <tr class="dy">
        <%
            for (int i = 0; i < 6; i++) {
                // 3个换行
                if (i == 3) {
        %>
    </tr>
    <tr>
        <td colspan="3" align="center" bgcolor="#FF99FF">&nbsp;</td>
    </tr>
    <tr class="dy">
        <%
            }

            if (i >= list.size()) {
        %>
        <td width="33%" align="center">
            <table width="100%" border="0" class="dy">
                <tr>
                    <td width="27%" rowspan="3">
                        <img src="../image/nomore.jpg" width="113" height="114"/>
                    </td>
                    <td width="73%" height="34"></td>
                </tr>
                <tr>
                    <td height="42">
                        没有更多电影了
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="message">
                        无更多电影
                    </td>
                </tr>
            </table>
        </td>
        <%
        } else {
        %>
        <td width="33%" align="center">
            <table width="100%" border="0" class="dy">
                <tr>
                    <td width="27%" rowspan="3">
                        <img src="../<%=list.get(i).getPhoto()%>" width="113" height="114"/>
                    </td>
                    <td width="73%" height="34"></td>
                </tr>
                <tr>
                    <td height="42">
                        <a href="IndexServlet?id=<%=list.get(i).getGoodsId()%>"><%=list.get(i).getGoodsName()%>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>价格：￥<%=list.get(i).getGoodsPrice()%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="message">
                        <%=list.get(i).getGoodsIntro()%>
                    </td>
                </tr>
            </table>
        </td>
        <%
                }
            }
        %>
    </tr>
    <tr>
        <td colspan="3" align="center">
            <%
                if (pageNow > 1) {
            %>
            <a href="IndexServlet?state=next&page=<%=pageNow - 1%>" class="ma">上一页</a>
            <%
                }

                String cla;
                for (int i = 0; i < count; i++) {
                    cla = (i + 1 == pageNow) ? "thisPage" : "";
            %>
            <a href="IndexServlet?state=next&page=<%=(i + 1)%>" id="<%=cla%>" class="ma">[<%=(i + 1)%>]</a>
            <%
                }

                if (pageNow < count) {
            %>
            <a href="IndexServlet?state=next&page=<%=pageNow + 1%>" class="ma">下一页</a>
            <%
                }
            %>
        </td>
    </tr>
</table>
