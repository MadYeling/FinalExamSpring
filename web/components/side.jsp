<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<link rel="stylesheet" type="text/css" href="../css/sidecss.css">
<table width="100%" border="0">
    <tr>
        <td><img src="../image/news.PNG" width="240" height="90"/></td>
    </tr>
    <tr>
        <td height="240">
            <div class="container" id="container">
                <div class="inner">
                    <ul>
                        <li><a href="#"><img src="../image/p01.jpg" alt=""></a></li>
                        <li><a href="#"><img src="../image/p02.jpg" alt=""></a></li>
                        <li><a href="#"><img src="../image/p03.jpg" alt=""></a></li>
                        <li><a href="#"><img src="../image/p04.jpg" alt=""></a></li>
                        <li><a href="#"><img src="../image/p05.jpg" alt=""></a></li>
                        <li><a href="#"><img src="../image/p06.jpg" alt=""></a></li>
                    </ul>
                    <ol class="bar" id="bar">

                    </ol>
                </div>
            </div>
        </td>
    </tr>
</table>
<div style="background-color: #ff99ff; height: 21px; width: 98%;margin: 2px 0 2px 0;"></div>
<table width="100%" border="0">
    <tr>
        <td><img src="../image/messages.PNG" width="240" height="90"/></td>
    </tr>
    <tr>
        <td>
            <table width="240" border="0" style="text-align: center; font-size: 12px;">
                <tr bgcolor="#006400">
                    <td>排行</td>
                    <td>商品名称</td>
                    <td>点击次数</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td><a href="#">笑傲江湖</a></td>
                    <td>120</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td><a href="#">笑傲江湖</a></td>
                    <td>120</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td><a href="#">笑傲江湖</a></td>
                    <td>120</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td><a href="#">笑傲江湖</a></td>
                    <td>120</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td><a href="#">笑傲江湖</a></td>
                    <td>120</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td><a href="#">笑傲江湖</a></td>
                    <td>120</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td><a href="#">笑傲江湖</a></td>
                    <td>120</td>
                </tr>
                <tr>
                    <td>8</td>
                    <td><a href="#">笑傲江湖</a></td>
                    <td>120</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<script type="text/javascript" src="../js/sideLB.js"></script>