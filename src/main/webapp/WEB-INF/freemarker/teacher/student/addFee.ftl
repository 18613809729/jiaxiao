
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>学员信息</title>
	<link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/1.1.2/weui.min.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
	<link rel="stylesheet" href="https://static.xxwkj.club/jiaxiao/css/main.css">
	
</head>
<body ontouchstart>
	<div class="page" id="container">
		<div class="weui-cells">
	   		<div class="weui-cell">
				<div class="weui-cell__hd">
					<img src="${info.user.headImg!"https://static.newbs.xyz/jiaxiao/image/default_head_img.jpg"}" width="60px">
				</div>
				<div class="weui-cell__bd">
					<p>&nbsp;&nbsp;${info.username}</p>
					<#if info.user??>
						<p class="sub_content">&nbsp;&nbsp;${info.user.nickName}</p>
					</#if>
				</div>
				<div class="weui-cell__ft">
				</div>
			</div>
   		</div>

	   	<div class="weui-cells__title">缴费信息（金额/日期/方式）</div>
		<div class="weui-cells">
			<#list feeLst as fee>
		   		<div class="weui-cell">
					<div class="weui-cell__bd">
						<div class="weui-flex">
	            			<div class="weui-flex__item">${fee.money?string('#.##')}</div>
	            			<div class="weui-flex__item">${fee.payDate}</div>
	            			<div class="weui-flex__item"><#if fee.payType == "1" >初始录入<#else> 后续添加 </#if></div>
        				</div>
					</div>
					<div class="weui-cell__ft">
					</div>
				</div>
			</#list>
		</div>
		
		<div class="weui-cells">
			<div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label" for="signDate">缴费日期</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" name="payDate" type="text" required data-toggle='date' id="date" placeholder="请输入缴费日期">
                </div>
            </div>
			<div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">缴费金额</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" value="${(info.totalFee - payFee)?string('#.##')}" name="money" type="number" required min="0" max="20000" step="0.01" placeholder="请输入金额" maxlength="7">
                </div>
            </div>
            <a href="javascript:void(0);" class="weui-cell weui-cell_link">
                <div class="weui-cell__bd">学费：${info.totalFee?string('#.##')},&nbsp; &nbsp;已缴：${payFee?string('#.##')},&nbsp; &nbsp;待缴：${(info.totalFee - payFee)?string('#.##')}</div>
            </a>
         </div>
          
	   	<br>
	   	<div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" href="javascript:;" id="submitBtn"><i></i>确定</a>
		</div>
	   	<br>
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/city-picker.min.js"></script>
	<script src="https://cdn.bootcss.com/fastclick/1.0.6/fastclick.js"></script>
	<script src="https://static.xxwkj.club/jiaxiao/js/template.js"></script>
	<script type="text/javascript" src="https://static.xxwkj.club/jiaxiao/js/main.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#date").calendar({"dateFormat":'yyyy-mm-dd'});

			$("#submitBtn").click(function(){
				var _this = $(this);
				var money = $('[name="money"]').val();
				var payDate = $('[name="payDate"]').val();
			  	$.confirm('确定要给<span class="font_warn">${info.username}</span>缴纳<span class="font_warn">' + money + '</span>元?', "确认缴费?", function() {
		         	$.singlePost(_this, "/teacher/student/info/${info.id}/fee", {"money":money, "payDate":payDate}).done(function(res){
		         		if(res.code == "0"){
		         			 $.toSuccess({
                                "title":"缴费成功",
                                "primary_btn_msg":"确定",
                                "primary_btn_url":"/teacher/student/info/${info.id}",
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