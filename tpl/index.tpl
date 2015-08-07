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
function change_theme(){
	var c_theme=$("#c_theme").val();
	$("#this_theme").val(c_theme);
}
</script>
{/literal}
</head>

<!--弹窗效果-->					
<form action="#" method="post" enctype="multipart/form-data">
<div id="warning_box">
	<div style="margin:20px 0 0 40px;">您要参赛的主题：<input id="this_theme" readonly style="border:none;background:lightyellow; font-size:16px;" type="text" value="" /></div>
	<div id="warning_text"></div>
	<input id="file"  type="file" name="uimg" style="height:30px;" >
	<div>
    <div id="anto_yes" class="btn_green" onclick="anto_upload()" >上 传</div>
    <div id="anto_no" class="btn_green" >取 消</div>
	</div>
</div>
</form>
<div id="shade"></div>
<!--/弹窗效果-->

<body style="background:#464646;">

	<div class="auto w1300" id="top">
    <div class="auto w1300">
    	 <select id="c_theme" onChange="change_theme()" style="width:200px;">
        	<option value="0">请选择投票主题...</option> 
        	{foreach $resu as $se}
            <option value="{$se.theme}">{$se.theme}</option>
            {/foreach}
		</select>
    </div>
        <div class="right" style="margin-right:20px;margin-top:10px;cursor:pointer;"><img onClick="window.location.href='/system.php';" src="/images/sys.png" /></div>
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