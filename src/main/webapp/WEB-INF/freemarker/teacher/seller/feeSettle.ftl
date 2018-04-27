<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>佣金结算</title>
	<#include "/head.ftl">
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
			<a href="javascript:;" class="weui-btn weui-btn_primary" id="submitBtn"><i></i>结算</a>
		</div>
		<br>
	</div>
	<#include "/common.ftl">
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