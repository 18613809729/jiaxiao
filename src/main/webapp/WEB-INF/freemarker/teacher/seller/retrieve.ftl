<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>销售员</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page">
		<div class="search_bar">
			<div class="search_label" id="search">
				<i class="weui-icon-search"></i>
				<span>搜索</span>
			</div>
		</div>
		<div id="container">
			<div class="weui-loadmore">
				<i class="weui-loading"></i>
				<span class="weui-loadmore__tips">正在加载</span>
			</div>
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
	   				<a class="weui-cell weui-cell_access" href="/teacher/seller/info/<%=datas[j]['data'][i].id%>">
						<div class="weui-cell__hd">
							<%if(datas[j]['data'][i].headImg != null){%>
								<img src="<%=datas[j]['data'][i].headImg%>" width="60px">
							<%} else {%>
								<img src="https://static.xxwkj.club/jiaxiao/image/default_head_img.jpg" width="60px">
							<%}%>
						</div>
						<div class="weui-cell__bd">
							<p><%=datas[j]['data'][i].username%></p>
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

		var sellerLst;

		$.getJSON("/seller/all.json").done(function(res){
        	if(res.code == '0'){
                sellerLst = res.data;
                render(sellerLst);
            } else {
                $.toast(res.msg, "cancel");
            }
        }).fail(function() {
			$("#container").html(template(document.getElementById('error').innerHTML, {}));
  		});


  		$("body").on("click", "#search", function(){
            if(sellerLst == undefined){
                $.toast("加载销售员搜索信息失败", "cancel");
                return;
            }
            $.searchDialog({"datas":sellerLst,  "itemClickCallback":function(data){
    			location.href = "/teacher/seller/info/" + data.id;
    			return false;
        	}});
        });

	});
	</script>
</body>
</html>