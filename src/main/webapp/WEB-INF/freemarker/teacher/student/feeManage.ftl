<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
	<title>欠费查询</title>
	<#include "/head.ftl">
</head>
<body ontouchstart>
	<div class="page">
		<div class="weui-cells weui-cells_form">
			<div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd">
                    <label for="" class="weui-label">筛选条件</label>
                </div>
                <div class="weui-cell__bd">
                    <select class="weui-select" id="type">
		        		<option value="1" <#if stage=="1">selected</#if> >科目一</option>
		        		<option value="2" <#if stage=="2">selected</#if> >科目二</option>
		        		<option value="3" <#if stage=="3">selected</#if> >科目三</option>
		        		<option value="4" <#if stage=="4">selected</#if> >科目四</option>
		        		<option value="10" <#if stage=="10">selected</#if> >已毕业</option>
                    </select>
                </div>
            </div>
      	</div>
      	<div id="container">
			<#if infos?? && (infos?size > 0)>
				<div class="weui-cells__title">姓名/总额/已缴/未缴</div>
				<div class="weui-cells">
				<#list infos as info>
	   				<a class="weui-cell weui-cell_access" href="/teacher/student/info/${info.id}/fee">
						<div class="weui-cell__bd">
							<div class="weui-flex">
					            <div class="weui-flex__item">${info.username}</div>
					            <div class="weui-flex__item">${info.totalFee}</div>
					            <div class="weui-flex__item">${info.payFee}</div>
					            <div class="weui-flex__item">${info.totalFee - info.payFee}</div>
        					</div>
						</div>
						<div class="weui-cell__ft">
						</div>
					</a>
				</#list>
				</div>
				<div class="weui-cells">
					<div class="weui-cell">
						<div class="weui-cell__bd">
							<div class="weui-flex">
					            欠款总额
        					</div>
						</div>
						<div class="weui-cell__ft">
							${arrangeSum}
						</div>
					</div>
				</div>
			<#else>
				<div class="weui-loadmore weui-loadmore_line">
	            	<span class="weui-loadmore__tips globl_bg_color">暂无数据</span>
	        	</div>
			</#if>
		</div>

		<div class="weui-btn-area">
			<a href="javascript:history.back();" class="weui-btn weui-btn_primary" id="submit"><i></i>返回</a>
		</div>
		<br>
	</div>
	<#include "/common.ftl">
	<script type="text/javascript">
		$(function(){
			$("#type").on("change",function(){
				location.href="/teacher/student/fee/manage/" + this.value;
			});
		});
		
	</script>
</body>
</html>