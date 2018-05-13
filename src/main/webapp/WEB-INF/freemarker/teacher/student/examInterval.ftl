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
                        <input class="weui-input align_right" name="interval1" placeholder="" required type="number" min="0" step="1" max="300" value="${interval.interval1}">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="interval20">科目二(手动)</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input align_right" name="interval20" placeholder="" required type="number" min="0" max="300" step="1" value="${interval.interval20}">
                    </div>
                </div>

                 <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="interval21">科目二(自动)</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input align_right" name="interval21" placeholder="" required type="number" min="0" max="300" step="1" value="${interval.interval21}">
                    </div>
                </div>


                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="interval30">科目三(手动)</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input align_right" name="interval30" placeholder="" required type="number" min="0" max="300" step="1" value="${interval.interval30}">
                    </div>
                </div>

                 <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="interval31">科目三(自动)</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input align_right" name="interval31" placeholder="" required type="number" min="0" max="300" step="1" value="${interval.interval31}">
                    </div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="interval4">科目四</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input align_right" name="interval4" placeholder="" required type="number" min="0" max="300" step="1" value="${interval.interval4}">
                    </div>
                </div>
     		</div>
        </form>
        <div class="weui-btn-area">
			<a href="javascript:;" class="weui-btn weui-btn_primary" id="submit"><i></i>确定</a>
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