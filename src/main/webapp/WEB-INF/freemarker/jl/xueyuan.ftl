<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>WeUI</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<style type="text/css">
		body,html{height:100%;-webkit-tap-highlight-color:transparent}
		body{font-family:-apple-system-font,Helvetica Neue,Helvetica,sans-serif}
		.container, .page {
			position: absolute;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
		}
		.container {
			overflow: hidden;
		}
		.page, body {
			background-color: #f8f8f8;
		}
		.height100{
			height: 100%;
		}
		.weui-cell__bd span{
			vertical-align: middle;
		}
		.weui-cell__bd .weui-badge{
			margin-left: 0.3rem;
		}
	</style>
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
			                    <p>历史总数</p>
			                </div>
			                <div class="weui-cell__ft">80人</div>
			            </div>
			            <div class="weui-cell">
			                <div class="weui-cell__bd">
			                    <p>学车中</p>
			                </div>
			                <div class="weui-cell__ft">800人</div>
			            </div>
			           
			        </div>

					<div class="weui-cells">
						<a class="weui-cell weui-cell_access" href="javascript:;">
							<div class="weui-cell__bd">
								<span>报名预约</span><span class="weui-badge">8</span>
							</div>
							<div class="weui-cell__ft">
							</div>
						</a>
						<a class="weui-cell weui-cell_access" href="javascript:;">
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
				<a href="fenxiao.html" class="weui-tabbar__item">
					<img src="https://static.newbs.xyz/common/image/icon_tabbar.png" alt="" class="weui-tabbar__icon">
					<p class="weui-tabbar__label">分销员</p>
				</a>
				<a href="gzh.html" class="weui-tabbar__item">
					<img src="https://static.newbs.xyz/common/image/icon_tabbar.png" alt="" class="weui-tabbar__icon">
					<p class="weui-tabbar__label">系统</p>
				</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="https://res.wx.qq.com/open/libs/weuijs/1.1.3/weui.min.js"></script>
<script type="text/javascript" src="https://static.newbs.xyz/common/js/zepto.min.js"></script>
</body>
</html>