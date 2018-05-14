<input type="hidden" id="UUID" value="${UUID}"/>
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/swiper.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/city-picker.min.js"></script>
<script src="https://cdn.bootcss.com/mootools/1.6.0/mootools-core.min.js"></script>
<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script>
wx.config({
    debug: false, 
    appId: '${Request.appID}', 
    timestamp: ${Request.timestamp}, 
    nonceStr: '${Request.noncestr}', 
    signature: '${Request.signature}',
    jsApiList: ["onMenuShareTimeline", "onMenuShareAppMessage", "onMenuShareQQ", "onMenuShareWeibo", "onMenuShareQZone"]
});

wx.error(function(res){
  	console.log(res);
});
</script>
<script src="https://static.xxwkj.club/jiaxiao/js/pinyin.js"></script>
<script src="https://static.xxwkj.club/jiaxiao/js/template.js"></script>
<script src="https://static.xxwkj.club/common/js/clipboard.min.js"></script>
<script src="https://static.xxwkj.club/jiaxiao/js/uploadError.js?v=6"></script>
<script src="https://static.xxwkj.club/jiaxiao/js/formValidate.js?v=6"></script>
<script src="https://static.xxwkj.club/jiaxiao/js/search.js?v=6"></script>
<script src="https://static.xxwkj.club/jiaxiao/js/main.js?v=6"></script>

