<%--
  Created by IntelliJ IDEA.
  User: 潘帅帅
  Date: 2019/9/1
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上报数据</title>
    <%@include file="/bao/yinbao.jsp"%>
    <style>
        .aaaa{
            height: 40px;
            width: 50px;
        }
        .btn btn-default{
            width: 40px;
        }
    </style>
    <style type="text/css">

        .item {
            width: 100px;
            height: 100px;
            float: left;
            position: relative;
            margin: 0px;
        }
        .addImg {
            width: 100px;
            height: 100px;
            position: absolute;
            left: 0;
            top: 0;
            z-index: 2;
            cursor: pointer;
        }
        .preview,.preBlock{
            position: absolute;
            display: block;
            width: 100px;
            height: 100px;
            left: 0;
            top: 0;
        }
        .delete {
            width: 30px;
            position: absolute;
            right: -30px;
            top: -15px;
            cursor: pointer;
            display: none;
        }
        .preBlock img {
            display: block;
            width: 100px;
            height: 100px;
        }
        .upload_input{
            display: block;
            width: 0;
            height: 0;
            -webkit-opacity: 0.0;
            /* Netscape and Older than Firefox 0.9 */
            -moz-opacity: 0.0;
            /* Safari 1.x (pre WebKit!) 老式khtml内核的Safari浏览器*/
            -khtml-opacity: 0.0;
            /* IE9 + etc...modern browsers */
            opacity: .0;
            /* IE 4-9 */
            filter:alpha(opacity=0);
            /*This works in IE 8 & 9 too*/
            -ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
            /*IE4-IE9*/
            filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
        }

    </style>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3>所有计划列表</h3>
    </div>
    <div class="panel-body" id="xushangbao">
        <div class="col-md-8">
            <table id="tab">
            </table>
        </div>
    </div>
    <div id="yishangbao">
    <form class="form-horizontal" id="shijihuodong">
        <div class="form-group">
            <label for="planName" class="col-sm-2 control-label">活动名称:</label>
            <div class="col-sm-3">
                <input type="hidden" id="id" name="id">
                <input type="hidden" id="forecastid" name="forecastid">
                <input type="text" class="form-control" id="planName" name="planName">
            </div>
        </div>
        <div class="form-group">
            <label for="actualTableCount" class="col-sm-2 control-label">实际桌数:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="actualTableCount" name="actualTableCount">
            </div>
        </div>
        <div class="form-group">
            <label for="newCustomers" class="col-sm-2 control-label">新客户:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="newCustomers" name="newCustomers">
            </div>
        </div>
        <div class="form-group">
            <label for="oldCustomers" class="col-sm-2 control-label">旧客户:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="oldCustomers" name="oldCustomers">
            </div>
        </div>
        <div class="form-group">
            <label for="intentionalCustomers" class="col-sm-2 control-label">意向客户:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="intentionalCustomers" name="intentionalCustomers">
            </div>
        </div>
        <div class="form-group">
            <label for="premium" class="col-sm-2 control-label">保费:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="premium" name="premium">
            </div>
        </div>
        <div class="form-group">
            <label for="activityTime" class="col-sm-2 control-label">活动时间:</label>
            <div class="col-sm-3">
                <input type="date" class="form-control" id="activityTime" name="activityTime">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" ONCLICK="tijiaoshiji()" class="btn btn-default">提交</button>
            </div>
        </div>
    </form>
    </div>
    <div id="shangchuantupian" class="tupian">
        <div class="form-group">
            <label  class="col-sm-3 control-label"><strong>商品主图：</strong></label>
            <div class="col-sm-3">
                <div class="item">
                    <input name="storeLogoId" type="hidden" value="">
                    <img class="icon addImg" onclick="clickImg(this);" src="/static/ddemo_files/addImg.png">
                    <input name="storeLogo" type="file" class="upload_input" onchange="change(this)">
                    <div class="preBlock">
                        <img id="storeLogo" class="preview" alt=""  name="pic" width="190" height="190" >
                    </div>
                    <img class="delete" onclick="deleteImg(this)" src="/static/ddemo_files/delete.png">
                </div>
            </div>
        </div>
        <div class="form-group" style="margin-left: 230px;">
            <button type="button"  class="btn btn-primary" onclick="submitImg()">
                <i class="fa fa-upload" aria-hidden="true">&nbsp;图片上传</i>
            </button>
            <p>
                <span>此处为你的商品图像，建议尺寸100*100像素。</span>
            </p>
        </div>
    </div>
</div>

