<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>训练添加</title>
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
	<div class="page mt50" id="container">
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

	<script id="loading" type="text/html">
		<div class="weui-loadmore">
			<i class="weui-loading"></i>
			<span class="weui-loadmore__tips">正在加载</span>
		</div>
	</script>
	
	<script id="dataLst" type="text/html">
		<form id="form">
			<div class="weui-cells__title">${stageInfo.desc}训练</div>
			<div class="weui-cells weui-cells_checkbox" id="items">
				<%for (var i = 0; i < datas.length; i++){%>
	            	<%:=cellTpl({"data":datas[i]})%>
	            <%}%>
	        </div>
        </form>
		<div class="weui-btn-area">
			<a href="javascript:;" class="weui-btn weui-btn_primary" id="addBtn">确定添加</a>
		</div>
		<br>
	</script>
	<script id="cellTpl" type="text/html">
		<label class="weui-cell weui-check__label" for="<%=data.id%>">
                <div class="weui-cell__hd">
                    <input type="checkbox" class="weui-check" name="studentIds" id="<%=data.id%>" value="<%=data.id%>" <%if(data.checked){%> checked="checked"<%}%>>
                    <i class="weui-icon-checked"></i>
                </div>
                <div class="weui-cell__bd">
                	<div class="weui-flex">
			            <div class="weui-flex__item"><%=data.schoolName%></div>
			            <div class="weui-flex__item"><%=data.username%></div>
			            <div class="weui-flex__item"><%=data.mobile%></div>
        			</div>
                </div>
            </label>
	</script>
	<script type="text/javascript">
	$(function(){
		function render(dataInfos){
			if(dataInfos.length){
				var tpl = template(document.getElementById('dataLst').innerHTML);
    			var cellTpl = template(document.getElementById('cellTpl').innerHTML);
    			$("#container").html(tpl({"cellTpl":cellTpl, "datas":dataInfos}))
			} else {
				$("#container").html(template(document.getElementById('empty').innerHTML, {}));
			}
		}
		
		var students = [];

		$.getJSON("/teacher/student/train/${stage}/add/data.json").done(function(res){
        	if(res.code == '0'){
        		students = students.concat(res.data);
                render(res.data);
            } else {
                $.toast(res.msg, "cancel");
            }
        }).fail(function() {
			$("#container").html(template(document.getElementById('error').innerHTML, {}));
  		});

      	$.getJSON("/teacher/student/search/inlearn.json").done(function(res){
        	if(res.code == '0'){
                $("#searchPannel").userSearchBar({"datas":res.data, "itemClickCallback":function(data){
                	this.cancelSearch();
                	for (var i = 0; i < students.length; i++) {
                		if(students[i].id == data.id){
                			return;
                		}
                	}
                	data.checked = true;
                	students.push(data);
                	if(students.length == 1){
                		render(students);
                	} else {
						$("#items").append(template(document.getElementById('cellTpl').innerHTML, {"data":data}));
                	}
        		}});
            }
        }).fail(function() {
			$.toast("加载学员搜索信息失败", "cancel");
  		});
      	
      	$("body").on("click", "#addBtn", function(){
      		var data = $("#form").serialize();
      		if(data){
      			$.singlePost($(this), "/teacher/student/train/${stage}", data).done(function(res){
      				if(res.code == "0"){
      					$.toSuccess({
                            "title":"添加成功",
                            "primary_btn_url":"/teacher/student/train/index#${stage}"
                        });
      				} else if(res.code == "101"){
						$.toast('学员' + res.data.username + "已在训练中", "cancel");
      				} else {
						$.toast(res.msg, "cancel");
      				}
      			});
      		} else {
      			$.toast("请选择要添加的学员", "cancel");
      		}
      	});
	});
	</script>
</body>
</html>