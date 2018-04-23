<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>考试间隔</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="http://localhost/jiaxiao/css/main.css">
</head>
<body ontouchstart>
	<div class="page">
        <form id="signForm">
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="interval1">科目一</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="interval1" placeholder="科目一间隔" required type="number" min="0" step="1" max="99" value="${interval.interval1}">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="interval2">科目二</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="interval2" placeholder="科目二间隔" required type="number" min="0" max="99" step="1" value="${interval.interval2}">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="interval3">科目三</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="interval3" placeholder="科目三间隔" required type="number" min="0" max="99" step="1" value="${interval.interval3}">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="interval4">科目四</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="interval4" placeholder="科目四间隔" required type="number" min="0" max="99" step="1" value="${interval.interval4}">
                    </div>
                </div>
     		</div>
        </form>
        <div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" id="submit"><i></i>确定</a>
		</div>
	</div>


	<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/city-picker.min.js"></script>
    <script src="https://cdn.bootcss.com/mootools/1.6.0/mootools-core.min.js"></script>
    <script src="http://localhost/jiaxiao/js/pinyin.js"></script>
    <script src="http://localhost/jiaxiao/js/formValidate.js"></script>
    <script src="http://localhost/jiaxiao/js/search.js"></script>
    <script src="http://localhost/jiaxiao/js/main.js"></script>
	<script type="text/javascript">
	 	$(function(){
            var form = $("#signForm").formValidate({});
            $("#submit").click(function(){
            	var _btn = $(this);
        		form.validate(function(){
                    var data = $("#signForm").serialize();
                    $.singlePut(_btn, "/teacher/student/exam/interval", data).done(function(res){
                        if(res.code == '0'){
                            $.toSuccess({
                                "title":"考试间隔设置成功",
                                "primary_btn_msg":"确定",
                                "primary_btn_url":"/teacher/student/index"
                            });
                        } else {
                            $.toast(res.msg, "cancel");
                        }
                    });
            	});
            });
        });
	</script>
</body>
</html>