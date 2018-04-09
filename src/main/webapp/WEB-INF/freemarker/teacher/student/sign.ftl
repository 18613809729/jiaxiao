<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>学员登记</title>
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
                    <div class="weui-cell__hd"><label class="weui-label" for="certNo">证件号</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="certNo" type="text" required validate="certNo" placeholder="请输入证件号" maxlength="18" uppercase>
                    </div>
                </div>

                <div class="weui-cell weui-cell_select weui-cell_select-after">
                    <div class="weui-cell__hd"><label class="weui-label">档位</label></div>
                    <div class="weui-cell__bd">
                        <select class="weui-select" name="driveType">
                            <option selected="" value="1">自动档</option>
                            <option value="0">手动档</option>
                        </select>
                    </div>
                </div>

                 <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="signDate">报名日期</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="signDate" type="text" required data-toggle='date' id="date" placeholder="请输入报名日期">
                    </div>
                </div>


      			<div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="totalFee">应缴学费</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="totalFee" type="number" required min="0" max="20000" step="0.01" placeholder="应缴学费" maxlength="7">
                    </div>
                </div>

    			<div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="payFee">实缴学费</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="payFee" type="number" required min="0" max="20000" step="0.01" placeholder="实缴学费" maxlength="7">
                    </div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="sellerId">分销员</label></div>
                    <div class="weui-cell__bd">
                        <input type="hidden" name="sellerId">
                        <input class="weui-input" type="text" id="sellerInput" placeholder="分销员(选填)" readonly>
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
            var form = $("#signForm").formValidate({"customCheck":function($elem, errorInfos){
                if($elem.attr("name") == "payFee"){
                    var payFee = $elem.val();
                    var totalFee = $('[name="totalFee"]').val();
                    if(payFee && totalFee && payFee > totalFee){
                        errorInfos.push({"dom":$elem, "errorMsg":"实缴学费应小于等于应缴学费"});
                        return false;
                    }
                }
                return true;
            }});
            $("#submit").click(function(){
            	var _btn = $(this);
        		form.validate(function(){
                    var data = $("#signForm").serialize();
                    $.singlePost(_btn, "/teacher/student/sign", data).done(function(res){
                        if(res.code == '0'){
                            $.toast('提交成功');
                        } else {
                            $.toast(res.msg, "cancel");
                        }
                    });
            	});
            });
            $("#date").calendar({"dateFormat":'yyyy-mm-dd'});
            var sellerLst;
            $.getJSON("/seller/valid.json").done(function(res){
              	sellerLst = res.data;
            });

            $("#sellerInput").on("click", function(){
                if(sellerLst == undefined){
                    $.toast("分销员信息加载失败，请刷新重试", "cancel");
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