<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>预约考试</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="https://static.xxwkj.club/jiaxiao/css/main.css">
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
        <div class="weui-cells__title">添加学员</div>
        <#if studentLst?? && (studentLst?size > 0)>
        <form id="form">
			<div class="weui-cells__title"></div>
			<div class="weui-cells weui-cells_checkbox">
				<#list studentLst as data>
					<label class="weui-cell weui-check__label" for="${data.id}">
			            <div class="weui-cell__hd">
			                <input type="checkbox" class="weui-check" name="studentIds" id="${data.id}" value="${data.id}">
			                <i class="weui-icon-checked"></i>
			            </div>
			            <div class="weui-cell__bd">
			            	<div class="weui-flex">
					            <div class="weui-flex__item">${data.schoolName}</div>
					            <div class="weui-flex__item">${data.username}</div>
					            <div class="weui-flex__item">${data.mobile}</div>
			    			</div>
		            	</div>
		        	</label>
				</#list>
	        </div>
       	</form>
        
        <div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" id="addBtn">确定约考</a>
		</div>
        <#else>
        <div class="weui-loadmore weui-loadmore_line">
            <span class="weui-loadmore__tips globl_bg_color">暂无数据</span>
       	</div>
        </#if>
       
	</div>
	<#include "/common.ftl">
	<script type="text/javascript">
		$(function(){
			$(".weui-check__label:odd").css("background", "#fcfcfc");
			$("#addBtn").on("click", function(){
				var data = $("#form").serialize();
	      		if(data){
	      			$.singlePost($(this), "/teacher/student/exam/${exam.id}/add/more", data).done(function(res){
	      				if(res.code == "0"){
	      					$.toSuccess({
	                            "title":"添加成功",
	                            "primary_btn_msg":"查看详情",
	                            "primary_btn_url":"javascript:history.back();",
	                            "default_btn_msg":"邀请考试",
	    						"default_btn_url":"/teacher/student/exam/notify/" + res.data.id
	                        });
	      				} else {
							$.toast(res.msg, "cancel");
	      				}
	      			});
	      		} else {
	      			$.toast("请选择要考试的学员", "cancel");
	      		}
			});
		});
	</script>
	
</body>
</html>



 