
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

	   		<a class="weui-cell">
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
			
			<a class="weui-cell" >
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
			
			<div class="weui-cell" id="certNo">
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
			
	   	<#if seller?? >
	   		<div class="weui-cell" href="javascript:;">
				<div class="weui-cell__bd">
					推荐人
				</div>
				<div class="weui-cell__ft">
					${seller.username} &nbsp;&nbsp;
				</div>
			</div>
	   	</#if>
			
	   	</div>

	   	<div class="weui-cells__title">缴费信息（日期/金额）</div>
		<div class="weui-cells">
			<#list feeLst as fee>
		   		<div class="weui-cell">
					<div class="weui-cell__bd">
						<div class="weui-flex">
							<div class="weui-flex__item">${fee.payDate}</div>
	            			<div class="weui-flex__item">${fee.money?string('#.##')}</div>
        				</div>
					</div>
					<div class="weui-cell__ft">
					</div>
				</div>
			</#list>
		</div>

		<#if examInfos ?? && (examInfos?size > 0) >
		<div class="weui-cells__title">考试信息</div>
		<div class="weui-cells">
			<#list examInfos as examInfo>
		   		<div class="weui-cell">
					<div class="weui-cell__bd">
						<div class="weui-flex">
							<div class="weui-flex__item">${examInfo.exam.examDate}</div>
							<div class="weui-flex weui-flex__item">
								<div class="weui-flex__item">${examInfo.exam.stageName}</div>
			            		<div class="weui-flex__item">
			            			<#if examInfo.status == "1"> 
										<span class="font_green">已通过</span> 
									<#elseif examInfo.status == "0"> 
										<span class="font_warn">未通过</span> 
									</#if>
								</div>
							</div>
	            			
        				</div>
					</div>
					<div class="weui-cell__ft">
					</div>
				</div>
			</#list>
		</div>
		</#if>
		<br>
		<div class="weui-btn-area">
			<a href="javascript:;" class="weui-btn weui-btn_primary" id="shareBtn"><i></i>邀请好友</a>
		</div>
	   	<br>
	</div>
	<#include "/common.ftl">
</body>
</html>