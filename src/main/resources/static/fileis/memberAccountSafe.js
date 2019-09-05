$(function(){
    //设置邮箱页面button的文字
    var email=$("#email").val();
    if(email==null || email==""){
        $("#changeEmailBtn").val("绑定邮箱号");
    }
    //默认显示第一个tab还是第二个tab页
    var type=$("#tabType").val();
    if("email"==type){
        //默认打开第二个tab页
        $('#myTabs li:eq(1) a').tab('show');
    }
    $("#oldMobile").blur(function () {
        var phone=$(this).val();
        if(!(/^1[34578]\d{9}$/.test(phone))){
            setError($(this),"手机号码有误，请重填!");
        }else{
            setOk($(this));
        }
    });
    $("#newMobile").blur(function () {
        var phone=$(this).val();
        if(!(/^1[34578]\d{9}$/.test(phone))){
            setError($(this),"手机号码有误，请重填!");
        }else{
            if(isExistMobile(phone)){
                setError($(this),"该手机号码已被注册！");
            }else{
                setOk($(this));
            }
        }
    });
    $("#oldMobileCode").blur(function () {
        checkMessageCode($(this));
    });
    $("#newMobileCode").blur(function () {
        checkMessageCode($(this));
    });
    $("#password").blur(function () {
        var password=$(this).val();
        var _that=$(this);
        $.ajax({
            type:"post",
            url:"/user/checkPasswordIsRight",
            data:{"password":password},
            dataType:"json",
            error:function(error){
                setError(_that,"密码错误！");
            },success:function(data){
                if(data){
                    setOk(_that);
                }else{
                    setError(_that,"密码错误！");
                }
            }
        });
    });
});
function checkMessageCode(obj) {
    $.ajax({
        type:"post",
        url:"/index/checkMessageCode",
        data:{"messageCode":obj.val()},
        dataType:"json",
        error:function(error){
            setError(obj,"校验失败!");
        },success:function(data){//{flag:true|false,message:}
            if(data){
                setOk(obj);
            }else{
                setError(obj,"校验失败!");
            }
        }
    });
}
//获取旧手机的校验码
function sendOldCode() {
    if(!$("#oldMobile").parents(".form-group").hasClass("has-success")){
        alert("请先输入正确的原手机号码！");
        return;
    }
    var oldMobile=$("#oldMobile").val();
    sendMessageCode(oldMobile);
}
//获取新手机的校验码
function sendNewCode() {
    if(!$("#newMobile").parents(".form-group").hasClass("has-success")){
        alert("请先输入正确的新手机号码！");
        return;
    }
    var newMobile=$("#newMobile").val();
    sendMessageCode(newMobile);
}
function sendMessageCode(mobile){
    $.ajax({
        type:"post",
        url:"/index/dosendMessage",
        data:{"mobile":mobile},
        dataType:"json",
        error:function(error){
            alert("短信发送失败！");
        },success:function(data){
            if(data){
                alert("短信发送成功，请查收！");
            }else{
                alert("短信发送失败！");
            }
        }
    });
}
//如果手机号码已被注册，返回true，否则返回false
function isExistMobile(mobile){
    var flag=false;
    $.ajax({
        type:"post",
        url:"/user/isExistMobile",
        data:{"mobile":mobile},
        dataType:"json",
        async:false,
        error:function(error){
            console.log("手机号码唯一性校验失败！");
        },success:function(data){//{flag:true|false,message:}
            flag=data;
        }
    });
    return flag;
}
//修改手机号码
function sendChangeMobileForm() {
    if(verifyForm()){
        $.ajax({
            type:"post",
            url:"/user/changeCurrentUserMobile",
            data:{"mobile":$("#newMobile").val()},
            dataType:"json",
            error:function(error){
                console.log("修改手机号码失败！");
            },success:function(data){//{flag:true|false,message:}
                if(data){
                    alert("修改成功！");
                    window.location.reload();
                }
            }
        });
    }else{
        alert("页面输入有误，请修改后重新提交！");
    }

}
//修改邮箱
function sendChangeEmailForm(){
    $.ajax({
        type:"post",
        url:"/user/changeCurrentUserEmail",
        data:{"email":$("#email").val()},
        dataType:"json",
        error:function(error){
            console.log("修改邮箱号码失败！");
        },success:function(data){//{flag:true|false,message:}
            if(data){
                alert("修改成功！");
                window.location.reload();
            }
        }
    });
}
function verifyForm() {
    var flag=true;
    $("#registerUser .form-group").each(function(){
        if(!$(this).hasClass("has-success")){
            flag=false;
            return;
        }
    });
    return flag;
}
function setOk(obj){
    var _pdiv=obj.parents(".form-group");
    if(_pdiv.hasClass("has-error")){
        _pdiv.removeClass("has-error");
    }
    _pdiv.addClass("has-success");
    obj.parent("div").nextAll("span.help-block").html("&nbsp;");
}
function setError(obj,str){
    var _pdiv=obj.parents(".form-group");
    if(_pdiv.hasClass("has-success")){
        _pdiv.removeClass("has-success");
    }
    _pdiv.addClass("has-error");
    obj.parent("div").nextAll("span.help-block").html(str);
}