
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>销售员信息</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="http://localhost/jiaxiao/css/main.css">
	
</head>
<body ontouchstart>
	<div class="page" id="container">
		<div class="weui-cells">
	   		<div class="weui-cell">
				<div class="weui-cell__hd">
					<img src="${info.user.headImg!"https://static.newbs.xyz/jiaxiao/image/default_head_img.jpg"}" width="60px">
				</div>
				<div class="weui-cell__bd">
					<p>&nbsp;&nbsp;${info.username}</p>
					<#if info.user??>
						<p class="sub_content">&nbsp;&nbsp;${info.user.nickName}</p>
					</#if>
				</div>
				<div class="weui-cell__ft">
				</div>
			</div>
   		</div>
		
		<div class="weui-cells__title">基本信息</div>
	   	<div class="weui-cells">
	   		<a class="weui-cell weui-cell_access" id="username">
				<div class="weui-cell__bd">
					姓名
				</div>
				<div class="weui-cell__ft">
					${info.username}
				</div>
			</a>
				
			<div class="weui-cell">
				<div class="weui-cell__bd">
					性别
				</div>
				<div class="weui-cell__ft">
					<#if info.user.sex == 1>
						男
					<#elseif info.user.sex == 2>
						女
					<#else>
						
					</#if>
				</div>
			</div>
			
			<a class="weui-cell weui-cell_access" id="mobile">
				<div class="weui-cell__bd">
					手机号
				</div>
				<div class="weui-cell__ft">
					${info.mobile}
				</div>
			</a>
			
			<div class="weui-cell">
				<div class="weui-cell__bd">
					地区
				</div>
				<div class="weui-cell__ft">
					${info.user.country}&nbsp;&nbsp;${info.user.province}&nbsp;&nbsp;${info.user.city}
				</div>
			</div>
		</div>
		<div class="weui-cells__title">其他信息</div>
	   	<div class="weui-cells">
	   		
	   		<a class="weui-cell weui-cell_access" id="status">
				<div class="weui-cell__bd">
					状态
				</div>
				<div class="weui-cell__ft">
					<#if info.status == "1">
						有效
					<#else>
						无效
					</#if>
				</div>
			</a>

			<div class="weui-cell">
				<div class="weui-cell__bd">
					销售等级
				</div>
				<div class="weui-cell__ft">
					<#if info.level == 1>
						一级
					<#elseif info.user.sex == 2>
						二级
					<#else>
						三级
					</#if>
				</div>
			</div>
			
			<#if parent??>
				<a class="weui-cell weui-cell_access" href="/teacher/seller/info/${parent.id}">
					<div class="weui-cell__bd">
						上级销售
					</div>
					<div class="weui-cell__ft">
						${parent.username}
					</div>
				</a>
			</#if>
			
			

			<div class="weui-cell">
				<div class="weui-cell__bd">
					加入时间
				</div>
				<div class="weui-cell__ft">
					${createdTime}
				</div>
			</div>
			
			<div class="weui-cell">
				<div class="weui-cell__bd">
					来源
				</div>
				<div class="weui-cell__ft">
					<#if info.status == "1">
						申请
					<#else>
						录入
					</#if>
				</div>
			</div>
			<a href="/teacher/seller/info/history/fee/paied/${info.id}" class="weui-cell weui-cell_link weui-cell_access">
                <div class="weui-cell__bd">佣金历史</div>
                <div class="weui-cell__ft"></div>
            </a>
            <a href="/teacher/seller/info/history/fee/${info.id}" class="weui-cell weui-cell_link weui-cell_access">
                <div class="weui-cell__bd">佣金记录</div>
                <div class="weui-cell__ft"></div>
            </a>
            <a href="javascript:void(0);" class="weui-cell weui-cell_link weui-cell_access">
                <div class="weui-cell__bd">销售历史</div>
                <div class="weui-cell__ft"></div>
            </a>
	   	</div>
	   	
	   	<#if childrenSellers?? >
	   		<div class="weui-cells__title">下级销售</div>
	   		<div class="weui-cells">
	   		<#list childrenSellers as child>
		   		<a class="weui-cell weui-cell_access" href="/teacher/seller/info/${child.id}">
					<div class="weui-cell__bd">
						${child.username}
					</div>
					<div class="weui-cell__ft">
						${child.mobile}
					</div>
				</a>
			</#list>
		   	</div>
	   	</#if>
	   	<div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" href="javascript:history.back();"><i></i>确定</a>
		</div>
	   	<br>
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/city-picker.min.js"></script>
	<script src="https://cdn.bootcss.com/fastclick/1.0.6/fastclick.js"></script>
	<script src="http://localhost/jiaxiao/js/template.js"></script>
	<script type="text/javascript" src="http://localhost/jiaxiao/js/main.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#username").click(function(){
				$.prompt({
				  title: '修改姓名',
				  text: '',
				  input: '${info.username}',
				  empty: false, // 是否允许为空
				  onOK: function (input) {
				  	if(!/^[\u4E00-\u9FA5\uf900-\ufa2d]{2,8}$/.test(input)){
				  		$.toast("姓名格式错误", "cancel");
				  		return false;
				  	}

			  		input != "${info.username}" && $.singlePut($(this), "/teacher/seller/info/${info.id}", {"username":input}).done(function(res){
			  			res.code == "0" && location.reload();
			  		});
				  }
				});
			});

			$("#mobile").click(function(){
				$.prompt({
				  title: '修改手机号',
				  text: '',
				  input: '${info.mobile}',
				  empty: false, // 是否允许为空
				  onOK: function (input) {
				    if(!/^1\d{10}$/.test(input)){
				  		$.toast("手机号格式错误", "cancel");
				  		return false;
				  	}

			  		input != "${info.mobile}" && $.singlePut($(this), "/teacher/seller/info/${info.id}", {"mobile":input}).done(function(res){
			  			res.code == "0" && location.reload();
			  		});
				  }
				});
			});

			$("#status").click(function(){
				if('${info.status}' == '0'){
					$.confirm("确认将${info.username}置为有效?", function(){
						 $.singlePut($(this), "/teacher/seller/info/${info.id}", {"status":"1"}).done(function(res){
			  				res.code == "0" && location.reload();
			  			});
					});
				}else{
					$.confirm("确认将${info.username}置为失效,失效后其将不能获取佣金奖励?", "确认失效?", function(){
						 $.singlePut($(this), "/teacher/seller/info/${info.id}", {"status":"0"}).done(function(res){
			  				res.code == "0" && location.reload();
			  			});
					});
				} 
			});
		});
	</script>
</body>
</html>