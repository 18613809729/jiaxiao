
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>分销管理</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="https://static.xxwkj.club/jiaxiao/css/main.css">
</head>
<body ontouchstart>
	<div class="page">
		<div class="page__bd height100">
			<div class="weui-tab">
				<div class="weui-tab__panel">

					<div class="weui-cells__title">分销员统计</div>
					<div class="weui-cells">
			            <div class="weui-cell">
			                <div class="weui-cell__bd">
			                    <p>一级</p>
			                </div>
			                <div class="weui-cell__ft">${lv1Count}人</div>
			            </div>
			            <div class="weui-cell">
			                <div class="weui-cell__bd">
			                    <p>二级</p>
			                </div>
			                <div class="weui-cell__ft">${lv2Count}人</div>
			            </div>
			            <div class="weui-cell">
			                <div class="weui-cell__bd">
			                    <p>三级</p>
			                </div>
			                <div class="weui-cell__ft">${lv3Count}人</div>
			            </div>
			        </div>

					<div class="weui-cells">
						<a class="weui-cell weui-cell_access" href="commission">
							<div class="weui-cell__bd">
								<span>佣金设置</span>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>
						<a class="weui-cell weui-cell_access" href="sign">
							<div class="weui-cell__bd">
								<span>销售员登记</span>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>

						<a class="weui-cell weui-cell_access" href="join/list">
							<div class="weui-cell__bd">
								<span>推广报名</span>
								<#if (unReadCount > 0) >
									<#if unReadCount < 100>
										<span class="weui-badge">${unReadCount}</span>
									<#else>
										<span class="weui-badge weui-badge_dot"></span>
									</#if>
								</#if>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>
						<a class="weui-cell weui-cell_access" href="retrieve">
							<div class="weui-cell__bd">
								<p>销售查询</p>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>

						<a class="weui-cell weui-cell_access" href="fee/index">
							<div class="weui-cell__bd">
								<p>佣金结算</p>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>

						<a class="weui-cell weui-cell_access" href="fee/history/index">
							<div class="weui-cell__bd">
								<p>佣金历史</p>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>
					</div>
				</div>
				<div class="weui-tabbar">
					<a href="/teacher/student/index" class="weui-tabbar__item">
						<img src="https://static.xxwkj.club/jiaxiao/image/icon_tabbar.png" alt="" class="weui-tabbar__icon">
						<p class="weui-tabbar__label">学员</p>
					</a>
					<a href="javascript:;" class="weui-tabbar__item weui-bar__item_on">
						<img src="https://static.xxwkj.club/jiaxiao/image/icon_tabbar.png" alt="" class="weui-tabbar__icon">
						<p class="weui-tabbar__label">分销员</p>
					</a>
					<a href="/teacher/sys/index" class="weui-tabbar__item">
						<img src="https://static.xxwkj.club/jiaxiao/image/icon_tabbar.png" alt="" class="weui-tabbar__icon">
						<p class="weui-tabbar__label">系统</p>
					</a>
				</div>
			</div>
		</div>
	</div>
	<#include "/common.ftl">
</body>
</html>