<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>佣金设置</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="https://static.xxwkj.club/jiaxiao/css/main.css">
</head>
<body ontouchstart>
	<div class="page">
		<form id="form">
			<div class="weui-cells__title">一级分销员</div>
			<div class="weui-cells weui-cells_form">
				<div class="weui-cell">
					<div class="weui-cell__hd"><label class="weui-label">本级佣金</label></div>
					<div class="weui-cell__bd">
						<input class="weui-input align_center" name="commission11" required type="number" step="0.01"  maxlength="6" placeholder="请输入佣金" value="${commissions.c11.value}">
					</div>
				</div>
			</div>
			<br>

			<div class="weui-cells__title">二级分销员</div>
			<div class="weui-cells weui-cells_form">
				<div class="weui-cell">
					<div class="weui-cell__hd"><label class="weui-label">上级佣金</label></div>
					<div class="weui-cell__bd">
						<input class="weui-input align_center" name="commission21" required type="number" step="0.01"  maxlength="6" placeholder="请输入佣金" value="${commissions.c21.value}">
					</div>
				</div>
				<div class="weui-cell">
					<div class="weui-cell__hd"><label class="weui-label">本级佣金</label></div>
					<div class="weui-cell__bd">
						<input class="weui-input align_center" name="commission22" required type="number" step="0.01"  maxlength="6" placeholder="请输入佣金" value="${commissions.c22.value}">
					</div>
				</div>
			</div>
			<br>

			<div class="weui-cells__title">三级分销员</div>
			<div class="weui-cells weui-cells_form">
				<div class="weui-cell">
					<div class="weui-cell__hd"><label class="weui-label">上上级佣金</label></div>
					<div class="weui-cell__bd">
						<input class="weui-input align_center" name="commission31" required type="number" step="0.01"  maxlength="6" placeholder="请输入佣金" value="${commissions.c31.value}">
					</div>
				</div>
				<div class="weui-cell">
					<div class="weui-cell__hd"><label class="weui-label">上级佣金</label></div>
					<div class="weui-cell__bd">
						<input class="weui-input align_center" name="commission32" required type="number" step="0.01"  maxlength="6" placeholder="请输入佣金" value="${commissions.c32.value}">
					</div>
				</div>
				<div class="weui-cell">
					<div class="weui-cell__hd"><label class="weui-label">本级佣金</label></div>
					<div class="weui-cell__bd">
						<input class="weui-input align_center" name="commission33" required type="number" step="0.01"  maxlength="6" placeholder="请输入佣金" value="${commissions.c33.value}">
					</div>
				</div>
			</div>
		</form>
		<br>
		<div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" id="submitBtn"><i></i>修改</a>
			<a href="javascript:history.back();" class="weui-btn weui-btn_default" id="addMore">返回</a>
		</div>
		<br>
	</div>
	<#include "/common.ftl">
	<script type="text/javascript">
		$(function(){
			$("#submitBtn").click(function(){
				var _this = $(this);
				$.confirm("确认修改分销员佣金?", function() {
					$.singlePost(_this, "/teacher/seller/commission", $("#form").serialize()).done(function(res){
						res.success && $.toSuccess({"title":"修改成功","desc":"佣金修改后，将对新增学员立即生效，原有佣金不变", "primary_btn_url":"index"});
					});
  				});
			});
		});

	</script>
</body>
</html>