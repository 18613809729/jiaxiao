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
                    <div class="weui-cell__hd"><label class="weui-label" for="certNo">证件号</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" name="certNo" type="text" required validate="certNo" placeholder="请输入证件号" maxlength="18" uppercase>
                    </div>
                </div>

                <div class="weui-cell weui-cell_select weui-cell_select-after">
                    <div class="weui-cell__hd"><label class="weui-label">档位</label></div>
                    <div class="weui-cell__bd">
                        <select class="weui-select" name="driveType">
                            <option  value="1">自动档</option>
                            <option selected="selected" value="0">手动档</option>
                        </select>
                    </div>
                </div>

                <div class="weui-cell weui-cell_select weui-cell_select-after">
                    <div class="weui-cell__hd"><label class="weui-label" for="schoolId">驾校</label></div>
                    <div class="weui-cell__bd">
                        <select class="weui-select" name="schoolId" required>
                        </select>
                    </div>
                </div>
                <a href="javascript:void(0);" id="addSchool" class="weui-cell weui-cell_link">
                    <div class="weui-cell__bd">添加驾校&gt;&gt;</div>
                </a>

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
                        <input class="weui-input" name="payFee" type="number" min="0" max="20000" step="0.01" placeholder="实缴学费" maxlength="7">
                    </div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label" for="sellerId">分销员</label></div>
                    <div class="weui-cell__bd">
                        <input type="hidden" name="sellerId">
                        <input class="weui-input" type="text" id="sellerInput" placeholder="分销员(选填)" readonly>
                    </div>
                    <div class="weui-cell__ft" id="clearSellerId">
                        <i class="weui-icon-cancel"></i>
                    </div>
                </div>
            </div>
            </form>
        <div class="weui-btn-area">
			<a href="javascript:;" class="weui-btn weui-btn_primary" id="submit"><i></i>确定</a>
		</div>
		<br>
	</div>

	<#include "/common.ftl">
    
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
                            $.toSuccess({
                                "title":"登记成功",
                                "primary_btn_msg":"查看信息",
                                "primary_btn_url":"/teacher/student/info/"+res.data.id,
                                "default_btn_msg":"继续添加",
                                "default_btn_url":"javascript:location.reload();"
                            });
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

            $("#clearSellerId").on("click", function(){
                $('[name="sellerId"]').val("");
                $("#sellerInput").val("");
            });

            function loadSchool(schools){
                var options = '';
                for (var i = 0; i < schools.length; i++) {
                    options += '<option value="' + schools[i].id + '">' + schools[i].name + '</option>';
                }
                $('[name="schoolId"]').html(options);
            }

             $.getJSON("/teacher/sys/school/all.json").done(function(res){
                loadSchool(res.data);
            });
            $("#addSchool").on("click", function(){
                $.prompt({
                    title: '添加驾校',
                    input: '驾校名称',
                    empty: false, // 是否允许为空
                    onOK: function (input) {
                        if(!/^[\u4E00-\u9FA5\uf900-\ufa2d]{2,8}$/.test(input)){
                            $.toast("驾校名称格式错误", "cancel");
                            return false;
                        }
                        $.singlePost($(this), "/teacher/sys/school/info", {"schoolName":input}).done(function(res){
                            res.code == "0" && loadSchool(res.data);
                        });
                    }
                });
            });
        });
	</script>
</body>
</html>