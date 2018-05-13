<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>驾校简介</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page">
		<div class="swiper-container" data-space-between='10' data-pagination='.swiper-pagination' data-autoplay="1000">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><img src="//static.xxwkj.club/jiaxiao/image/upload/hornor.jpg" width="100%" height="200px"></div>
				<div class="swiper-slide"><img src="//static.xxwkj.club/jiaxiao/image/upload/aixin.jpg" width="100%" height="200px"></div>
				<div class="swiper-slide"><img src="//static.xxwkj.club/jiaxiao/image/upload/peixun.jpg" width="100%" height="200px"></div>
			</div>
			<div class="swiper-pagination"></div>
		</div>
		<article class="weui-article">
            <section>
            	<h2 class="title" style="font-weight: bold;">团队简介</h2>
                <section>
                	${sytdjj}
                </section>
            </section>

            <section>
                <h2 class="title" style="font-weight: bold;">招生特色</h2>
                <section>
                    ${syzsts}
                </section>
            </section>

             <section>
                <h2 class="title" style="font-weight: bold;">管理方式</h2>
                <section>
                    ${syglfs}
                </section>
            </section>

             <section>
                <h2 class="title" style="font-weight: bold;">联系方式</h2>
                <section>
                    ${sylxfs}
                </section>
            </section>

            <div class="weui-btn-area">
            	<a class="weui-btn weui-btn_primary" href="/student/join">立即报名</a>
        	</div>
        	<br>
        </article>
	</div>
	<#include "/common.ftl">
	<script type="text/javascript">
		$(".swiper-container").swiper({});
	</script>
</body>
</html>