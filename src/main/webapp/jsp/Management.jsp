<%--
  Created by IntelliJ IDEA.
  User: 潘帅帅
  Date: 2019/8/30
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/bao/yinbao.jsp"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/ztree/css/demo.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">


    <script type="text/javascript" src="${pageContext.request.contextPath }/static/ztree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/ztree/js/jquery.ztree.exedit.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/ztree/js/jquery.ztree.excheck.js"></script>

    <title>Title</title>
    <style type="text/css">
        .ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
    </style>
</head>
<script>
    
    
    function lala(eqmTreeId,level) {
        $("#tab").bootstrapTable({
            url:'${pageContext.request.contextPath}/user/findAll',
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
                    field:'name',
                    title:'名称'
                },{
                    field:'codename',
                    title:'code信息'
                },{
                    field:'userlevel',
                    title:'级别'
                },{
                    title:'操作',
                    formatter :function (value,row,index){
                        return "<input type='button' ONCLICK='tianjia("+level+","+eqmTreeId+")' value='添加' class=\"btn btn-primary\">";
                    }
                }
            ]
        })
    }
    var setting = {
        view:{
            showLine:true,
            showIcon:true,
            /*addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom,*/
            selectedMulti: false
        },
        edit:{
            enable: true,
            showRemoveBtn: true,
            removeTitle: "删除节点",
            showRenameBtn: true,
            renameTitle: "编辑节点"
        },
        data:{
            simpleData: {
                enable: true,
                idKey:"id",
                pIdKey:"pid",
                rootPId:0
            }
        },
        async:{
            enable:true,
            url:"${pageContext.request.contextPath }/address/AllressAll",
            autoParam:["id","name","pid"]
        },
        callback:{
            onClick:zTreeOnClick
        }
    };

    function zTreeOnClick(event,treeId,treeNode){
        var	eqmTreeId=treeNode.id;
        var level=treeNode.level+1;
        $("#tab").bootstrapTable("destroy");
        lala(eqmTreeId,level);

    }


    $(function(){
        $.fn.zTree.init($("#treeDemo"), setting);
    });




    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_"+treeNode.tId).unbind().remove();
    };



    $(function(){
        intZtree();
    })

    function intZtree(){
        $.fn.zTree.init($("#treeDemo"),setting);
    }

    function beforeDrag(){
        return false;  //禁止所有拖拽功能
    }
    
    
    function tianjia(level,eqmTreeId) {
        $("#myModal").modal('show');
         var level=level+1;
         $("#userlevel").val(level);
         $("#address").val(eqmTreeId);
         $("#tianjiayonghu").click(function () {
         $.ajax({
             url:"${pageContext.request.contextPath}/user/addNewUser",
             data:$("#userform").serialize(),
             dataType:"json",
             type:"post",
             success:function (data) {
                 if(data){
                     $("#myModal").modal('show');
                     $("#tab").bootstrapTable('refresh');
        }
             }
         })
         })
    }

</script>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <div class="content_wrap">
                <div class="zTreeDemoBackground left">
                    <ul id="treeDemo" class="ztree"></ul>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <table id="tab">
            </table>
        </div>
    </div>
</div>


<!-- 模态框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">修改来源信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="userform">
                    <input type="hidden" name="userlevel" id="userlevel">
                    <input type="hidden" name="address" id="address">
                    <div class="form-group">
                        <input type="hidden" class="form-control" name="id">
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">用户名称:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="name" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">code描述:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="codename" name="codename">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">密码</label>
                        <div class="col-sm-3">
                            <input type="password" class="form-control" name="password">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" id="tianjiayonghu" class="btn btn-primary" id="image">
                    添加</button>
            </div>
        </div>
    </div>
    <!-- /.modal-content -->
</div>
</body>
</html>