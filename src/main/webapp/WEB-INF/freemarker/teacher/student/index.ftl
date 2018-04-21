<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>学员管理</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="http://localhost/jiaxiao/css/main.css">
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
			                <div class="weui-cell__ft">80人</div>
			            </div>
			            <div class="weui-cell">
			                <div class="weui-cell__bd">
			                    <p>历史总数</p>
			                </div>
			                <div class="weui-cell__ft">8000人</div>
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

						<a class="weui-cell weui-cell_access" href="javascript:;">
							<div class="weui-cell__bd">
								<p>学员查询</p>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>

						<a class="weui-cell weui-cell_access" href="javascript:;">
							<div class="weui-cell__bd">
								<p>缴费登记</p>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>
					</div>

					<div class="weui-cells">
						<a class="weui-cell weui-cell_access" href="xunlian.html">
							<div class="weui-cell__bd">
								<span>每日训练</span>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>
						<a class="weui-cell weui-cell_access" href="javascript:;">
							<div class="weui-cell__bd">
								<p>预约考试</p>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>

						<a class="weui-cell weui-cell_access" href="javascript:;">
							<div class="weui-cell__bd">
								<p>参加考试</p>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>
					</div>
				</div>
			</div>

			<div class="weui-tabbar">
				<a href="javascript:;" class="weui-tabbar__item weui-bar__item_on">
					<img src="https://static.newbs.xyz/common/image/icon_tabbar.png" alt="" class="weui-tabbar__icon">
					<p class="weui-tabbar__label">学员</p>
				</a>
				<a href="/teacher/seller/index" class="weui-tabbar__item">
					<img src="https://static.newbs.xyz/common/image/icon_tabbar.png" alt="" class="weui-tabbar__icon">
					<p class="weui-tabbar__label">分销员</p>
				</a>
				<a href="/teacher/sys/index" class="weui-tabbar__item">
					<img src="https://static.newbs.xyz/common/image/icon_tabbar.png" alt="" class="weui-tabbar__icon">
					<p class="weui-tabbar__label">系统</p>
				</a>
			</div>
		</div>
	</div>
</div>
	<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
    <script src="http://localhost/jiaxiao/js/main.js"></script>
</body>
</html>