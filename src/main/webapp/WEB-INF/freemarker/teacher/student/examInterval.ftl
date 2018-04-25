<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>考试间隔</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page">
        <form id="signForm">
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="interval1">科目一</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="interval1" placeholder="科目一间隔" required type="number" min="0" step="1" max="99" value="${interval.interval1}">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="interval2">科目二</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="interval2" placeholder="科目二间隔" required type="number" min="0" max="99" step="1" value="${interval.interval2}">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="interval3">科目三</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="interval3" placeholder="科目三间隔" required type="number" min="0" max="99" step="1" value="${interval.interval3}">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="interval4">科目四</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="interval4" placeholder="科目四间隔" required type="number" min="0" max="99" step="1" value="${interval.interval4}">
                    </div>
                </div>
     		</div>
        </form>
        <div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" id="submit"><i></i>确定</a>
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
                    $.singlePut(_btn, "/teacher/student/exam/interval", data).done(function(res){
                        if(res.code == '0'){
                            $.toSuccess({
                                "title":"考试间隔设置成功",
                                "primary_btn_msg":"确定",
                                "primary_btn_url":"/teacher/student/index"
                            });
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