
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
					<img src="${info.user.headImg!"https://static.xxwkj.club/jiaxiao/image/default_head_img.jpg"}" width="60px">
				</div>
				<div class="weui-cell__bd">
					<p>&nbsp;&nbsp;${info.username}</p>
					<#if info.user??>
						<p class="sub_content">&nbsp;&nbsp;${info.user.nickName}</p>
					</#if>
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
			
			<#if seller??>
				<a class="weui-cell weui-cell_access" href="/teacher/seller/info/${seller.id}">
					<div class="weui-cell__bd">
						销售员
					</div>
					<div class="weui-cell__ft">
						${seller.username}
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
	</div>
	<#include "/common.ftl">
</body>
</html>