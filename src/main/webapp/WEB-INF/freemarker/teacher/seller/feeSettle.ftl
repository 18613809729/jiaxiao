<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>佣金结算</title>
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
			<div class="weui-cells__title">学员姓名/直销人员/佣金金额</div>
			<div class="weui-cells weui-cells_checkbox">
				<#list feeList as feeInfo>
				<label class="weui-cell weui-check__label" for="${feeInfo.id}">
					<div class="weui-cell__hd">
						<input type="checkbox" class="weui-check" name="feeIds" id="${feeInfo.id}" checked="checked" value="${feeInfo.id}" data-money="${feeInfo.money}">
						<i class="weui-icon-checked"></i>
					</div>
					<div class="weui-cell__bd">
						<div class="weui-flex">
							<div class="weui-flex__item">${feeInfo.studentName}</div>
							<div class="weui-flex__item">${feeInfo.topSellerUsername}</div>
							<div class="weui-flex__item">${feeInfo.money}</div>
						</div>
					</div>
					<div class="weui-cell__ft">
					</div>
				</label>
				</#list>
			</div>
		</form>
		<br>
		<div class="weui-cells">
			<div class="weui-cell" href="/teacher/seller/info/${info.id}">
				<div class="weui-cell__hd">
					总金额:
				</div>
				<div class="weui-cell__bd">
				</div>
				<div class="weui-cell__ft" id="feeSum">
				</div>
			</div>
		</div>
		<div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" id="submitBtn"><i></i>结算</a>
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
	<script type="text/javascript">
		$(function(){
			function calSum(){
				var sum = 0;
				$('[name="feeIds"]:checked').each(function(){
					sum += parseFloat($(this).data("money"));
				});
				$("#feeSum").html(sum);	
			}
			calSum();
			$('[name="feeIds"]').click(function(){
				calSum();
			});
			$("#submitBtn").click(function(){
				var _this = $(this);
				$.confirm('确认结算<span class="font_warn">${info.username}</span>佣金<span class="font_warn">' + $('#feeSum').html() + '</span>元?（请核对金额是否正确）', function() {
					$.singlePut(_this, "/teacher/seller/fee/settle/${info.id}", $("#form").serialize()).done(function(res){
						res.code == "0" && $.toSuccess({
							"title":"结算成功",
							"primary_btn_url":"/teacher/seller/fee/index",
						});
					});
				});
			});
		});
	</script>
</body>
</html>