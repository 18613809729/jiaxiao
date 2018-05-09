<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>预约报名</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page">
        <div class="weui-msg">
            <div class="weui-msg__icon-area"><i class="weui-icon-warn weui-icon_msg"></i></div>
            <div class="weui-msg__text-area">
                <h2 class="weui-msg__title">信息提示</h2>
                <p class="weui-msg__desc">您还未成为学员或帐号信息未关联，请预约报名学车或关联学员信息！</p>
            </div>
            <div class="weui-msg__opr-area">
                <p class="weui-btn-area">
                    <a href="/student/join" class="weui-btn weui-btn_primary">预约报名</a>
                    <a href="/student/link" class="weui-btn weui-btn_default">立即关联</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>