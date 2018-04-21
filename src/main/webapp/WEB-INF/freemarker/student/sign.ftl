<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>预约报名</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="http://localhost/jiaxiao/css/main.css">
</head>
<body ontouchstart>
	<div class="page">
        <form id="signForm">
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="username">姓名</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="username" type="text" placeholder="请输入姓名" required minlength="2" maxlength_="6" validate="chinese">
                    </div>
                </div>
     			<div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="mobile">手机号</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="mobile" type="number" required validate="mobile" placeholder="请输入手机号" maxlength="11">
                    </div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="parentId">分销员</label></div>
                    <div class="weui-cell__bd">
                        <input type="hidden" name="parentId" value="${seller.id}">
                        <input class="weui-input" type="text" id="sellerInput" placeholder="分销员(选填)" <#if seller??> value="${seller.username}  ${seller.mobile}"</#if> readonly>
                    </div>
                </div>
                <a href="javascript:void(0);" class="weui-cell weui-cell_link">
                    <div class="weui-cell__bd">预约成功，客服将会尽快联系您，<span class="font_warn">请确保手机号正确</span></div>
                </a>
            </div>
            </form>
        <div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" id="submit"><i></i>报名</a>
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
                    $.singlePost(_btn, "/student/join", data).done(function(res){
                        if(res.code == '0'){
                            $.toSuccess({
                            "title":"申请成功",
                            "desc":"请耐心等候客服人员联系",
                            "primary_btn_url":"index"
                            })
                        } else {
                        	//TODO 数据重复处理
                            $.toast(res.msg, "cancel");
                        }
                    });
            	});
            });
            var sellerLst;
            $.getJSON("/seller/valid.json").done(function(res){
            	 if(res.code == '0'){
                    sellerLst = res.data;
                } else {
                    $.toast(res.msg, "cancel");
                }
            });

            $("#sellerInput").on("click", function(){
                if(sellerLst == undefined){
                    $.toast("分销员信息加载失败，请刷新重试", "cancel");
                    return;
                }
                if(!sellerLst.length){
                 	$.toast("分销员不存在", "cancel");
                 	return;
                }
                $.searchDialog({"datas":sellerLst, "itemClickCallback":function(data){
                    $('[name="parentId"]').val(data.id);
                    $("#sellerInput").val(data.username + "  " + data.mobile);
                }});
            });
        });
	</script>
</body>
</html>