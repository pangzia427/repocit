<%--
  Created by IntelliJ IDEA.
  User: 潘帅帅
  Date: 2019/8/29
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .caiduankuang{
        text-align: center;
    }
</style>
<script>
    $(function () {
        $("div.n_tit").click(function () {
            $("#member_menu ul").each(function(){
                $(this).hide();
            });
            $(this).next("ul").show();
        });
    });
</script>
<div class="col-sm-3">
    <div class="m_nav">
        <div class="ncm_l_top">
            <h4 class="caiduankuang">菜单框</h4>
        </div>
        <!-- 列表菜单-->
        <div class="mv_mt" id="chakan">
            <div class="n_tit n_tit2">
                <span></span>查看数据
            </div>
        </div>
        <div class="mv_mt" id="jigou">
            <div class="n_tit n_tit2">
                <span></span>机构管理
            </div>
        </div>
        <div class="mv_mt" id="yonghu">
            <div class="n_tit n_tit2">
                <span></span>用户管理
            </div>
        </div>
        <div class="mv_mt" id="yubao">
            <div class="n_tit n_tit2">
                <span></span>预报数据
            </div>
        </div>
        <div class="mv_mt" id="shangbao">
            <div class="n_tit n_tit2">
                <span></span>上报数据
            </div>
        </div>
    </div>
</div>
