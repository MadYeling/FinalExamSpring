<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<style>
    .foot {
        width: 100%;
        border: 0;
        text-align: center;
        font-size: 12px;
    }

    .top1 {
        background-color: #ff99ff;
    }
</style>

<table class="foot">
    <tr>
        <td class="top1">合作伙伴：<a href="#">新浪</a> <a href="#">搜狐</a> <a href="#">网易</a> <a href="#">百度</a>
        </td>
    </tr>
    <tr>
        <td align="center">地址：北京市崇文区 客户服务热线：010-00000000</td>
    </tr>
    <tr>
        <td align="center">邮编：100000 客服邮箱：shawn@sian.com</td>
    </tr>
    <tr>
        <td align="center">Copyright 时尚购物网™</td>
    </tr>
</table>
