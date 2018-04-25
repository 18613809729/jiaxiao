<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>销售员</title>
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
	<script id="error" type="text/html">
		<div class="weui-loadmore weui-loadmore_line">
            <span class="weui-loadmore__tips globl_bg_color">数据加载失败</span>
        </div>
	</script>
	<script id="empty" type="text/html">
		<div class="weui-loadmore weui-loadmore_line">
            <span class="weui-loadmore__tips globl_bg_color">暂无数据</span>
        </div>
	</script>
	<script id="sellerLst" type="text/html">
			<%for (var j = 0; j < datas.length; j++){%>
				<div class="weui-cells__title"><%=datas[j].lettel%></div>
				<div class="weui-cells">
	   				<%for (var i = 0; i < datas[j]['data'].length; i++){%>
	   				<a class="weui-cell weui-cell_access" href="/teacher/seller/fee/settle/<%=datas[j]['data'][i].id%>">
						<div class="weui-cell__hd">
							<%if(datas[j]['data'][i].headImg != null){%>
								<img src="<%=datas[j]['data'][i].headImg%>" width="60px">
							<%} else {%>
								<img src="https://static.xxwkj.club/jiaxiao/image/default_head_img.jpg" width="60px">
							<%}%>
						</div>
						<div class="weui-cell__bd">
							<p><%=datas[j]['data'][i].username%> &nbsp;&nbsp;&nbsp;&nbsp; 金额：<%=datas[j]['data'][i].totalMoney%></p>
							<p class="sub_content">手机号：<%=datas[j]['data'][i].mobile%></p>
						</div>
						<div class="weui-cell__ft">
						</div>
					</a>
					<%}%>
				</div>
			<%}%>
			<br>
	</script>

	<script type="text/javascript">
	$(function(){
		function render(sellers){
			if(sellers.length){
				var tpl = template(document.getElementById('sellerLst').innerHTML);
				$("#container").html(tpl({"datas":$.groupByPinyin(sellers, "username")}));
			} else {
				$("#container").html(template(document.getElementById('empty').innerHTML, {}));
			}
		}

		$.getJSON("/teacher/seller/fee/all.json").done(function(res){
        	res.code == '0' && render(res.data);             
        }).fail(function() {
			$("#container").html(template(document.getElementById('error').innerHTML, {}));
  		});
	});
	</script>
</body>
</html>