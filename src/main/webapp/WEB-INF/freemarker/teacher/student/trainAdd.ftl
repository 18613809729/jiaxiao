<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>训练添加</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page">
		<div class="search_bar">
			<div class="search_label" id="search">
				<i class="weui-icon-search"></i>
				<span>姓名/拼音/手机号</span>
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

        var searchData;
      	$.getJSON("/teacher/student/search/inlearn.json").done(function(res){
        	if(res.code == '0'){
        		searchData = res.data;
            }
        });

  		$("body").on("click", "#search", function(){
            if(searchData == undefined){
                $.toast("加载学员搜索信息失败", "cancel");
                return;
            }
            $.searchDialog({"datas":searchData,  "itemClickCallback":function(data){
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