<%--
  Created by IntelliJ IDEA.
  User: ycc36
  Date: 2019/6/3
  Time: 16:27
  Nothing is true, everything is permitted.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
</head>
<body>
<form action="UserServlet">
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
                            <td colspan="2" align="center">用户注册</td>
                        </tr>
                        <tr>
                            <td width="50%" align="right">用户名：</td>
                            <td width="50%">
                                <input type="text" name="username" value=""/></td>
                        </tr>
                        <tr>
                            <td width="50%" align="right">密码：</td>
                            <td><input type="password" name="passwd" value=""/></td>
                        </tr>
                        <tr>
                            <td align="right">*真实姓名：</td>
                            <td><input type="text" name="truename" value=""/></td>
                        </tr>
                        <tr>
                            <td align="right">*家庭住址：</td>
                            <td><input type="text" name="address" value=""/></td>
                        </tr>
                        <tr>
                            <td align="right">*联系电话：</td>
                            <td><input type="text" name="phone" value=""/></td>
                        </tr>
                        <tr>
                            <td align="right">*电子邮件：</td>
                            <td><input type="text" name="email" value=""/></td>
                        </tr>
                        <tr>
                            <td align="right">*邮编：</td>
                            <td><input type="text" name="postcode" value=""/></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"><input type="submit" name="register" value="注    册"/></td>
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
</form>
</body>
</html>
