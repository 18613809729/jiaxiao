
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>学员信息</title>
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
			
			<div class="weui-cell">
				<div class="weui-cell__bd">
					证件号
				</div>
				<div class="weui-cell__ft">
					${info.certNo}
				</div>
			</div>
		</div>
		<div class="weui-cells__title">学车信息</div>
	   	<div class="weui-cells">
			
			<div class="weui-cell">
				<div class="weui-cell__bd">
					驾校
				</div>
				<div class="weui-cell__ft">
					${school.name}
				</div>
			</div>
			
			<div class="weui-cell">
				<div class="weui-cell__bd">
					当前进度
				</div>
				<div class="weui-cell__ft">
					${stage}
				</div>
			</div>
			<#if info.stage == 2 && phase??  >
				<div class="weui-cell">
					<div class="weui-cell__bd">
						阶段
					</div>
					<div class="weui-cell__ft">
						${phase.desc}
					</div>
				</div>
			</#if>

			<div class="weui-cell">
				<div class="weui-cell__bd">
					车型
				</div>
				<div class="weui-cell__ft">
					<#if info.driveType == 0>
						手动档
					<#else>
						自动档
					</#if>
				</div>
			</div>
			
			<div class="weui-cell">
				<div class="weui-cell__bd">
					应缴学费
				</div>
				<div class="weui-cell__ft">
					${info.totalFee?string('#.##')}
				</div>
			</div>
			
			<div class="weui-cell">
				<div class="weui-cell__bd">
					实缴学费
				</div>
				<div class="weui-cell__ft">
					${payFee?string('#.##')}
				</div>
			</div>
			
			<div class="weui-cell">
				<div class="weui-cell__bd">
					报名时间
				</div>
				<div class="weui-cell__ft">
					${info.signDate}
				</div>
			</div>

			<div class="weui-cell">
				<div class="weui-cell__bd">
					添加时间
				</div>
				<div class="weui-cell__ft">
					${createdTime}
				</div>
			</div>
			
	   	<#if seller?? >
	   		<a class="weui-cell weui-cell_access" href="/teacher/seller/info/${seller.id}">
				<div class="weui-cell__bd">
					销售员
				</div>
				<div class="weui-cell__ft">
					${seller.username} &nbsp;&nbsp;
				</div>
			</a>
	   	</#if>
			
	   	</div>

	   	<div class="weui-cells__title">缴费信息（金额/日期/方式）</div>
		<div class="weui-cells">
			<#list feeLst as fee>
		   		<div class="weui-cell">
					<div class="weui-cell__bd">
						<div class="weui-flex">
	            			<div class="weui-flex__item">${fee.money?string('#.##')}</div>
	            			<div class="weui-flex__item">${fee.payDate}</div>
	            			<div class="weui-flex__item"><#if fee.payType == "1" >初始录入<#else> 后续添加 </#if></div>
        				</div>
					</div>
					<div class="weui-cell__ft">
					</div>
				</div>
			</#list>
		</div>
	   	<br>
	   	<div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" href="javascript:history.back();"><i></i>确定</a>
			<#if needPay>
				<a class="weui-btn weui-btn_default" href="/teacher/student/info/${info.id}/fee"><i></i>缴费</a>
			</#if>
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

			  		input != "${info.username}" && $.singlePut($(this), "/teacher/student/info/${info.id}", {"username":input}).done(function(res){
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

			  		input != "${info.mobile}" && $.singlePut($(this), "/teacher/student/info/${info.id}", {"mobile":input}).done(function(res){
			  			res.code == "0" && location.reload();
			  		});
				  }
				});
			});
		});
	</script>
</body>
</html>