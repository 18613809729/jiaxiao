<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>每日训练</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="http://localhost/jiaxiao/css/main.css">
</head>
<body ontouchstart>
	<div class="page">
		<div class="weui-tab">
				<div class="weui-navbar">
					<a class="weui-navbar__item <#if stage=="1">weui-bar__item_on</#if>" href="/teacher/student/train/1">
						科目一
					</a>
					<a class="weui-navbar__item <#if stage=="2">weui-bar__item_on</#if>" href="/teacher/student/train/2">
						科目二
					</a>
					<a class="weui-navbar__item <#if stage=="3">weui-bar__item_on</#if>" href="/teacher/student/train/3">
						科目三
					</a>
					<a class="weui-navbar__item <#if stage=="4">weui-bar__item_on</#if>" href="/teacher/student/train/4">
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
						<a href="/teacher/student/train/${stage}/add" class="weui-btn weui-btn_primary">添加学员</a>
					</div>
				</div>
			</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/city-picker.min.js"></script>
	<script src="https://cdn.bootcss.com/fastclick/1.0.6/fastclick.js"></script>
	<script src="http://localhost/jiaxiao/js/template.js"></script>
	<script type="text/javascript" src="http://localhost/jiaxiao/js/main.js"></script>
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
	
	<script id="dataLst" type="text/html">
		<div class="weui-cells__title"></div>
		<div class="weui-cells">
			<%for (var i = 0; i < datas.length; i++){%>
	        	<%:=cellTpl({"data":datas[i]})%>
	        <%}%>
	    </div>
	</script>

	<#if stage=="2">
		<script id="cellTpl" type="text/html">
			<div class="weui-cell weui-cell_swiped">
				<div class="weui-cell__bd">
					<div class="weui-cell">
						<div class="weui-cell__bd">
							<div class="weui-flex">
					            <div class="weui-flex__item"><%=data.schoolName%></div>
					            <div class="weui-flex__item"><%=data.username%></div>
					            <div class="weui-flex__item"><%=data.phaseName%></div>
					        </div>
						</div>
						<div class="weui-cell__ft"></div>
					</div>
				</div>
				<div class="weui-cell__ft">
					<a class="weui-swiped-btn weui-swiped-btn_warn" href="javascript:">删除</a>
					<a class="weui-swiped-btn weui-swiped-btn_default" href="javascript:">达标</a>
				</div>
			</div>
		</script>
	<#else>
		<script id="cellTpl" type="text/html">
			<div class="weui-cell weui-cell_swiped">
				<div class="weui-cell__bd">
					<div class="weui-cell">
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
					<a class="weui-swiped-btn weui-swiped-btn_warn" href="javascript:">删除</a>
				</div>
			</div>
		</script>
	</#if>
	


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
			$('.weui-cell_swiped').swipeout();
		}
		
		$.getJSON("/teacher/student/train/${stage}/data.json").done(function(res){
        	if(res.code == '0'){
                render(res.data);
            } else {
                $.toast(res.msg, "cancel");
            }
        }).fail(function() {
			$("#container").html(template(document.getElementById('error').innerHTML, {}));
  		});

        $("body").on("click", ".item", function(){
  			 	location.href = "/teacher/student/join/info/" + $(this).data("id");
  			}).on("click", ".del_btn", function(){
  				var _this = $(this);
  				$.singleDelete(_this, "/teacher/student/join/info/" + _this.parents("[data-id]").data("id")).done(function(res){
  					res.code == "0" && _this.parents("[data-id]").remove();
  				});
  			});
	});
	</script>
</body>
</html>



 