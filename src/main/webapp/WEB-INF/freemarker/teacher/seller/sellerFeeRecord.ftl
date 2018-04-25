<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>佣金记录</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="https://static.xxwkj.club/jiaxiao/css/main.css">
</head>
<body ontouchstart>
	<div class="page" id="container">
		<div class="weui-cells">
			<a class="weui-cell" href="/teacher/seller/info/${info.id}">
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
			</a>
		</div>
		<form id="form">
			<div class="weui-cells__title">学员姓名/直销人员/佣金金额/状态</div>
			<div class="weui-cells">
				<#list feeList as feeInfo>
				<a class="weui-cell weui-cell_access" href="/teacher/student/info/${feeInfo.studentId}">
					<div class="weui-cell__bd">
						<div class="weui-flex">
							<div class="weui-flex__item">${feeInfo.studentName}</div>
							<div class="weui-flex__item">${feeInfo.topSellerUsername}</div>
							<div class="weui-flex__item">${feeInfo.money}</div>
							<div class="weui-flex__item"><#if feeInfo.status == "0"> 未付 <#else> 已付 </#if></div>
						</div>
					</div>
					<div class="weui-cell__ft">
					</div>
				</a>
				</#list>
				<a href="javascript:void(0);" id="loadMore" class="weui-cell weui-cell_link">
					<div class="weui-cell__bd">
					</div>
	               	<div class="weui-cell__ft">佣金总额：${feeSum}</div>
	            </a>
	            <a href="javascript:void(0);" id="loadMore" class="weui-cell weui-cell_link">
					<div class="weui-cell__bd">
					</div>
	               	<div class="weui-cell__ft">已付金额：${paySum}</div>
	            </a>
			</div>
		</form>
		<br>
		<div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" href="javascript:history.back();"><i></i>确定</a>
			<#if needPay> <a class="weui-btn weui-btn_default" href="/teacher/seller/fee/settle/${info.id}"><i></i>结算佣金</a> </#if>
		</div>
	</div>
	<#include "/common.ftl">
</body>
</html>