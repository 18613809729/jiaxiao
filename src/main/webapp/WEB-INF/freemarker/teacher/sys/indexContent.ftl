<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>系统管理</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page">
		<div class="weui-cells weui-cells_form">
	        <a class="weui-cell weui-cell_access" href="/teacher/sys/content/example">
	            <div class="weui-cell__bd font_warn">
	                <p>查看示例</p>
	            </div>
	            <div class="weui-cell__ft">
	            </div>
	        </a>
        </div>

		<form id="form">
			<div class="weui-cells__title">团队简介</div>
			<div class="weui-cells weui-cells_form">
	            <div class="weui-cell">
	                <div class="weui-cell__bd">
	                    <textarea class="weui-textarea" placeholder="请输入文本" rows="6" name="sytdjj" >${sytdjj}</textarea>
	                    <div class="weui-textarea-counter"><span>0</span>/999</div>
	                </div>
	            </div>
	        </div>

	        <div class="weui-cells__title">招生特色</div>
			<div class="weui-cells weui-cells_form">
	            <div class="weui-cell">
	                <div class="weui-cell__bd">
	                    <textarea class="weui-textarea" placeholder="请输入文本" rows="6" name="syzsts">${syzsts}</textarea>
	                    <div class="weui-textarea-counter"><span>0</span>/999</div>
	                </div>
	            </div>
	        </div>

	         <div class="weui-cells__title">管理方式</div>
			<div class="weui-cells weui-cells_form">
	            <div class="weui-cell">
	                <div class="weui-cell__bd">
	                    <textarea class="weui-textarea" placeholder="请输入文本" rows="6" name="syglfs">${syglfs}</textarea>
	                    <div class="weui-textarea-counter"><span>0</span>/999</div>
	                </div>
	            </div>
	        </div>
				
			<div class="weui-cells__title">联系方式</div>
			<div class="weui-cells weui-cells_form">
	            <div class="weui-cell">
	                <div class="weui-cell__bd">
	                    <textarea class="weui-textarea" placeholder="请输入文本" rows="3" name="sylxfs">${sylxfs}</textarea>
	                    <div class="weui-textarea-counter"><span>0</span>/999</div>
	                </div>
	            </div>
	        </div>
        </form>
        
         <div class="weui-btn-area">
			<a href="javascript:;" class="weui-btn weui-btn_primary" id="submit">确定</a>
		</div>
		<br>
	</div>
	<#include "/common.ftl">
	<script type="text/javascript">
		$(function(){
			$("textarea").on('input propertychange', function(){
				$(this).parent().find(".weui-textarea-counter").find("span").text(this.value.length);
			});
            $("#submit").click(function(){
            	var _btn = $(this);
            	var data = $("#form").serialize();
        		$.singlePost(_btn, "/teacher/sys/content", data).done(function(res){
                    if(res.code == '0'){
                      location.href = "/m/index";
                    } else {
                        $.toast(res.msg, "cancel");
                    }
                });
            });
		});

	</script>
</body>
</html>