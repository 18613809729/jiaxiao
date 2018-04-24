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
           		<div class="weui-cell weui-cell_swiped">
					<div class="weui-cell__bd">
						<a class="weui-cell item weui-cell_access" href="/teacher/student/info/${student.id}">
							<div class="weui-cell__bd">
								<div class="weui-flex">
<!-- 							            <div class="weui-flex__item">${student.schoolName}</div>
-->					            	<div class="weui-flex__item">${student.username}</div>
				            		<div class="weui-flex__item">${student.mobile}</div>
				            		<div class="weui-flex__item"></div>
						        </div>
							</div>
							<div class="weui-cell__ft status">
							<#if student.examStatus == "1"> 
								<span class="font_green">已通过</span> 
							<#elseif student.examStatus == "0"> 
								<span class="font_warn">未通过</span> 
							<#else>
								<span class="opacity0">占位符</span>
							</#if>
							</div>
						</a>
					</div>
					<div class="weui-cell__ft action">
						<#if student.examStatus??>
							<a class="weui-swiped-btn weui-swiped-btn_default" href="/teacher/student/info/${student.id}">学生信息</a>
						<#else>
							<a class="weui-swiped-btn weui-swiped-btn_default score_btn" href="javascript:" data-id="${student.id}">成绩</a>
							<a class="weui-swiped-btn weui-swiped-btn_warn del_btn" href="javascript:" data-id="${student.id}">删除</a>
						</#if>
					</div>
				</div>
           </#list>
        </div>

        <div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" id="addBtn">添加学员</a>
		</div>
		<br>
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/city-picker.min.js"></script>
	<script src="https://cdn.bootcss.com/fastclick/1.0.6/fastclick.js"></script>
	<script src="http://localhost/jiaxiao/js/template.js"></script>
	<script type="text/javascript" src="http://localhost/jiaxiao/js/main.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".item:odd").css("background", "#fcfcfc");
			$(".del_btn").click(function(){
				var _this = $(this);
				$('.weui-cell_swiped').swipeout('close');
				$.actions({
				  actions: [{
				    text: "确认删除",
				    className: "color-danger",
				    onClick: function() {
				      	$.singleDelete(_this, "/teacher/student/exam/${exam.id}/info/" + _this.data("id")).done(function(res){
				      		if(res.code == "0"){
								_this.parents(".weui-cell_swiped").remove();
				      		} else {
				      			$.toast(res.msg, "cancel");
				      		}
  						});
				    }
				  }]
				});
			});
			$(".score_btn").click(function(){
				$('.weui-cell_swiped').swipeout('close');
				var _this = $(this);
				$.actions({
				  actions: [{
				    text: "通过",
				    className: "color-primary",
				    onClick: function() {
				      	$.confirm("确认通过？", function(){
				      		$.singlePut(_this, "/teacher/student/exam/${exam.id}/info/" + _this.data("id") + "/pass").done(function(res){
					      		if(res.code == "0"){
									_this.parents(".weui-cell_swiped").find(".status").html('<span class="font_green">已通过</span>');
									_this.parents(".weui-cell_swiped").find(".action").html('<a class="weui-swiped-btn weui-swiped-btn_default" href="/teacher/student/info/' + _this.data("id") +'">学生信息</a>');
					      		} else {
					      			$.toast(res.msg, "cancel");
					      		}
  							});
				      	});
				    }
				  },{
				    text: "不通过",
				    className: "color-danger",
				    onClick: function() {
				      $.confirm('<span class="font_warn">确认不通过？</span>',function(){
				      	$.singlePut(_this, "/teacher/student/exam/${exam.id}/info/" + _this.data("id") + "/nopass").done(function(res){
					      		if(res.code == "0"){
									_this.parents(".weui-cell_swiped").find(".status").html('<span class="font_warn">未通过</span> ');
									_this.parents(".weui-cell_swiped").find(".action").html('<a class="weui-swiped-btn weui-swiped-btn_default" href="/teacher/student/info/' + _this.data("id") +'">学生信息</a>');
					      		} else {
					      			$.toast(res.msg, "cancel");
					      		}
  							});
				      });
				    }
				  }]
				});
			});
		});
	</script>
	
</body>
</html>



 