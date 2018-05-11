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
		<#if feeList?? && (feeList?size > 0)>
			<div class="weui-cells__title">学员姓名/手机号/时间</div>
			<div class="weui-cells">
				<#list feeList as feeInfo>
				<div class="weui-cell">
					<div class="weui-cell__bd">
						<div class="weui-flex">
							<div class="weui-flex__item">${feeInfo.studentName}</div>
							<div class="weui-flex__item">${feeInfo.studentMobile}</div>
							<div class="weui-flex__item"></div>
						</div>
						
					</div>
					<div class="weui-cell__ft">
						${feeInfo.createdTime?date('yyyy-MM-dd')}
					</div>
				</div>
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