<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>Shopping</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <%--    <link rel="stylesheet" type="text/css" href="css/sidecss.css">--%>
</head>

<body>
<%
    if (request.getAttribute("goods") == null) {
        response.sendRedirect("IndexServlet?state=init");
        return;
    }
%>
<table width="80%" align="center">
    <tr>
        <td height="113" colspan="2" align="center">
            <jsp:include page="components/header.jsp"/>
        </td>
    </tr>
    <tr>
        <td style="width: 244px" align="center">
            <jsp:include page="components/side.jsp"/>
        </td>
        <td align="center">
            <jsp:include page="components/body.jsp"/>
        </td>
    </tr>
    <tr>
        <td height="114" colspan="2" align="center">
            <jsp:include page="components/tail.jsp"/>
        </td>
    </tr>
</table>
</body>
</html>
