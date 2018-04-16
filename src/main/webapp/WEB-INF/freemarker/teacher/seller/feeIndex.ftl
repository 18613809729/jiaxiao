<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>销售员</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="http://localhost/jiaxiao/css/main.css">
</head>
<body ontouchstart>
	<div class="page" id="container">
		<div class="weui-loadmore">
			<i class="weui-loading"></i>
			<span class="weui-loadmore__tips">正在加载</span>
		</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/city-picker.min.js"></script>
    <script src="https://cdn.bootcss.com/mootools/1.6.0/mootools-core.min.js"></script>
    <script src="http://localhost/jiaxiao/js/pinyin.js"></script>
    <script src="http://localhost/jiaxiao/js/formValidate.js"></script>
    <script src="http://localhost/jiaxiao/js/search.js"></script>
    <script src="http://localhost/jiaxiao/js/template.js"></script>
    <script src="http://localhost/jiaxiao/js/main.js"></script>
	<script id="error" type="text/html">
		<div class="weui-loadmore weui-loadmore_line">
            <span class="weui-loadmore__tips globl_bg_color">数据加载失败</span>
        </div>
	</script>
	<script id="sellerLst" type="text/html">
			<%for (var j = 0; j < datas.length; j++){%>
				<div class="weui-cells__title"><%=datas[j].lettel%></div>
				<div class="weui-cells">
	   				<%for (var i = 0; i < datas[j]['data'].length; i++){%>
	   				<a class="weui-cell weui-cell_access" href="/teacher/seller/info/<%=datas[j]['data'][i].id%>">
						<div class="weui-cell__hd">
							<%if(datas[j]['data'][i].headImg != null){%>
								<img src="<%=datas[j]['data'][i].headImg%>" width="60px">
							<%} else {%>
								<img src="https://static.newbs.xyz/jiaxiao/image/default_head_img.jpg" width="60px">
							<%}%>
						</div>
						<div class="weui-cell__bd">
							<p><%=datas[j]['data'][i].username%> &nbsp;&nbsp;&nbsp;&nbsp; 总额：<%=datas[j]['data'][i].totalMoney%></p>
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
			var tpl = template(document.getElementById('sellerLst').innerHTML);
			$("#container").html(tpl({"datas":$.groupByPinyin(sellers, "username")}));
		}

		 $.getJSON("/teacher/seller/fee/all.json").done(function(res){
        	if(res.code == '0'){                
                render(res.data);
            } else {
                $.toast(res.msg, "cancel");
            }
        });
	});
	</script>
</body>
</html>