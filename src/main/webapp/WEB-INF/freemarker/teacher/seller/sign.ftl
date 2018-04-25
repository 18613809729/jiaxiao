<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>学员登记</title>
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
                    <div class="weui-cell__hd"><label class="weui-label" for="parentId">分销员</label></div>
                    <div class="weui-cell__bd">
                        <input type="hidden" name="parentId">
                        <input class="weui-input" type="text" id="sellerInput" placeholder="分销员(选填)" readonly>
                    </div>
                </div>
            </div>
            </form>
        <div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" id="submit"><i></i>确定</a>
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
                    $.singlePost(_btn, "/teacher/seller/sign", data).done(function(res){
                        if(res.code == '0'){
                            $.toSuccess({
                            "title":"添加成功",
                            "primary_btn_url":"index",
                            "default_btn_msg":"继续添加",
                            "default_btn_url":"javascript:location.reload();"
                            })
                        } else {
                            $.toast(res.msg, "cancel");
                        }
                    });
            	});
            });
            var sellerLst;
            $.getJSON("/seller/parent.json").done(function(res){
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