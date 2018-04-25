
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>考试通知</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page" id="container">
		 <div style="margin-top: 2rem;">
            <p style="text-align: center;font-size: 1rem;">考试通知</p>
            <p style="padding: 1rem;">请以下人员于<span style="color: red;"> ${examDate} </span>参加<span style="color: red;"> ${stage.desc} </span>考试：
            <#list examInfos as examInfo>
            	${examInfo.username}<#if examInfo_has_next>、<#else> 。</#if>
            </#list></p>
        </div>
        <div class="weui-btn-area">
			<a href="xlAdd1.html" class="weui-btn weui-btn_primary" id="addMore">分享通知</a>
		</div>
		<br>
	</div>
	<#include "/common.ftl">
</body>
</html>