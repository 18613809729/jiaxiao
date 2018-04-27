<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>预约报名</title>
	<#include "/head.ftl">
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
                    <div class="weui-cell__hd"><label class="weui-label" for="sellerId">分销员</label></div>
                    <div class="weui-cell__bd">
                        <input type="hidden" name="sellerId" value="${seller.id}">
                        <input class="weui-input" type="text" id="sellerInput" placeholder="分销员(选填)" <#if seller??> value="${seller.username}  ${seller.mobile}"</#if> readonly>
                    </div>
                </div>
                <a href="javascript:;" class="weui-cell weui-cell_link">
                    <div class="weui-cell__bd">预约成功，客服将会尽快联系您，<span class="font_warn">请确保手机号正确</span></div>
                </a>
            </div>
            </form>
        <div class="weui-btn-area">
			<a href="javascript:;" class="weui-btn weui-btn_primary" id="submit"><i></i>报名</a>
		</div>
		<br>
	</div>
	<#include "/common.ftl">
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
                    $('[name="sellerId"]').val(data.id);
                    $("#sellerInput").val(data.username + "  " + data.mobile);
                }});
            });
        });
	</script>
</body>
</html>