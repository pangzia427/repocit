<%--
  Created by IntelliJ IDEA.
  User: 潘帅帅
  Date: 2019/9/1
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>预报数据</title>
    <%@include file="/bao/yinbao.jsp"%>
</head>
<style>
    .form-control{
        width: 260px;
    }
    .panel-heading{
        color: pink;
    }
</style>

<body>
<div class="panel panel-default">
    <div class="panel-heading">
        提交计划
    </div>
    <div class="panel-body">
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <form class="form-horizontal" id="jihua" role="form">
                        <div class="form-group">
                            <input type="hidden" id="id" name=id">
                            <input type="hidden" id="userid" name="userid" value="${user.id}">
                            <label class="col-sm-2 control-label">计划名称:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="planName" name="planName" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">计划召开桌数:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="planNumberTables" name="planNumberTables" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">开始时间:</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" id="startTime" name="startTime" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">结束时间:</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" id="endTime" name="endTime" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="checkbox">
                                    <button type="button" onclick="tianjiajihua()" class="btn btn-default">提交</button>
                                    <button type="submit" class="btn btn-default">取消</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function tianjiajihua() {
        $.ajax({
            url:"${pageContext.request.contextPath}/forecastData/addforecastData",
            data:$("#jihua").serialize(),
            dataType:"json",
            type:"post",
            success:function (data) {
             if(data){
                 alert("cheng");
             }
            }
        })
    }
</script>
</html>