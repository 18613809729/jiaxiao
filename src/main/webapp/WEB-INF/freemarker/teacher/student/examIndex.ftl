<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>预约考试</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="https://static.xxwkj.club/jiaxiao/css/main.css">
</head>
<body ontouchstart>
	<div class="page">
		<div class="weui-tab">
				<div class="weui-navbar">
					<a class="weui-navbar__item" data-id="1">
						科目一
					</a>
					<a class="weui-navbar__item" data-id="2">
						科目二
					</a>
					<a class="weui-navbar__item" data-id="3">
						科目三
					</a>
					<a class="weui-navbar__item" data-id="4">
						科目四
					</a>
				</div>
				<div class="weui-tab__panel">
					<div class="weui-cells weui-cells_form">
			            <div class="weui-cell">
			                <div class="weui-cell__hd"><label for="" class="weui-label">考试日期</label></div>
			                <div class="weui-cell__bd">
			                    <input class="weui-input" type="text" data-toggle="date" id="date" readonly placeholder="请选择考试日期">
			                </div>
			            </div>
        			</div>

					<div id="container">
						<div class="weui-loadmore">
							<i class="weui-loading"></i>
							<span class="weui-loadmore__tips">正在加载</span>
						</div>
					</div>
					
					<div class="weui-btn-area">
						<a class="weui-btn weui-btn_primary" id="addBtn">确定约考</a>
					</div>
				</div>
			</div>
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
		<form id="form">
			<div class="weui-cells__title"></div>
			<div class="weui-cells weui-cells_checkbox">
				<%for (var i = 0; i < datas.length; i++){%>
	        		<%:=cellTpl({"data":datas[i]})%>
	        	<%}%>
	        </div>
        </form>
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
        $("#date").calendar({"dateFormat":'yyyy-mm-dd', "value":[]});
		var curStage = location.hash ? location.hash.substring(1) : "2";
		var preDate = "";
		function render(dataInfos, stage){
			if(dataInfos.length){
				var tpl = template(document.getElementById('dataLst').innerHTML);
    			var cellTpl = template(document.getElementById('cellTpl').innerHTML);
    			$("#container").html(tpl({"cellTpl":cellTpl, "datas":dataInfos}));
    			$(".weui-check__label:odd").css("background", "#fcfcfc");
			} else {
				$("#container").html(template(document.getElementById('empty').innerHTML, {}));
			}
		}

		function load(stage, examDate){
			$("#container").html(template(document.getElementById('loading').innerHTML, {}));
			$.getJSON("/teacher/student/exam/" + stage + "/data.json?examDate=" + examDate).done(function(res){
	        	if(res.code == '0'){
	                render(res.data, stage);
	            } else {
	                $.toast(res.msg, "cancel");
	            }
	        }).fail(function() {
	        	preDate = "";
				$("#container").html(template(document.getElementById('error').innerHTML, {}));
	  		});
		}

		$("#date").on("change", function(){
			if(this.value && this.value != preDate){
				preDate = this.value;
				load(curStage, this.value);
			}
		});

		$("#addBtn").on("click", function(){
			var data = $("#form").serialize();
      		if(data){
      			if(data && typeof data == "string"){
			    	data += "&examDate=" + preDate;
				 } else {
				    data = data || {};
				    data.examDate = preDate;
	  			}
      			$.singlePost($(this), "/teacher/student/exam/" + curStage, data).done(function(res){
      				if(res.code == "0"){
      					$.toSuccess({
                            "title":"约考成功",
                            "primary_btn_msg":"查看详情",
                            "primary_btn_url":"/teacher/student/exam/" + res.data.id +"/info",
                            "default_btn_msg":"邀请考试",
    						"default_btn_url":"/teacher/student/exam/notify/" + res.data.id
                        });
      				} else {
						$.toast(res.msg, "cancel");
      				}
      			});
      		} else {
      			$.toast("请选择要考试的学员", "cancel");
      		}
		});
		

		function navbarFun(_this){
			if(!_this.hasClass("weui-bar__item_on")){
				var stage = _this.data("id");
				curStage = stage;
				$(".weui-navbar__item").removeClass("weui-bar__item_on");
				_this.addClass("weui-bar__item_on");
				$("#container").html("");
				$("#date").val("");
				preDate = "";
			}
		}

		$(".weui-navbar__item").click(function(){
			navbarFun($(this));
		});

		navbarFun($('.weui-navbar__item[data-id="' + curStage + '"]'));
	});
	</script>
</body>
</html>



 