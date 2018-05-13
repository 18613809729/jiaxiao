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
		<article class="weui-article">
            <section>
                <h3>编辑示例</h3>
                <p>
                    <span style="font-weight: bold;">1、段落标签：</span><span style="color: red;"> &lt;p&gt;</span>马云说：打破旧模式才能在新时代生存！因为消费者得到实惠，企业才有源源不断的发展动力！<span style="color: red;"> &lt;/p&gt;</span>
                </p>
                <p>
                    <span style="font-weight: bold;">2、段落字体颜色：</span>&lt;p <span style="color: red;">style="color: red;"</span> &gt;马云说：打破旧模式才能在新时代生存！因为消费者得到实惠，企业才有源源不断的发展动力！&lt;/p&gt;
                </p>
                <p style="color: red;" >马云说：打破旧模式才能在新时代生存！因为消费者得到实惠，企业才有源源不断的发展动力！</p>
                <p>
                    <span style="font-weight: bold;">3、部分字体颜色：</span>&lt;p style="color: red;" &gt;马云说：<span style="color: red;">&lt;span style="color: green;"&gt;打破旧模式&lt;/span&gt;</span>才能在新时代生存！因为消费者得到实惠，企业才有源源不断的发展动力！&lt;/p&gt;
                </p>

                <p style="color: red;" >马云说：<span style="color: green;">打破旧模式</span>才能在新时代生存！因为消费者得到实惠，企业才有源源不断的发展动力！</p>

                <p>
                    <span style="font-weight: bold;">4、字体加粗：</span>&lt;p style="color: red;" &gt;马云说：&lt;span style="color: green;<span style="color: red;">font-weight: bold;</span>"&gt;打破旧模式&lt;/span&gt;才能在新时代生存！因为消费者得到实惠，企业才有源源不断的发展动力！&lt;/p&gt;
                </p>
                <p style="color: red;" >马云说：<span style="color: green;font-weight: bold;">打破旧模式</span>才能在新时代生存！因为消费者得到实惠，企业才有源源不断的发展动力！</p>
				<p>
                    <span style="font-weight: bold;">5、插入图片：</span>&lt;p style="color: red;" &gt;马云说：&lt;span style="color: green;font-weight: bold;"&gt;打破旧模式&lt;/span&gt;才能在新时代生存！因为消费者得到实惠，企业才有源源不断的发展动力！&lt;/p&gt;
                    <span style="color: red;">&lt;img src="//static.xxwkj.club/jiaxiao/image/upload/hornor.jpg" width="100%"&gt;</span>
                    <p style="color: red;" >马云说：<span style="color: green;font-weight: bold;">打破旧模式</span>才能在新时代生存！因为消费者得到实惠，企业才有源源不断的发展动力！</p> <img src="//static.xxwkj.club/jiaxiao/image/upload/hornor.jpg" width="100%">
                </p>
            </section>
            <section>
                <div class="weui-btn-area">
                    <a href="javascript:history.back();" class="weui-btn weui-btn_primary" id="addMore">我知道了</a>
                </div>
            </section>
        </article>        
	</div>
	<#include "/common.ftl">
</body>
</html>