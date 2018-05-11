<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>佣金历史</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page" id="container">
		<#if payFeeLst?? && (payFeeLst?size > 0)>
			<div class="weui-cells">
			<#list payFeeLst as fee>
   				<a class="weui-cell weui-cell_access" href="/seller/pay/fee/detail/${fee.payId}">
					<div class="weui-cell__bd">
						${fee.payTime?date("yyyy-MM-dd")}
					</div>
					<div class="weui-cell__ft">
						<p>${fee.totalMoney}元</p>
					</div>
				</a>
			</#list>
			</div>
		<#else>
			<div class="weui-loadmore weui-loadmore_line">
            	<span class="weui-loadmore__tips globl_bg_color">暂无数据</span>
        	</div>
		</#if>

		<div class="weui-btn-area">
			<a href="javascript:history.back();" class="weui-btn weui-btn_primary" id="submit"><i></i>返回</a>
		</div>
		<br>
	</div>
	<#include "/common.ftl">
</body>
</html>