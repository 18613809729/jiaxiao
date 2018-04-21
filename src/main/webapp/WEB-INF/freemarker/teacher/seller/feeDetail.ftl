<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>佣金详情</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="http://localhost/jiaxiao/css/main.css">
</head>
<body ontouchstart>
	<div class="page" id="container">
		<div class="weui-cells">
			<a class="weui-cell" href="/teacher/seller/info/${info.id}">
				<div class="weui-cell__hd">
					<img src="${info.user.headImg!"https://static.newbs.xyz/jiaxiao/image/default_head_img.jpg"}" width="60px">
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
			<div class="weui-cells__title">学生姓名/直销人员/佣金金额</div>
			<div class="weui-cells">
				<#list feeList as feeInfo>
				<a class="weui-cell weui-cell_access" href="/teacher/student/info/${feeInfo.studentId}">
					<div class="weui-cell__bd">
						<div class="weui-flex">
							<div class="weui-flex__item">${feeInfo.studentName}</div>
							<div class="weui-flex__item">${feeInfo.topSellerUsername}</div>
							<div class="weui-flex__item">${feeInfo.money}</div>
						</div>
					</div>
					<div class="weui-cell__ft">
					</div>
				</a>
				</#list>
				<a href="javascript:void(0);" id="loadMore" class="weui-cell weui-cell_link">
					<div class="weui-cell__bd">
					</div>
	               	<div class="weui-cell__ft">支付金额：${feeSum}</div>
	            </a>
			</div>
		</form>
		<br>
		<div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" href="javascript:history.back();"><i></i>确定</a>
		</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/city-picker.min.js"></script>
	<script src="https://cdn.bootcss.com/mootools/1.6.0/mootools-core.min.js"></script>
	<script src="http://localhost/jiaxiao/js/pinyin.js"></script>
	<script src="http://localhost/jiaxiao/js/formValidate.js"></script>
	<script src="http://localhost/jiaxiao/js/search.js"></script>
	<script src="http://localhost/jiaxiao/js/template.js"></script>
	<script src="http://localhost/jiaxiao/js/main.js"></script>
</body>
</html>