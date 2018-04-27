<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>学员管理</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page">
		<div class="page__bd height100">
			<div class="weui-tab">
				<div class="weui-tab__panel">

				<div class="weui-cells__title">学员统计</div>
					<div class="weui-cells">
						<div class="weui-cell">
			                <div class="weui-cell__bd">
			                    <p>学车中</p>
			                </div>
			                <div class="weui-cell__ft">${inlearnCount}人</div>
			            </div>
			            <div class="weui-cell">
			                <div class="weui-cell__bd">
			                    <p>历史总数</p>
			                </div>
			                <div class="weui-cell__ft">${studentCount}人</div>
			            </div>
			        </div>

					<div class="weui-cells">
						<a class="weui-cell weui-cell_access" href="/teacher/student/join/list">
							<div class="weui-cell__bd">
								<span>报名预约</span>
								<#if (unReadSignStudentCount > 0) >
									<#if unReadSignStudentCount < 100>
										<span class="weui-badge">${unReadSignStudentCount}</span>
									<#else>
										<span class="weui-badge weui-badge_dot"></span>
									</#if>
								</#if>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>
						<a class="weui-cell weui-cell_access" href="sign">
							<div class="weui-cell__bd">
								<p>学员登记</p>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>

						<a class="weui-cell weui-cell_access" href="/teacher/student/retrieve">
							<div class="weui-cell__bd">
								<p>学员查询</p>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>

						<a class="weui-cell weui-cell_access" href="/teacher/student/exam/interval">
							<div class="weui-cell__bd">
								<p>考试间隔</p>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>
					</div>

					<div class="weui-cells">
						<a class="weui-cell weui-cell_access" href="/teacher/student/train/index">
							<div class="weui-cell__bd">
								<span>每日训练</span>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>
						<a class="weui-cell weui-cell_access" href="/teacher/student/exam/index">
							<div class="weui-cell__bd">
								<p>预约考试</p>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>

						<a class="weui-cell weui-cell_access" href="/teacher/student/exam/history">
							<div class="weui-cell__bd">
								<p>参加考试</p>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>
					</div>

					<br>
				</div>
			</div>

			<div class="weui-tabbar">
				<a href="javascript:;" class="weui-tabbar__item weui-bar__item_on">
					<img src="https://static.xxwkj.club/jiaxiao/image/icon_tabbar.png" alt="" class="weui-tabbar__icon">
					<p class="weui-tabbar__label">学员</p>
				</a>
				<a href="/teacher/seller/index" class="weui-tabbar__item">
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