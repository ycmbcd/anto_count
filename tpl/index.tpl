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
		//$("#warning_text").html("请选择你要上传的图片")
		$("#warning_box").fadeIn(0);
		$("#shade").fadeIn(0);				
	})				
	$("#anto_no").click(function(){
		$("#warning_box").fadeOut(0);
		$("#shade").fadeOut(0);
	
	})
	pic_big();			
})
function cancel(){
	$("#warning_box").fadeOut(0);
	$("#shade").fadeOut(0);
}
function anto_upload(){
	var ss=$("#this_theme").val();
	var yy=$("#file").val();
	if(ss==""){
		alert("请选择你要参赛的主题！")
	}else if(yy==""){
		alert("请选择你要上传的文件！")
	}else{
		$("#up_pic").submit()
	}
}
function change_theme(){
	var c_theme=$("#c_theme").val();
	location.href="index.php?change_theme="+c_theme;
}
function pic_big(){
	$("#middle img").each(function(){
		$(this).click(function(){
			var href = $(this).attr("src");
			$("#shade2").fadeIn(0);
			$("#pics img").attr("src",href);
			$("#pics").fadeIn(200);

			var top = $(document).scrollTop();
			var top = top+120;
			$("#pics").css({"top":top+"px"})
		});

	});

	$("#shade2").click(function(){
		$("#shade2").fadeOut(0);
		$("#pics").fadeOut(200);
	})
	$("#pics").click(function(){
		$("#shade2").fadeOut(0);
		$("#pics").fadeOut(200);
	})
}
function add_num(e){
	/////zheli
	$.ajax({
			type:"GET",
			url:"index.php",
			data:"add_num="+e,
			success:function(data){
				if(data=="ok"){
					var ss=$("#piao_"+e).html();
					ss=ss-0;
					ss=ss+1;
					$("#piao_"+e).html(ss);
				}else{
					alert("系统错误！");
				}    
            } 
	})
}
</script>
{/literal}
</head>

<!--弹窗效果-->					
<form id="up_pic" action="/index.php" method="post" enctype="multipart/form-data">
<div id="warning_box">
	<div style="margin:20px 0 0 40px;font-size:14px;">您要参赛的主题：<input id="this_theme" name="this_theme" readonly style="border:none;background:lightyellow;font-size:20px;color:#C00;" type="text" value="{$key_theme}" /></div>
	<input id="file"  type="file" name="uimg" style="height:30px;" >
	<div>
    <div id="anto_yes" class="btn_green" onclick="anto_upload()" >上 传</div>
    <div id="anto_no" class="btn_red" >取 消</div>
	</div>
</div>
</form>
<div id="shade" onClick="cancel()"></div>
<div id="shade2"></div>
<div id="pics"><img style="margin-bottom:120px;" src=""></div>
<!--/弹窗效果-->

<body style="background:#464646;">

	<div class="auto w1300" id="top">
    <div id="key_theme">{$key_theme}</div>
    <div class="auto w1300">
    	 <select id="c_theme" onChange="change_theme()" style="width:196px; opacity:0;">
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
    {foreach $pic_cool as $se}
		<div class="pic_box">
			<div class="hidden">
				<span></span><img src="/uploads/{$se.c_pic}" />
			</div>
            <div class="piao" id="piao_{$se.id}">{$se.c_num}</div>
			<div class="ding" onClick="add_num('{$se.id}')"></div><!--顶一下-->
		</div>
	{/foreach}	
	</div>
</body>
</html>