
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>销售信息</title>
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
		
		<div class="weui-cells__title">基本信息</div>
	   	<div class="weui-cells">
	   		<a href="javascript:;" class="weui-cell weui-cell_access" id="username">
				<div class="weui-cell__bd">
					姓名
				</div>
				<div class="weui-cell__ft">
					${info.username}
				</div>
			</a>
				
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
						
					</#if>
				</div>
			</div>
			
			<a href="javascript:;" class="weui-cell weui-cell_access" id="mobile">
				<div class="weui-cell__bd">
					手机号
				</div>
				<div class="weui-cell__ft">
					${info.mobile}
				</div>
			</a>
			
			<div class="weui-cell">
				<div class="weui-cell__bd">
					地区
				</div>
				<div class="weui-cell__ft">
					${info.user.country}&nbsp;&nbsp;${info.user.province}&nbsp;&nbsp;${info.user.city}
				</div>
			</div>
		</div>
		<div class="weui-cells__title">其他信息</div>
	   	<div class="weui-cells">
	   		
	   		<a href="javascript:;" class="weui-cell weui-cell_access" id="status">
				<div class="weui-cell__bd">
					状态
				</div>
				<div class="weui-cell__ft">
					<#if info.status == "1">
						有效
					<#else>
						无效
					</#if>
				</div>
			</a>

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
					加入时间
				</div>
				<div class="weui-cell__ft">
					${createdTime}
				</div>
			</div>
			
			<div class="weui-cell">
				<div class="weui-cell__bd">
					来源
				</div>
				<div class="weui-cell__ft">
					<#if info.status == "1">
						申请
					<#else>
						录入
					</#if>
				</div>
			</div>
			<a href="/teacher/seller/info/history/fee/paied/${info.id}" class="weui-cell weui-cell_link weui-cell_access">
                <div class="weui-cell__bd">佣金历史</div>
                <div class="weui-cell__ft"></div>
            </a>
            <a href="/teacher/seller/info/history/fee/${info.id}" class="weui-cell weui-cell_link weui-cell_access">
                <div class="weui-cell__bd">佣金记录</div>
                <div class="weui-cell__ft"></div>
            </a>
            <a href="/teacher/seller/info/history/order/${info.id}" class="weui-cell weui-cell_link weui-cell_access">
                <div class="weui-cell__bd">销售历史</div>
                <div class="weui-cell__ft"></div>
            </a>
	   	</div>

	   	<br>
	</div>
	<#include "/common.ftl">
</body>
</html>