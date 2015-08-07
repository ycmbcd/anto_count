<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>ANTO-投票系统</title>
<link href="/style/index.css" type="text/css" rel="stylesheet" >
<script src="/js/jquery.js"></script>
{literal}
<script>
// 弹窗
$(document).ready(function(){
	$("#up").click(function(){
		$("#warning_text").html("请选择你要上传的图片")
		$("#warning_box").fadeIn(0);
		$("#shade").fadeIn(0);				
	})				
	$("#anto_no").click(function(){
		$("#warning_box").fadeOut(0);
		$("#shade").fadeOut(0);
		$("#yes").attr("name","")
		
	})				
})
function anto_upload(){
	alert("111")
}

</script>
{/literal}
</head>

<!--弹窗效果-->					
<form action="#" method="post" enctype="multipart/form-data">
<div id="warning_box">
	<div id="warning_text"></div>
	<input id="file"  type="file" name="uimg" style="height:30px;" >
	<div>
	<input class="button" type="submit" id="anto_yes" value="上传" onclick="anto_upload()" />
	<input class="button" type="button" id="anto_no" value="取消" />
	</div>
</div>
</form>
<div id="shade"></div>
<!--/弹窗效果-->

<body style="background:#464646;">

	<div class="auto w1300" id="top">
        <div class="right" style="margin-right:20px;margin-top:10px;cursor:pointer;"><img src="/images/sys.png" /></div>
        <div id="count" class="right" style="margin-top:10px;margin-right:10px;cursor:pointer;"><img src="/images/count.png" /></div>
		<div id="up" class="right" style="margin-top:10px;margin-right:10px;cursor:pointer;"><img src="/images/up.png" /></div>
        <div class="clear"></div>
	</div>
	<div class="auto w1300" style="margin-top:200px;" id="middle">
		<div class="pic_box">
			<div class="hidden">
				<span></span><img src="http://shopping.geocities.jp/igtx/images/new/wx1_3_1.jpg" />
			</div>
			<div class="ding m10">顶！</div>
		</div>
		<div class="pic_box">
			<div class="hidden">
				<span></span><img src="http://shopping.geocities.jp/igtx/images/new/ab_3.png" />
			</div>
			<div class="ding m10">顶！</div>
		</div>
		<div class="pic_box">
			<div class="hidden">
				<span></span><img src="http://shopping.geocities.jp/igtx/images/new/wx1_3_1.jpg" />
			</div>
			<div class="ding m10">顶！</div>
		</div>
		<div class="pic_box">
			<div class="hidden">
				<span></span><img src="http://shopping.geocities.jp/igtx/images/new/ab_1.png" />
			</div>
			<div class="ding m10">顶！</div>
		</div>
		<div class="pic_box">
			<div class="hidden">
				<span></span><img src="http://shopping.geocities.jp/igtx/images/new/wx1_3_1.jpg" />
			</div>
			<div class="ding m10">顶！</div>
		</div>
		<div class="pic_box">
			<div class="hidden">
				<span></span><img src="http://shopping.geocities.jp/igtx/images/new/wx1_3_1.jpg" />
			</div>
			<div class="ding m10">顶！</div>
		</div>
		<div class="pic_box">
			<div class="hidden">
				<span></span><img src="http://shopping.geocities.jp/igtx/images/new/wx1_3_1.jpg" />
			</div>
			<div class="ding m10">顶！</div>
		</div>
		
	</div>
</body>
</html>