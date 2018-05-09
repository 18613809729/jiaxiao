<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>预约报名</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page">
         <form id="signForm">
            <div class="weui-cells__title">请输入关联信息</div>
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="username">姓名</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="username" type="text" placeholder="请输入姓名" required minlength="2" maxlength_="6" validate="chinese">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="mobile">手机号</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="mobile" type="number" required validate="mobile" placeholder="请输入手机号" maxlength="11">
                    </div>
                </div>
            </div>
            </form>
        <div class="weui-btn-area">
            <a href="javascript:;" class="weui-btn weui-btn_primary" id="submit"><i></i>立即关联</a>
        </div>
        <br>
    </div>
    <#include "/common.ftl">
    <script type="text/javascript">
        $(function(){
            var form = $("#signForm").formValidate({});
            $("#submit").click(function(){
                var _btn = $(this);
                form.validate(function(){
                    var data = $("#signForm").serialize();
                    $.singlePost(_btn, "/student/link", data).done(function(res){
                        if(res.code == '0'){
                            $.toSuccess({
                            "title":"关联成功",
                            "desc":"",
                            "primary_btn_url":"/student/index"
                            })
                        } else {
                            $.toast(res.msg, "cancel");
                        }
                    });
                });
            });
        });
    </script>
</body>
</html>