<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>佣金历史</title>
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
			<div class="weui-cells">
			<%for (var i = 0; i < datas.length; i++){%>
	   				<a class="weui-cell weui-cell_access" href="/teacher/seller/fee/history/detail/<%=datas[i].payId%>">
						<div class="weui-cell__hd">
							<%if(datas[i].headImg != null){%>
								<img src="<%=datas[i].headImg%>" width="60px">
							<%} else {%>
								<img src="https://static.xxwkj.club/jiaxiao/image/default_head_img.jpg" width="60px">
							<%}%>
						</div>
						<div class="weui-cell__bd">
							<p><%=datas[i].username%> &nbsp;&nbsp;&nbsp;&nbsp; 支付金额：<%=datas[i].totalMoney%></p>
							<p class="sub_content">支付时间：<%=datas[i].payTime%></p>
						</div>
						<div class="weui-cell__ft">
						</div>
					</a>
			<%}%>
			<%if(hasMore){%>
					<a href="javascript:void(0);" id="loadMore" class="weui-cell weui-cell_link">
	                	<div class="weui-cell__bd">查看更多</div>
	            	</a>
	        <%}%>
			</div>
			<br>
	</script>

	<script type="text/javascript">
	$(function(){
		var sellers = [];
		function render(data){
			sellers = sellers.concat(data);
			if(sellers.length){
				var tpl = template(document.getElementById('sellerLst').innerHTML);
				$("#container").html(tpl({"datas":sellers, "hasMore": data.length > 0}));
			} else {
				$("#container").html(template(document.getElementById('empty').innerHTML, {}));
			}
		}

		$.getJSON("/teacher/seller/info/history/fee/paied/${sellerId}/data.json").done(function(res){
        	res.code == '0' && render(res.data);             
        }).fail(function() {
			$("#container").html(template(document.getElementById('error').innerHTML, {}));
  		});

  		$("body").on("click", function(){
  			$.getJSON("/teacher/seller/info/history/fee/paied/${sellerId}/data.json?offset=" + sellers.length).done(function(res){
        		res.code == '0' && render(res.data);             
        	}).fail(function() {
				$.toast("请求出错，请稍候再试", "cancel");
  			});
  		});
	});
	</script>
</body>
</html>