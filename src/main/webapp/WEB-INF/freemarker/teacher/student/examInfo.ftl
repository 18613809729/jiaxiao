<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>预约考试</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="http://localhost/jiaxiao/css/main.css">
</head>
<body ontouchstart>
	<div class="page">
		<div class="weui-cells__title">考试信息</div>
		<div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>科目</p>
                </div>
                <div class="weui-cell__ft">${exam.stageName}</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>考试日期</p>
                </div>
                <div class="weui-cell__ft">${exam.examDate}</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <p>创建时间</p>
                </div>
                <div class="weui-cell__ft">${exam.createDate}</div>
            </div>
        </div>

        <div class="weui-cells__title">学员信息</div>
		<div class="weui-cells">
           <#list studentLst as student>
           		<#if student.status??>
					<a class="weui-cell item weui-cell_access" href="/teacher/student/info/${student.id}">
		                <div class="weui-cell__bd">
		                    <div class="weui-flex">
					            <div class="weui-flex__item">${student.schoolName}</div>
					            <div class="weui-flex__item">${student.username}</div>
					            <div class="weui-flex__item">${student.mobile}</div>
					            <div class="weui-flex__item"><#if student.status == "1"> 通过 <#else> 未通过 </#if></div>
    						</div>
		                </div>
		                <div class="weui-cell__ft"></div>
            		</a>
            	<#else>
            		<div class="weui-cell weui-cell_swiped">
						<div class="weui-cell__bd">
							<a class="weui-cell item weui-cell_access" href="/teacher/student/info/${student.id}">
								<div class="weui-cell__bd">
									<div class="weui-flex">
							            <div class="weui-flex__item">${student.schoolName}</div>
					            		<div class="weui-flex__item">${student.username}</div>
					            		<div class="weui-flex__item">${student.mobile}</div>
					            		<div class="weui-flex__item"></div>
							        </div>
								</div>
								<div class="weui-cell__ft"></div>
							</a>
						</div>
						<div class="weui-cell__ft">
							<a class="weui-swiped-btn weui-swiped-btn_warn del_btn" href="javascript:" data-id="${student.id}">删除</a>
						</div>
					</div>
           		</#if>
           </#list>
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



 