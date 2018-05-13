
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>申请信息</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page" id="container">
		<div class="weui-cells">
	   		<div class="weui-cell">
				<div class="weui-cell__hd">
					<img src="${info.user.headImg}" width="60px">
				</div>
				<div class="weui-cell__bd">
					<p>&nbsp;&nbsp;${info.username}</p>
					<p class="sub_content">&nbsp;&nbsp;${info.user.nickName}</p>
				</div>
				<div class="weui-cell__ft">
				</div>
			</div>
	   	</div>

	   	<div class="weui-cells">
	   		<div class="weui-cell">
				<div class="weui-cell__bd">
					姓名
				</div>
				<div class="weui-cell__ft">
					${info.username}
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__bd">
					性别
				</div>
				<div class="weui-cell__ft">
					<#if info.user.sex == 1>
						男
					<#elseif info.user.sex == 2>
						女
					<#else>
						未知
					</#if>
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__bd">
					手机号
				</div>
				<div class="weui-cell__ft">
					${info.mobile}
				</div>
			</div>
			
			<div class="weui-cell">
				<div class="weui-cell__bd">
					销售等级
				</div>
				<div class="weui-cell__ft">
					<#if info.level == 1>
						一级
					<#elseif info.user.sex == 2>
						二级
					<#else>
						三级
					</#if>
				</div>
			</div>
			
			<#if parent??>
				<a class="weui-cell weui-cell_access" href="/teacher/seller/info/${parent.id}">
					<div class="weui-cell__bd">
						上级销售
					</div>
					<div class="weui-cell__ft">
						${parent.username}
					</div>
				</a>
			</#if>
			
			<div class="weui-cell">
				<div class="weui-cell__bd">
					地区
				</div>
				<div class="weui-cell__ft">
					${info.user.country}&nbsp;&nbsp;${info.user.province}&nbsp;&nbsp;${info.user.city}
				</div>
			</div>

			<div class="weui-cell">
				<div class="weui-cell__bd">
					报名时间
				</div>
				<div class="weui-cell__ft">
					${createdTime}
				</div>
			</div>
	   	</div>
	
		<#if info.state != 3 && info.state != 4 >
			<div class="weui-btn-area">
				<a href="javascript:;" class="weui-btn weui-btn_primary" id="agreeBtn"><i></i>同意</a>
				<a href="javascript:;" class="weui-btn weui-btn_default" id="rejectBtn"><i></i>拒绝</a>
			</div>
		<#else>
			<div class="weui-btn-area">
				<a href="/teacher/seller/join/list" class="weui-btn weui-btn_primary">返回</a>
			</div>
		</#if>
	   <br>
	</div>
	<#include "/common.ftl">
	<script type="text/javascript">
		$("#agreeBtn").click(function(){
			var _this = $(this);
			$.confirm("确认通过该申请?", function() {
				$.singlePut(_this, "/teacher/seller/join/info/${info.id}", {"state":"3"}).done(function(res){
					if(res.code == "0"){
						location.href = "/teacher/seller/join/list"
					} else {
						$.toast(res.msg, "cancel");
					}
				});
			});
			
		});
		$("#rejectBtn").click(function(){
			var _this = $(this);
			$.confirm("确认拒绝该申请?", function() {
				$.singlePut(_this, "/teacher/seller/join/info/${info.id}", {"state":"4"}).done(function(res){
					if(res.code == "0"){
						location.href = "/teacher/seller/join/list"
					} else {
						$.toast(res.msg, "cancel");
					}
				});
			});
		});
	</script>
</body>
</html>