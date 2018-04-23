
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>学员信息</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="http://localhost/jiaxiao/css/main.css">
	
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
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/city-picker.min.js"></script>
	<script src="https://cdn.bootcss.com/fastclick/1.0.6/fastclick.js"></script>
	<script src="http://localhost/jiaxiao/js/template.js"></script>
	<script type="text/javascript" src="http://localhost/jiaxiao/js/main.js"></script>
</body>
</html>