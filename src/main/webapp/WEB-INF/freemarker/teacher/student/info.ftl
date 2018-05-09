
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>学员信息</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page" id="container">
		<div class="weui-cells">
	   		<div class="weui-cell">
				<div class="weui-cell__hd">
					<img src="${info.user.headImg!"https://static.xxwkj.club/jiaxiao/image/default_head_img.jpg"}" width="60px">
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

	   		<div class="weui-cell weui-cell_swiped">
				<div class="weui-cell__bd">
					<a class="weui-cell" id="username">
						<div class="weui-cell__bd">
							姓名
						</div>
						<div class="weui-cell__ft">
							${info.username}
						</div>
					</a>
				</div>
				<div class="weui-cell__ft action">
					<a class="weui-swiped-btn weui-swiped-btn_default" href="javascript:;" id="modifyUsername">修改</a>
				</div>
			</div>	   		
				
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
			
			<div class="weui-cell weui-cell_swiped">
				<div class="weui-cell__bd" id="mobile">
					<a class="weui-cell" >
						<div class="weui-cell__bd">
							手机号
						</div>
						<div class="weui-cell__ft">
							${info.mobile}<span style="color: #508CEE; margin-left: 10px;">复制</span>
						</div>
					</a>
				</div>
				<div class="weui-cell__ft action">
					<a class="weui-swiped-btn weui-swiped-btn_default" href="javascript:;" id="modifyMobile">修改</a>
				</div>
			</div>
			
			<div class="weui-cell">
				<div class="weui-cell__bd">
					地区
				</div>
				<div class="weui-cell__ft">
					${info.user.country}&nbsp;&nbsp;${info.user.province}&nbsp;&nbsp;${info.user.city}
				</div>
			</div>
			
			<div class="weui-cell" id="certNo">
				<div class="weui-cell__bd">
					证件号
				</div>
				<div class="weui-cell__ft">
					${info.certNo}<span style="color: #508CEE; margin-left: 10px;">复制</span>
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
	<#include "/common.ftl">
	<script type="text/javascript">
		$(function(){
			$("#modifyUsername").click(function(){
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

			$("#modifyMobile").click(function(){
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


			new Clipboard("#mobile", {
				text: function(trigger) {
					return '${info.mobile}';
				}
			}).on("success", function() {
				$.toast("复制成功");
			});

			new Clipboard("#certNo", {
				text: function(trigger) {
					return '${info.certNo}';
				}
			}).on("success", function() {
				$.toast("复制成功");
			})
		});


	</script>
</body>
</html>