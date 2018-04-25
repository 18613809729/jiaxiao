<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>考试历史</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="https://static.xxwkj.club/jiaxiao/css/main.css">
</head>
<body ontouchstart>
	<div class="page">
		<div id="container">
			<div class="weui-loadmore">
				<i class="weui-loading"></i>
				<span class="weui-loadmore__tips">正在加载</span>
			</div>
		</div>

		<div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" href="/teacher/student/exam/index">添加考试</a>
		</div>
		<br>
	</div>
	<#include "/common.ftl">
	<script id="error" type="text/html">
		<div class="weui-loadmore weui-loadmore_line">
            <span class="weui-loadmore__tips globl_bg_color">数据加载失败</span>
        </div>
	</script>
	<script id="loading" type="text/html">
		<div class="weui-loadmore">
			<i class="weui-loading"></i>
			<span class="weui-loadmore__tips">正在加载</span>
		</div>
	</script>
	<script id="empty" type="text/html">
		<div class="weui-loadmore weui-loadmore_line">
            <span class="weui-loadmore__tips globl_bg_color">暂无数据</span>
        </div>
	</script>
	
	<script id="dataLst" type="text/html">
		<%for (var i = 0; i < datas.length; i++){%>
    		<%:=cellTpl({"data":datas[i]})%>
    	<%}%>
    	<a id="loadMore" class="weui-cell weui-cell_link">
            <div class="weui-cell__bd">查看更多</div>
        </a>
	</script>

	<script id="cellTpl" type="text/html">
		<br>
		<div class="weui-form-preview">
			<div class="weui-form-preview__bd">
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">考试科目</label>
					<span class="weui-form-preview__value"><%=data.stageName%></span>
				</div>
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">考试时间</label>
					<span class="weui-form-preview__value"><%=data.examDate%></span>
				</div>
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">考试人员</label>
					<span class="weui-form-preview__value"><%=data.studentNames%></span>
				</div>
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">创建时间</label>
					<span class="weui-form-preview__value"><%=data.createDate%></span>
				</div>
			</div>
			<div class="weui-form-preview__ft">
				<a class="weui-form-preview__btn weui-form-preview__btn_default" href="/teacher/student/exam/notify/<%=data.id%>">邀请考试</a>
				<a  class="weui-form-preview__btn weui-form-preview__btn_primary" href="/teacher/student/exam/<%=data.id%>/info">结果登记</a>
			</div>
		</div>
	</script>


	<script type="text/javascript">
	$(function(){
		var datas = [];
		function render(dataInfos, stage){
			if(dataInfos.length){
				var tpl = template(document.getElementById('dataLst').innerHTML);
    			var cellTpl = template(document.getElementById('cellTpl').innerHTML);
    			$("#container").html(tpl({"cellTpl":cellTpl, "datas":dataInfos}));
			} else {
				$("#container").html(template(document.getElementById('empty').innerHTML, {}));
			}
		}

		$.getJSON("/teacher/student/exam/history/data.json").done(function(res){
        	if(res.code == '0'){
               datas = datas.concat(res.data);
               render(datas);
            } else {
                $.toast(res.msg, "cancel");
            }
        }).fail(function() {
			$("#container").html(template(document.getElementById('error').innerHTML, {}));
  		});
		
		$("body").on("click", "#loadMore", function(){
			$.getJSON("/teacher/student/exam/history/data.json?offset=" + datas.length).done(function(res){
	        	if(res.code == '0'){
	        		if(res.data.length){
	        			datas = datas.concat(res.data);
	               		render(datas);
	        		} else {
	        			$("#loadMore").remove();
	        		}
	            } else {
	                $.toast(res.msg, "cancel");
	            }
	        }).fail(function() {
				$.toast("数据加载失败", "cancel");
	  		});
		});
	});
	</script>
</body>
</html>



 