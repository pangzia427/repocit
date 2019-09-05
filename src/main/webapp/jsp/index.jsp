<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>酒会管理系统</title>
    <%@ include file="/common/commonjs.jsp" %>
    <style type="text/css">
        form div label {
            text-align: right;
            width: 70px;
            font-weight: bolder;
        }
        #title{
            display: block;
            height: 40px;
            text-align: center;
            font-size: 25px;
            font-weight: bolder;
            color: rgb(29, 29, 188);
            line-height: 40px;
            margin: 30px;
        }
        #alert{
            color: red;
            margin: 0px 10px;
            font-size: 12px;
            display: block;
        }
    </style>
</head>
<body>
<div >
    <img src="/static/images/title.jpg" width="168" height="63">
</div>
<div style="position:relative">
    <div style="position:absolute; right: 10%; top:10%;width:25%;background-color: white;height:330px;">
        <!-- 登录框开始 -->
        <span id="title">请登录</span>
        <span id="alert">${msg}</span>
        <form id="ff" >
            <div>
                <%--@declare id="usercode"--%><label for="usercode">账户:</label>
                <input class="easyui-validatebox" type="text" id="usercode" name="usercode" data-options="required:true" />
            </div>
            <div>
                <%--@declare id="password"--%><label for="password">密码:</label>
                <input class="easyui-validatebox" type="text" id="password" name="password" data-options="required:true" />
            </div>
            <div style="text-align:center;padding:5px 0">
                <input type="button" style="width: 50px" class="easyui-linkbutton" ONCLICK="denglu()"  value="提交"/>
                <input style="width: 50px" class="easyui-linkbutton" type="submit" value="取消"/>
            </div>

        </form>
        <!-- 登录框结束 -->
    </div>
    <div><img src="/static/images/banner.jpg" height="450"></div>

    <div align="center">CopyRignt 2019 太平洋保险河北分公司</div>
</div>
<script>
    function denglu() {
         alert("aaaaa");
        $.ajax({
            url:"/login",
            data:$("#ff").serialize(),
            dataType:"json",
            type:"post",
            success:function (data) {
                if(data){
                    alert("chenggong");
                    location.href = "/jsps/Statistics.jsp";
                }
            }
        })
    }

</script>
</body>
</html>
