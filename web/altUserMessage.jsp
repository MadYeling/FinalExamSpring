<%@ page import="com.yeling.beans.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/3
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改个人信息</title>
</head>
<body>
<%
    UserBean userBean = (UserBean) request.getAttribute("userBean");
%>
<table width="80%" align="center">
    <tr>
        <td height="113" align="center">
            <jsp:include page="components/header.jsp"/>
        </td>
    </tr>
    <tr>
        <td align="center">
            <form action="UserServlet">
                <table width="60%" border="1">
                    <tr>
                        <td colspan="2" align="center">修改信息</td>
                    </tr>
                    <tr>
                        <td width="50%" align="right">用户名：</td>
                        <td width="50%">
                            <input type="text" name="username" value="<%=userBean.getUsername()%>"/></td>
                    </tr>
                    <tr>
                        <td align="right">*真实姓名：</td>
                        <td><input type="text" name="truename" value="<%=userBean.getTruename()%>"/></td>
                    </tr>
                    <tr>
                        <td align="right">*家庭住址：</td>
                        <td><input type="text" name="address" value="<%=userBean.getAddress()%>"/></td>
                    </tr>
                    <tr>
                        <td align="right">*联系电话：</td>
                        <td><input type="text" name="phone" value="<%=userBean.getPhone()%>"/></td>
                    </tr>
                    <tr>
                        <td align="right">*电子邮件：</td>
                        <td><input type="text" name="email" value="<%=userBean.getEmail()%>"/></td>
                    </tr>
                    <tr>
                        <td align="right">*邮编：</td>
                        <td><input type="text" name="postcode" value="<%=userBean.getPostcode()%>"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" name="altNow" value="完成修改"/></td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td height="114" align="center">
            <jsp:include page="components/tail.jsp"/>
        </td>
    </tr>
</table>
</body>
</html>
