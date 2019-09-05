<%--
  Created by IntelliJ IDEA.
  User: 潘帅帅
  Date: 2019/8/28
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style type="text/css">
        #loginForm input {
            height: 40px;
            line-height: 100px;
        }/*
        .input-group-addon {
            font-size: 20px;
        }*/
        .login_bg {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 500px;
            background: url(/static/images/header/login-bj.jpg);
            background-size: 100%;
        }
        .w_bg{
            height:475px;
            position:relative;
        }
        .c_car{
            margin: 0 auto;
            width: 990px;
        }
        .d_form{
            width: 400px;
            height: 300px;
            background-color: #fff;
            position: absolute;
            right: 100px;
            top: 90px;
            padding: 10px 80px;
        }
        .forgetpsw {
            color: #035EC9;
            float: left;
            margin-right: 10px;
            font-weight: lighter;
            font-size: 12px;
        }
        .user_regist {
            float: right;
            color: #035EC9;
            margin-right: 15px;
        }
        #loginForm .form-group {
            margin-bottom:0px;
        }
        .qingdenglu {
            color: pink;
            text-align: center;
        }
        .denglu{
            height: 50px;
        }
        .uuuu{
            width: 200px;
        }

        .dibu{
            margin-top: 77px;
            text-align: center;
            color: #0e8cd4;
        }

    </style>
</head>
<body>
<%@include file="/bao/yinbao.jsp"%>
<div class="w_bg">
    <div class="login_bg">
        <%--<div class="c_car"><img src="/static/images/header/QQ图片20190408205853.jpg"></div>v--%>
        <div class="d_form">
            <form class="form-horizontal" id="loginForm">
                <div class="denglu"><h3 class="qingdenglu" style="color: pink">请登录</h3></div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">$</div>
                        <input type="hidden" id="id" name="id">
                        <input type="text" class="uuuu" id="codename" name="codename" value="${codename}" placeholder="邮箱/用户名">
                    </div>
                    <div><span class="help-block">&nbsp;</span></div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">$</div>
                        <input type="password" class="uuuu" id="password" name="password" value="${password}" placeholder="密码">
                    </div>
                </div>

                <input style="height: 10px" name="gouxuan" type="checkbox">记住密码

            </form>
            <span style="display: block;height: 30px;"><a class="forgetpsw" href="/jsp/retrieve.jsp">忘记登录密码?</a><a href="/jsp/register.jsp" class="user_regist">免费注册</a></span>
            <span style="display: block"><input type="button" onclick="sendForm()" class="btn btn-primary" style="width: 100%" value="登&nbsp;&nbsp;陆"></input></span>
        </div>
    </div>
</div>
<h4 class="dibu">CopyRight 2019 太平洋保险河北分公司</h4>
</body>
<script>
    if($("input[name='password']").val()!=""){
            $("input[name='gouxuan']").prop("checked",true);
    }else {
        $("input[name='gouxuan']").prop("checked",false);
    }
    function sendForm() {

        $.ajax({
            url:"${pageContext.request.contextPath}/user/login",
            data:$("#loginForm").serialize(),
            dataType:"json",
            type:"post",
            success:function (data) {
              if(data.flag){
                  location.href = "${pageContext.request.contextPath}/jsp/Statistics.jsp";
              }else {
                  alert("失败!");
              }
            }
        })


    }



</script>
</html>
