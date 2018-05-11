<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>销售记录</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page" id="container">
		<#if childrenSellers?? && (childrenSellers?size > 0)>
			<div class="weui-cells__title">姓名/手机号/状态</div>
			<div class="weui-cells">
				<#list childrenSellers as child>
				<div class="weui-cell">
					<div class="weui-cell__bd">
						<div class="weui-flex">
							<div class="weui-flex__item">${child.username}</div>
							<div class="weui-flex__item">${child.mobile}</div>
							<div class="weui-flex__item"></div>
						</div>
					</div>
					<div class="weui-cell__ft">
						<#if child.status == 1> <span class="font_green"> 有效 </span><#else> <span class="font_warn">无效</span></#if>
					</div>
				</div>
				
				<#if child.children?? && (child.children?size > 0)>
					<#list child.children as grandSon>
					<div class="weui-cell">
						<div class="weui-cell__bd">
							<div class="weui-flex">
								<div class="weui-flex__item">&nbsp;&nbsp;&nbsp;&nbsp;${grandSon.username}</div>
								<div class="weui-flex__item">${grandSon.mobile}</div>
								<div class="weui-flex__item"></div>
							</div>
						</div>
						<div class="weui-cell__ft">
							<#if grandSon.status == 1> <span class="font_green"> 有效 </span><#else> <span class="font_warn">无效</span></#if>
						</div>
					</div>
					</#list>
				</#if>
		
				</#list>
			</div>
			<br>
		<#else>
			<div class="weui-loadmore weui-loadmore_line">
            	<span class="weui-loadmore__tips globl_bg_color">暂无数据</span>
        	</div>
		</#if>
		<div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" href="javascript:history.back();"><i></i>返回</a>
		</div>
		<br>
	</div>
	<#include "/common.ftl">
</body>
</html>