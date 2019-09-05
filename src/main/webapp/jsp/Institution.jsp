<%--
  Created by IntelliJ IDEA.
  User: 潘帅帅
  Date: 2019/8/29
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/bao/yinbao.jsp"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/ztree/css/demo.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">

    <script src="${pageContext.request.contextPath}/static/ddemo_files/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/fileis/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/ztree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/ztree/js/jquery.ztree.exedit.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/ztree/js/jquery.ztree.excheck.js"></script>

    <title>Title</title>
    <style type="text/css">
        .ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
    </style>
    <script>
        var setting = {
            view:{
                showLine:true,
                showIcon:true,
                addHoverDom: addHoverDom,
                removeHoverDom: removeHoverDom,
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
                beforeRemove: zTreeBeforeRemove,
                onRename: onRename
            }
        };


        $(function(){
            $.fn.zTree.init($("#treeDemo"), setting);
        });

        function addHoverDom(treeId, treeNode) {
            var sObj = $("#" + treeNode.tId + "_span");
            if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='add node' onfocus='this.blur();'></span>";

            sObj.after(addStr);

            var btn = $("#addBtn_"+treeNode.tId);
            if (btn) btn.bind("click", function(){
                addNodes(treeId,treeNode);

            });
        };

        function addNodes(treeId,treeNode) {
            $("#myModal").modal();
            $("#pid").val(treeNode.id);
            $("#level").val(treeNode.level+2);
            alert(treeNode.level);
            $("#treeNodeName").val(treeNode.name);
            $("#image").click(function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/address/AddAddress",
                    data:$("#importImg").serialize(),
                    dataType:"json",
                    type:"post",
                    success:function (data) {
                        if(data){
                            alert("添加成功");
                            $("#myModal").modal('hide');
                            intZtree();
                        }else {
                            alert("添加失败");
                        }
                    }
                });
            });
        }


        function zTreeBeforeRemove(treeId,treeNode,str){

            //此处streeNode 当前节点
            str =getAllChildrenNodes(treeNode,str);

            //加上被选择节点自己
            str =str+','+treeNode.id;

            //去掉最前面逗号
            var ids =str.substring(1,str.length);

            //得到所有节点id 的数组
            var idsArray =ids.split(',');
            var idsArray1=idsArray[1];
            if(treeNode.pId==0){
                alert("根节点不能删除");
                return false;
            }else{
                deleteNodeById(idsArray1);
            }
        }


        function getAllChildrenNodes(treeNode,result){
            if(treeNode.isParent){//判断是否父节点
                var childrenNodes=treeNode.children;
                if(childrenNodes){
                    for(var i=0;i<childrenNodes.length;i++){
                        result +=','+childrenNodes[i].id;
                        result  =getAllChildrenNodes(childrenNodes[i],result);
                    }
                }
            }
            return result;
        }


        function deleteNodeById(idsArray1) {
            alert(idsArray1);
            $.ajax({
                url:'${pageContext.request.contextPath}/address/delete',
                type:'post',
                data:{"id":idsArray1},
                dataType:'json',
                success:function(data){
                    if(data){
                        alert("删除成功！");
                        intZtree();
                    }else{
                        alert("删除失败！");
                    }
                },error:function(){
                    alert("后台出错！");
                }
            });
        }
        
        function onRename(event, treeId, treeNode, isCancel) {
            //获取 id 为 treeDemo 的 zTree 对象,存到zRree变量中
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            //获取全部节点 ,存到onodes变量中
            var onodes = zTree.getNodes()
            console.log(onodes);
            var data ={
                "id":treeNode.id,
                "name":treeNode.name,
            };
            $.ajax({
                url:"${pageContext.request.contextPath}/address/upaddress",
                data:data,
                dataType:"json",
                success:function (data) {
                    if(data){
                       alert("成功!!!");
                    }else {
                       alert("失败!!!");
                    }
                }


            })
        }

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

    </script>
</head>
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
                <h4 class="modal-title" id="myModalLabel">添加节点信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="importImg">
                    <input type="hidden" name="pid" id="pid">
                    <input type="hidden" name="level" id="level">
                    <div class="form-group">
                        <input type="hidden" class="form-control" name="id">
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">父节点</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="treeNodeName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">名称</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="name">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="image">
                    添加</button>
            </div>
        </div>
    </div>
    <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</body>
<script>



</script>
</html>
