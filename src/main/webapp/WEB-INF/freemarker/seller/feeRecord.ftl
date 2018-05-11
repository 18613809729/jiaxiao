<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>佣金记录</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page" id="container">
		<#if feeList?? && (feeList?size > 0)>
			<div class="weui-cells__title">学员姓名/推荐人/佣金金额/状态</div>
			<div class="weui-cells">
				<#list feeList as feeInfo>
				<div class="weui-cell">
					<div class="weui-cell__bd">
						<div class="weui-flex">
							<div class="weui-flex__item">${feeInfo.studentName}</div>
							<div class="weui-flex__item">${feeInfo.topSellerUsername}</div>
							<div class="weui-flex__item">${feeInfo.money}</div>
							<div class="weui-flex__item"><#if feeInfo.status == "0"> <span class="font_warn">未付</span>  <#else> <span class="font_green">已付</span> </#if></div>
						</div>
					</div>
					<div class="weui-cell__ft">
					</div>
				</div>
				</#list>
				<a href="javascript:;" id="loadMore" class="weui-cell weui-cell_link">
					<div class="weui-cell__bd">
					</div>
	               	<div class="weui-cell__ft">佣金总额：${feeSum}</div>
	            </a>
	            <a href="javascript:;" id="loadMore" class="weui-cell weui-cell_link">
					<div class="weui-cell__bd">
					</div>
	               	<div class="weui-cell__ft">已付金额：${paySum}</div>
	            </a>
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