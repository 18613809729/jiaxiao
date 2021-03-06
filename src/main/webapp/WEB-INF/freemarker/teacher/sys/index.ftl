<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>系统管理</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page">
		<div class="page__bd height100">
			<div class="weui-tab">
				<div class="weui-tab__panel">

					<div class="weui-cells__title">公众号统计</div>
					<div class="weui-cells">
			            <div class="weui-cell">
			                <div class="weui-cell__bd">
			                    <p>关注总数</p>
			                </div>
			                <div class="weui-cell__ft">80人</div>
			            </div>
			            <div class="weui-cell">
			                <div class="weui-cell__bd">
			                    <p>今日关注</p>
			                </div>
			                <div class="weui-cell__ft">80人</div>
			            </div>
			            <div class="weui-cell">
			                <div class="weui-cell__bd">
			                    <p>今日取消关注</p>
			                </div>
			                <div class="weui-cell__ft">80人</div>
			            </div>
			        </div>

					<div class="weui-cells">
						<a class="weui-cell weui-cell_access" href="javascript:;">
							<div class="weui-cell__bd">
								<span>客户咨询</span><span class="weui-badge">8</span>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>
						<a class="weui-cell weui-cell_access" href="javascript:;">
							<div class="weui-cell__bd">
								<p>发送公告</p>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>

						<a class="weui-cell weui-cell_access" href="javascript:;">
							<div class="weui-cell__bd">
								<p>自动回复</p>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>

						<a class="weui-cell weui-cell_access" href="/teacher/sys/content">
							<div class="weui-cell__bd">
								<p>首页编辑</p>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>
					</div>

					<div class="weui-cells__title">模拟</div>
					<div class="weui-cells">
			           <a class="weui-cell weui-cell_access" href="/seller/join">
							<div class="weui-cell__bd">
								<span>销售加盟</span>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>
						 <a class="weui-cell weui-cell_access" href="/student/join">
							<div class="weui-cell__bd">
								<span>预约报名</span>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>
			        </div>
			        <br>
				</div>
				<div class="weui-tabbar">
					<a href="/teacher/student/index" class="weui-tabbar__item">
						<img src="https://static.xxwkj.club/jiaxiao/image/icon_tabbar.png" alt="" class="weui-tabbar__icon">
						<p class="weui-tabbar__label">学员</p>
					</a>
					<a href="/teacher/seller/index" class="weui-tabbar__item">
						<img src="https://static.xxwkj.club/jiaxiao/image/icon_tabbar.png" alt="" class="weui-tabbar__icon">
						<p class="weui-tabbar__label">分销员</p>
					</a>
					<a href="javascript:;" class="weui-tabbar__item weui-bar__item_on">
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