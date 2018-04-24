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
	<div class="page z_index100 fit_content">
		<div id="searchPannel">
			<div class="weui-search-bar" id="searchBar">
				<form class="weui-search-bar__form">
					<div class="weui-search-bar__box">
						<i class="weui-icon-search"></i>
						<input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索" required/>
						<a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
					</div>
					<label class="weui-search-bar__label" id="searchText">
						<i class="weui-icon-search"></i>
						<span>搜索</span>
					</label>
				</form>
				<a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
			</div>
			<div class="weui-cells searchbar-result" id="searchResult">
			</div>
		</div>
	</div>
	<div class="page mt50">
		<div class="weui-cells weui-cells_form">
			<div class="weui-cell">
		        <div class="weui-cell__hd"><label for="name" class="weui-label">选择</label></div>
		        <div class="weui-cell__bd">
		          <input class="weui-input" id="type" type="text" value="学车中" readonly="" data-values="1">
		        </div>
      		</div>
      	</div>
      	<div id="container">
			<div class="weui-loadmore">
				<i class="weui-loading"></i>
				<span class="weui-loadmore__tips">正在加载</span>
			</div>
		</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/city-picker.min.js"></script>
    <script src="https://cdn.bootcss.com/mootools/1.6.0/mootools-core.min.js"></script>
    <script src="https://static.xxwkj.club/jiaxiao/js/pinyin.js"></script>
    <script src="https://static.xxwkj.club/jiaxiao/js/formValidate.js"></script>
    <script src="https://static.xxwkj.club/jiaxiao/js/search.js"></script>
    <script src="https://static.xxwkj.club/jiaxiao/js/template.js"></script>
    <script src="https://static.xxwkj.club/jiaxiao/js/main.js"></script>
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

	<script id="loading" type="text/html">
		<div class="weui-loadmore">
			<i class="weui-loading"></i>
			<span class="weui-loadmore__tips">正在加载</span>
		</div>
	</script>
	
	<script id="dataLst" type="text/html">
			<%for (var j = 0; j < datas.length; j++){%>
				<div class="weui-cells__title"><%=datas[j].lettel%></div>
				<div class="weui-cells">
	   				<%for (var i = 0; i < datas[j]['data'].length; i++){%>
	   				<a class="weui-cell weui-cell_access" href="/teacher/student/info/<%=datas[j]['data'][i].id%>">
						<div class="weui-cell__hd">
							<%if(datas[j]['data'][i].headImg != null){%>
								<img src="<%=datas[j]['data'][i].headImg%>" width="60px">
							<%} else {%>
								<img src="https://static.newbs.xyz/jiaxiao/image/default_head_img.jpg" width="60px">
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
				var tpl = template(document.getElementById('dataLst').innerHTML);
				$("#container").html(tpl({"datas":$.groupByPinyin(sellers, "username")}));
			} else {
				$("#container").html(template(document.getElementById('empty').innerHTML, {}));
			}
		}

		function calUrl(type){
			var url = "/teacher/student/data.json";
			if(type == "1"){
				return url + "?type=inLearn";
			}
			if(type == "21" || type == "22" || type == "23" || type == "24"){
				return url + "?type=stage&stage=" + parseInt(type) % 10;
			}
			if(type == "3"){
				return url + "?type=stage&stage=10";
			}
			if(type == "4"){
				return url + "?type=arrearage";
			}
		}

		function loadData(url){
			$("#container").html(template(document.getElementById('loading').innerHTML, {}));
			$.getJSON(url).done(function(res){
	        	if(res.code == '0'){
	                render(res.data);
	            } else {
	                $.toast(res.msg, "cancel");
	            }
	        }).fail(function() {
				$("#container").html(template(document.getElementById('error').innerHTML, {}));
	  		});
		}

		loadData(calUrl("1"));
  		$("#type").select({
	        title: "筛选条件",
	        items: [{title: "学车中",value: "1"},{title: "科目一",value: "21"},{title: "科目二",value: "22"},{title: "科目三",value: "23"},{title: "科目四",value: "24"},{title: "已毕业",value: "3"},{title: "欠费中",value: "4"}]
      	});
      	var preType = "1";
      	$("#type").on("change", function(){
      		var type = $(this).data("values");
      		if(preType != type){
				preType = type;
				loadData(calUrl(type));
      		}
      	});

      	$.getJSON("/teacher/student/search.json").done(function(res){
        	if(res.code == '0'){
                $("#searchPannel").userSearchBar({"datas":res.data, "itemClickCallback":function(data){
        			location.href = "/teacher/student/info/" + data.id;
        			this.cancelSearch();
        		}});
            }
        }).fail(function() {
			$.toast("加载学员搜索信息失败", "cancel");
  		});
      	
	});
	</script>
</body>
</html>