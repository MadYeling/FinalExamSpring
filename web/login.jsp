<%--
  Created by IntelliJ IDEA.
  User: ycc36
  Date: 2019/6/3
  Time: 16:41
  Nothing is true, everything is permitted.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<table width="80%" border="0" align="center">
    <tr align="center">
        <td>
            <jsp:include flush="true" page="./components/header.jsp"/>
        </td>
    </tr>
    <tr align="center">
        <td>
            <form action="UserServlet" method="post">
                <table width="100%" border="1">
                    <tr>
                        <td align="center">
                            <table width="40%" border="1">
                                <tr align="center">
                                    <td colspan="2"><img src="image/login.PNG"/></td>
                                </tr>
                                <tr>
                                    <td width="43%" align="right">用户名：</td>
                                    <td width="57%" align="left"><label for="textfield"></label>
                                        <input name="username" type="text" id="textfield" size="15"/></td>
                                </tr>
                                <tr>
                                    <td align="right">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                                    <td align="left"><label for="textfield2"></label>
                                        <input name="passwd" type="password" id="textfield2" size="15"/></td>
                                </tr>
                                <tr>
                                    <td align="right"><input type="submit" name="loginFromOut" id="login" value="用户登录"/></td>
                                    <td align="left"><input type="submit" name="reg" id="register" value="用户注册"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr align="center">
        <td>
            <jsp:include flush="true" page="./components/tail.jsp"/>
        </td>
    </tr>
</table>
</body>
</html>
