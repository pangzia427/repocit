<%--
  Created by IntelliJ IDEA.
  User: 潘帅帅
  Date: 2019/8/29
  Time: 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@include file="/bao/yinbao.jsp"%>
    <script src="/static/js/echarts.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>大太平洋系统</title>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">太平洋保险</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${user.name}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a onclick="tuichu()" href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item"><a href="#">查看数据</a></li>
                <c:if test="${user.userlevel ==1 || user.userlevel ==2}">
                    <li class="layui-nav-item"><a href="javascript:;" ONCLICK="jizhiguanli(this)">机构管理</a></li>
                    <li class="layui-nav-item"><a href="javascript:;" ONCLICK="yonghuguanli(this)">用户管理</a></li>
                </c:if>
                <c:if test="${user.userlevel ==2 || user.userlevel ==3}">
                    <li class="layui-nav-item"><a href="javascript:;" ONCLICK="yubaoshuju(this)">预报数据</a></li>
                    <li class="layui-nav-item"><a href="javascript:;" onclick="shangbaoshuju(this)">上报数据</a></li>
                </c:if>
            </ul>
        </div>
    </div>
    <div class="layui-body">

        <div class="panel panel-default">
            <div class="panel-heading">
                查看数据
            </div>
            <div class="panel-body">

            </div>
        </div>

        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="tabbable" id="tabs-817853">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#panel-709992" data-toggle="tab">统计图</a>
                            </li>
                            <li>
                                <a href="#panel-31777" data-toggle="tab">详细列表信息</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="panel-709992">
                                <!-- 2 设置echarts基板 -->
                                <div id="main" style="height: 800px;width: 1200px;"></div>
                            </div>
                            <div class="tab-pane" id="panel-31777">
                                <p>
                                <div class="panel-body" id="xushangbao">
                                    <div class="col-md-8">
                                        <table id="tab">
                                        </table>
                                    </div>
                                </div>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script>

    $("#tab").bootstrapTable({
        url:'${pageContext.request.contextPath}/forecastData/AllForecastData',
        method:'post',//提交方式
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的编码类型*/
        striped:true,
        pagination:true,//开启分页
        sortable: true,//是否启用排序
        sidePagination:"client",//分页方式 'client'为客户端分页  server后端分页
        sortName:'id',//排序需要的属性
        sortOrder:'asc',//排序方式
        cache:false,//是否使用缓存
        pageList:[2,3,4],
        pageNumber:1,
        pageSize:5,
        columns:[
            {
                title:'序号',//表头名
                formatter :function (value,row,index){
                    return index+1;
                }
            },{
                field:'',
                title:'机构名称'
            },{
                field:'',
                title:'计划召开桌数'
            },{
                field:'',
                title:'实际召开桌数'
            },{
                field:'',
                title:'执行率(%)'
            },{
                field:'',
                title:'新客户'
            },{
                field:'',
                title:'老客户'
            },{
                field:'',
                title:'意向客户'
            },{
                field:'',
                title:'预估保费(万元)'
            }
        ]
    })


    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });

    function tuichu() {
        $.ajax({
            url:"${pageContext.request.contextPath}/user/logout",
            type:"post",
            dataType:"json",
            success:function (data) {
               if(data){
                   location.href="${pageContext.request.contextPath}/jsp/login.jsp";
               }
            }
        })
    }


    function jizhiguanli(obj) {
        layui.use("layer",function () {
            var layer=layui.layer;
            //iframe窗
            layer.open({
                type: 2,
                title: false,
                closeBtn: 0, //不显示关闭按钮
                shade: [0],
                area: ['340px', '215px'],
                offset: 'rb', //右下角弹出
                time: 1000, //1秒后自动关闭
                anim: 2,
                content: ['${pageContext.request.contextPath}/jsp/Institution.jsp', 'no'], //iframe的url，no代表不显示滚动条
                end: function(){ //此处用于演示
                    layer.open({
                        type: 2,
                        title: $(obj).text(),
                        shadeClose: true,
                        shade: false,
                        maxmin: true, //开启最大化最小化按钮
                        area: ['1000px', '600px'],
                        content: '${pageContext.request.contextPath}/jsp/Institution.jsp'
                    });
                }
            });
        })

    }
    function yonghuguanli(obj) {
        layui.use("layer",function () {
            var layer=layui.layer;
            //iframe窗
            layer.open({
                type: 2,
                title: false,
                closeBtn: 0, //不显示关闭按钮
                shade: [0],
                area: ['340px', '215px'],
                offset: 'rb', //右下角弹出
                time: 1000, //1秒后自动关闭
                anim: 2,
                content: ['${pageContext.request.contextPath}/jsp/Management.jsp', 'no'], //iframe的url，no代表不显示滚动条
                end: function(){ //此处用于演示
                    layer.open({
                        type: 2,
                        title: $(obj).text(),
                        shadeClose: true,
                        shade: false,
                        maxmin: true, //开启最大化最小化按钮
                        area: ['1000px', '600px'],
                        content: '${pageContext.request.contextPath}/jsp/Management.jsp'
                    });
                }
            });
        })
    }
    function yubaoshuju(obj) {
        layui.use("layer",function () {
            var layer=layui.layer;
            //iframe窗
            layer.open({
                type: 2,
                title: false,
                closeBtn: 0, //不显示关闭按钮
                shade: [0],
                area: ['340px', '215px'],
                offset: 'rb', //右下角弹出
                time: 1000, //1秒后自动关闭
                anim: 2,
                content: ['${pageContext.request.contextPath}/jsp/ForecastData.jsp', 'no'], //iframe的url，no代表不显示滚动条
                end: function(){ //此处用于演示
                    layer.open({
                        type: 2,
                        title: $(obj).text(),
                        shadeClose: true,
                        shade: false,
                        maxmin: true, //开启最大化最小化按钮
                        area: ['1000px', '600px'],
                        content: '${pageContext.request.contextPath}/jsp/ForecastData.jsp'
                    });
                }
            });
        })

    }
    function shangbaoshuju(obj) {
        layui.use("layer",function () {
            var layer=layui.layer;
            //iframe窗
            layer.open({
                type: 2,
                title: false,
                closeBtn: 0, //不显示关闭按钮
                shade: [0],
                area: ['340px', '215px'],
                offset: 'rb', //右下角弹出
                time: 1000, //1秒后自动关闭
                anim: 2,
                content: ['${pageContext.request.contextPath}/jsp/ReportedData.jsp', 'no'], //iframe的url，no代表不显示滚动条
                end: function(){ //此处用于演示
                    layer.open({
                        type: 2,
                        title: $(obj).text(),
                        shadeClose: true,
                        shade: false,
                        maxmin: true, //开启最大化最小化按钮
                        area: ['1000px', '600px'],
                        content: '${pageContext.request.contextPath}/jsp/ReportedData.jsp'
                    });
                }
            });
        })

    }


    // 3 初始化echarts
    var myChart = echarts.init(document.getElementById('main'));

    // 4 指定图表的配置项和数据
    var option = {
        //标题
        title: {
            //主标题
            text: 'Echarts入门示例',
            //主标题链接
            //link : 'https://www.baidu.com',
            //当前页面打开链接
            //target : 'self',
            //副标题
            subtext : '入门',
            //居中
            left : 'center'
        },
        //x轴
        xAxis: {
            //坐标轴类型, x轴默认值为:category(类目轴), y轴默认值:value(数值轴); 还有:'time'(时间轴),'log' (对数轴)
            type : 'category',
            //轴姓名
            name : '销量',
            //坐标值 类目
            data : ['衬衫','羊毛衫','雪纺衫','裤子','高跟鞋','袜子'],
            //x轴文字倾斜
            axisLabel: {
                interval:0,
                rotate:20
            }

        },
        //y轴
        yAxis : {},
        //提示框组件
        tooltip : {

            //触发类型   默认:item (多用于饼图,散点图) ,'axis'(多用于柱状图,折现图)
            trigger: 'axis',

        },
        //图例
        legend : {
            //关联 series 中的name
            data : ['销量','毛利'],
            //位置 居左 ('right','conter')
            left : "left"

        },
        //系列参数
        series : [{

            //类型为 折线图 ('bar':柱状图;'pie':饼图)
            type : 'line',
            //数据
            data : [15,20,5,18,7,36],
            //系列名称，用于tooltip的显示，legend 的图例筛选
            name : '销量',
            //折线图显示数据
            label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },

        },
            {

                //类型为 折线图 ('bar':柱状图;'pie':饼图)
                type : 'line',
                //数据
                data : [10,21,15,17,14,30],
                //系列名称，用于tooltip的显示，legend 的图例筛选
                name : '毛利'

            }],
        //工具框
        toolbox: {
            //是否显示
            //show: true,
            //工具框朝向  默认为:horizontal(横项)   'vertical'(纵向)
            orient: 'vertical',
            feature: {
                //数据视图 : 是否不可编辑
                dataView: {readOnly: true},
                //动态类型切换               	折线            柱状
                magicType: {type: ['line', 'bar']},
                // 还原, 刷新   show默认true
                restore: {},
                //保存图片  show默认true
                saveAsImage: {}
            }
        }

    }

    // 5 将配置项和数据加载到echarts中
    myChart.setOption(option);


</script>
</body>
</html>
