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

		<div class="weui-cells weui-cells_form">
			<div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd">
                    <label for="" class="weui-label">筛选条件</label>
                </div>
                <div class="weui-cell__bd">
                    <select class="weui-select" id="type">
                        <option value="1" selected>学车中</option>
		        		<option value="21">科目一</option>
		        		<option value="22">科目二</option>
		        		<option value="23">科目三</option>
		        		<option value="24">科目四</option>
		        		<option value="3">已毕业</option>
		        		<option value="4">欠费中</option>
                    </select>
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
      	var preType = "1";
      	$("#type").on("change", function(){
      		var type = $(this).val();
      		if(preType != type){
				preType = type;
				loadData(calUrl(type));
      		}
      	});
      	
		var searchStudents;
      	$.getJSON("/teacher/student/search.json").done(function(res){
        	res.code == '0' && (searchStudents = res.data);
        });

  		$("body").on("click", "#search", function(){
            if(searchStudents == undefined){
                $.toast("加载学员搜索信息失败", "cancel");
                return;
            }
            $.searchDialog({"datas":searchStudents,  "itemClickCallback":function(data){
    			location.href = "/teacher/student/info/" + data.id;
    			return false;
        	}});
        });
	});
	</script>
</body>
</html>