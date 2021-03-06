<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>每日训练</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page">
		<div class="weui-tab">
				<div class="weui-navbar">
					<a href="javascript:;" class="weui-navbar__item" data-id="1">
						科目一
					</a>
					<a href="javascript:;" class="weui-navbar__item" data-id="2">
						科目二
					</a>
					<a href="javascript:;" class="weui-navbar__item" data-id="3">
						科目三
					</a>
					<a href="javascript:;" class="weui-navbar__item" data-id="4">
						科目四
					</a>
				</div>
				<div class="weui-tab__panel">
					<div id="container">
						<div class="weui-loadmore">
							<i class="weui-loading"></i>
							<span class="weui-loadmore__tips">正在加载</span>
						</div>
					</div>
					
					<div class="weui-btn-area">
						<a href="javascript:;" class="weui-btn weui-btn_primary" id="addBtn">添加学员</a>
					</div>
					<br>
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
		<div class="weui-cells__title"></div>
		<div class="weui-cells">
			<%for (var i = 0; i < datas.length; i++){%>
	        	<%:=cellTpl({"data":datas[i]})%>
	        <%}%>
	    </div>
	</script>

	<script id="cellTpl2" type="text/html">
			<div class="weui-cell weui-cell_swiped">
				<div class="weui-cell__bd">
					<div class="weui-cell item" data-id="<%=data.studentId%>">
						<div class="weui-cell__bd">
							<div class="weui-flex">
					            <div class="weui-flex__item"><%=data.schoolName%></div>
					            <div class="weui-flex__item"><%=data.username%></div>
					            <div class="weui-flex__item phase_name"><%=data.phaseName%></div>
					        </div>
						</div>
						<div class="weui-cell__ft"></div>
					</div>
				</div>
				<div class="weui-cell__ft">
					<%if(data.phase != 9){%>
						<a class="weui-swiped-btn weui-swiped-btn_default reach_btn" href="javascript:" data-id="<%=data.studentId%>">达标</a>
					<%}%>
					<a class="weui-swiped-btn weui-swiped-btn_warn del_btn" href="javascript:" data-id="<%=data.studentId%>">删除</a>
				</div>
			</div>
		</script>


		<script id="cellTpl1" type="text/html">
			<div class="weui-cell weui-cell_swiped">
				<div class="weui-cell__bd">
					<div class="weui-cell item" data-id="<%=data.studentId%>">
						<div class="weui-cell__bd">
							<div class="weui-flex">
					            <div class="weui-flex__item"><%=data.schoolName%></div>
					            <div class="weui-flex__item"><%=data.username%></div>
					            <div class="weui-flex__item"><%=data.mobile%></div>
					        </div>
						</div>
						<div class="weui-cell__ft"></div>
					</div>
				</div>
				<div class="weui-cell__ft">
					<a class="weui-swiped-btn weui-swiped-btn_warn del_btn" href="javascript:" data-id="<%=data.studentId%>">删除</a>
				</div>
			</div>
		</script>	


	<script type="text/javascript">
	$(function(){
		var curStage = location.hash ? location.hash.substring(1) : "2";
		function render(dataInfos, stage){
			if(dataInfos.length){
				var tpl = template(document.getElementById('dataLst').innerHTML);
    			var cellTpl = template(document.getElementById(stage == 2 ? 'cellTpl2':'cellTpl1').innerHTML);
    			$("#container").html(tpl({"cellTpl":cellTpl, "datas":dataInfos}))
			} else {
				$("#container").html(template(document.getElementById('empty').innerHTML, {}));
			}
			$('.weui-cell_swiped').swipeout();
		}

		function load(stage){
			$("#container").html(template(document.getElementById('loading').innerHTML, {}));
			$.getJSON("/teacher/student/train/" + stage + "/data.json").done(function(res){
	        	if(res.code == '0'){
	                render(res.data, stage);
	            } else {
	                $.toast(res.msg, "cancel");
	            }
	        }).fail(function() {
				$("#container").html(template(document.getElementById('error').innerHTML, {}));
	  		});
		}

		function navbarFun(_this){
			if(!_this.hasClass("weui-bar__item_on")){
				var stage = _this.data("id");
				$(".weui-navbar__item").removeClass("weui-bar__item_on");
				_this.addClass("weui-bar__item_on");
				curStage = stage;
				$("#addBtn").attr("href", "/teacher/student/train/" + stage + "/add");
				load(stage);
			}
		}

		$(".weui-navbar__item").click(function(){
			navbarFun($(this));
		});

		navbarFun($('.weui-navbar__item[data-id="' + curStage + '"]'));


        $("body").on("click", ".item", function(){
  			 	location.href = "/teacher/student/info/" + $(this).data("id");
  			}).on("click", ".del_btn", function(){
  				var _this = $(this);
  				$.actions({
				  actions: [{
				    text: "确认删除",
				    className: "color-danger",
				    onClick: function() {
				      	$.singleDelete(_this, "/teacher/student/train/" + curStage + "/" + _this.data("id")).done(function(res){
  							res.code == "0" && _this.parents(".weui-cell_swiped").remove();
  						});
				    }
				  }]
				});
  			}).on("click", ".reach_btn", function(){
  				var _this = $(this);
  				$.actions({
				  actions: [{
				    text: "确认达标",
				    className: "color-primary",
				    onClick: function() {
				      $.singlePut(_this, "/teacher/student/train/2/" + _this.data("id") + "/reach").done(function(res){
		  					if(res.code == "0"){
		  						if(res.data.phase == "9"){
									_this.parents(".weui-cell_swiped").remove();
		  						} else {
		  							_this.parents(".weui-cell_swiped").find(".phase_name").text(res.data.phaseName);
		  							$('.weui-cell_swiped').swipeout('close');
		  						}
		  					}
  						});
				    }
				  }]
				});
  			});
	});
	</script>
</body>
</html>



 