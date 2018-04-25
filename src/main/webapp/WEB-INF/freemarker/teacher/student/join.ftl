<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>预约报名</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="https://static.xxwkj.club/jiaxiao/css/main.css">
</head>
<body ontouchstart>
	<div class="page" id="container">
		<div class="weui-loadmore">
            <i class="weui-loading"></i>
            <span class="weui-loadmore__tips">正在加载</span>
        </div>
	</div>
	<#include "/common.ftl">

	<script id="tpl" type="text/html">
		<div class="weui-cells__title">近三天</div>
		<div class="weui-cells">
			<%if(res.recentLst.length > 0){%>
				 <%:=cellTpl({"data":res.recentLst})%>
			<%} else {%>
				<div class="weui-loadmore weui-loadmore_line">
            		<span class="weui-loadmore__tips">暂无数据</span>
        		</div>
			<%}%>
		</div>
		<div class="weui-cells__title">三天前</div>
		<div class="weui-cells">
			<%if(res.beforeLst.length > 0){%>
				 <%:=cellTpl({"data":res.beforeLst})%>
			<%} else {%>
				<div class="weui-loadmore weui-loadmore_line">
            		<span class="weui-loadmore__tips">暂无数据</span>
        		</div>
			<%}%>
		</div>
	</script>

	<script id="error" type="text/html">
		<div class="weui-loadmore weui-loadmore_line">
            <span class="weui-loadmore__tips globl_bg_color">数据加载失败</span>
        </div>
	</script>

	<script id="cellTpl" type="text/html">
	   	<%for (var i = 0; i < data.length; i++){%>
	   		<div class="weui-cell weui-cell_swiped" data-id="<%=data[i].id%>">
				<div class="weui-cell__bd">
					<div class="weui-cell item cursor_pointer" data-id="<%=data[i].id%>">
						<div class="weui-cell__hd">
							<%if(data[i].headImg) {%>
								<img src="<%=data[i].headImg%>" width="60px">
							<%} else {%>
								<img src="https://static.xxwkj.club/jiaxiao/image/default_head_img.jpg" width="60px">
							<%}%>
							
						</div>
						<div class="weui-cell__bd">
							<p>&nbsp;&nbsp;<%=data[i].username%></p>
							<p class="sub_content">&nbsp;&nbsp;手机号：<%=data[i].mobile%></p>
						</div>
						<div class="weui-cell__ft">
						<%if (data[i].state == 0) {%>
							<a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_primary">查看</a>
						<%} else {%>
							<p>已查看</p>
						<%}%>
						</div>
					</div>
				</div>
				<div class="weui-cell__ft">
					<a class="weui-swiped-btn weui-swiped-btn_warn cell_swipe_btn del_btn" href="javascript:">删除</a>
				</div>
			</div>
	   	<%}%>
	</script>


	<script type="text/javascript">
		$(function(){
			$.getJSON("/teacher/student/join/infos.json").done(function(res){
			 	var tpl = template(document.getElementById('tpl').innerHTML);
    			var cellTpl = template(document.getElementById('cellTpl').innerHTML);
    			$("#container").html(tpl({"cellTpl":cellTpl, "res":res.data}))
    			$('.weui-cell_swiped').swipeout();
			}).fail(function() {
				$("#container").html(template(document.getElementById('error').innerHTML, {}));
  			});

  			 $("body").on("click", ".item", function(){
  			 	location.href = "/teacher/student/join/info/" + $(this).data("id");
  			}).on("click", ".del_btn", function(){
  				var _this = $(this);
  				$.singleDelete(_this, "/teacher/student/join/info/" + _this.parents("[data-id]").data("id")).done(function(res){
  					res.code == "0" && _this.parents("[data-id]").remove();
  				});
  			});
		});
	</script>
</body>
</html>