</body>
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
                field:'planName',
                title:'计划名称'
            },{
                field:'planNumberTables',
                title:'计划桌数'
            },{
                field:'startTime',
                title:'开始时间'
            },{
                field:'endTime',
                title:'结束时间'
            },{
                field:'entryTime',
                title:'录入时间'
            },{
                title:'操作',
                formatter :function (value,row,index){
                    //return "<button type='button' ONCLICK='shangbaoshuju(&quot"+row.planName+"&quot)' value='上报实际数据' class='aaaa'/>";
                    return "<a href='javascript:shangbaoshuju(&quot"+row.planName+"&quot,"+row.id+")'>上报实际数据</a>"
                }
            }
        ]
    })

    $("#yishangbao").hide();
    $("#shangchuantupian").hide();
    function shangbaoshuju(planName,id) {
        $("#xushangbao").hide();
        $("#yishangbao").show();
        $("#planName").val(planName);
        var id=$("#id").val(id);
        $.ajax({
            url:"${pageContext.request.contextPath}/forecastData/UpForecastData",
            data:{"id":id},
            dataType:"json",
            type:"post",
            success:function (data) {

            }
        })

    }
    
    
    function tijiaoshiji() {
        var id=$("#id").val();
        $("#forecastid").val(id);
        $("#yishangbao").hide();
        $("#xushangbao").hide();
        $("#shangchuantupian").show();
        $.ajax({
            url:"${pageContext.request.contextPath}/reportingData/AddReportingData",
            data:$("#shijihuodong").serialize(),
            dataType:"json",
            type:"post",
            sunccess:function () {

                if(data){

                }

            }
        })
    }



    //图片上传
    //多选框
    $("#goodsClass").change(function () {
        $("#scId").val($("#goodsClass option:selected").val());
    })
    //商铺logo

    //点击
    var clickImg = function(obj){
        $(obj).parent().find('.upload_input').click();
    }
    //删除
    var deleteImg = function(obj){
        $(obj).parent().find('input').val('');
        $(obj).parent().find('img.preview').attr("src","");
        //IE9以下
        $(obj).parent().find('img.preview').css("filter","");
        $(obj).hide();
        $(obj).parent().find('.addImg').show();
    }
    //选择图片
    function change(file) {
        //预览
        var pic = $(file).parent().find(".preview");
        //添加按钮
        var addImg = $(file).parent().find(".addImg");
        //删除按钮
        var deleteImg = $(file).parent().find(".delete");

        var ext=file.value.substring(file.value.lastIndexOf(".")+1).toLowerCase();

        // gif在IE浏览器暂时无法显示
        if(ext!='png'&&ext!='jpg'&&ext!='jpeg'){
            if (ext != '') {
                alert("图片的格式必须为png或者jpg或者jpeg格式！");
            }
            return;
        }
        //判断IE版本
        var isIE = navigator.userAgent.match(/MSIE/)!= null,
            isIE6 = navigator.userAgent.match(/MSIE 6.0/)!= null;
        isIE10 = navigator.userAgent.match(/MSIE 10.0/)!= null;
        if(isIE && !isIE10) {
            file.select();
            var reallocalpath = document.selection.createRange().text;
            // IE6浏览器设置img的src为本地路径可以直接显示图片
            if (isIE6) {
                pic.attr("src",reallocalpath);
            }else{
                // 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现
                pic.css("filter","progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src=\"" + reallocalpath + "\")");
                // 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
                pic.attr('src','data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==');
            }
            addImg.hide();
            deleteImg.show();
        }else {
            html5Reader(file,pic,addImg,deleteImg);
        }
    }
    //H5渲染
    function html5Reader(file,pic,addImg,deleteImg){
        var file = file.files[0];
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function(e){
            pic.attr("src",this.result);
        }
        addImg.hide();
        deleteImg.show();
    }

    /* 使用二进制方式处理dataUrl */
    function processData(dataUrl) {
        var binaryString = window.atob(dataUrl.split(',')[1]);
        var arrayBuffer = new ArrayBuffer(binaryString.length);
        var intArray = new Uint8Array(arrayBuffer);
        for (var i = 0, j = binaryString.length; i < j; i++) {
            intArray[i] = binaryString.charCodeAt(i);
        }

        var data = [intArray],
            blob;

        try {
            blob = new Blob(data);
        } catch (e) {
            window.BlobBuilder = window.BlobBuilder ||
                window.WebKitBlobBuilder ||
                window.MozBlobBuilder ||
                window.MSBlobBuilder;
            if (e.name === 'TypeError' && window.BlobBuilder) {
                var builder = new BlobBuilder();
                builder.append(arrayBuffer);
                blob = builder.getBlob(imgType); // imgType为上传文件类型，即 file.type
            } else {
                console.log('版本过低，不支持上传图片');
            }
        }
        return blob;
    }
    function submitImg(){
        //1.获取图片的数据
        var dataUrl=$("#storeLogo").attr("src");
        //2.把二进制的图片数据转为Blob对象
        var blob = processData(dataUrl);
        var formData = new FormData();
        var storeLogoId=$("input[name=storeLogoId]").val()
        formData.append('storeLogoImg', blob);
        formData.append('storeLogoId', storeLogoId);

        $.ajax({
            url:"${pageContext.request.contextPath}/pictureSheet/shangpintupian",
            method: "post",
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                if(data.status){
                    alert("上传成功");
                    //location.reload();
                    $("input[name=storeLogoId]").val(data.id)
                }else{
                    alert("上传失败");
                }
            }
        });
    }

</script>
</html>
