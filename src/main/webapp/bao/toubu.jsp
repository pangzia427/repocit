<%--
  Created by IntelliJ IDEA.
  User: 潘帅帅
  Date: 2019/8/29
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<link href="/static/BuyerCenter/userinfo.css" type="text/css" rel="stylesheet">
<style>
    .navbar navbar-default{
        color: yellow;
    }
    .haha{
        float: right;
        margin-right: 40px;
    }
    .heihei {
        float: right;
        font-size: 20px;
        margin-top: 7px;
    }
</style>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default" role="navigation">
            <a class="heihei" href="#"><span class="glyphicon glyphicon-log-in"></span> 退出</a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <h4 class="haha">欢迎${user.name}登录</h4>
</nav>