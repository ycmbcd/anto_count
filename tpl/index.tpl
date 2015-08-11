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
var arr_noclick=[];
var str_noclick='';

if(localStorage.lastname==undefined){
	localStorage.lastname='1';
}
$(document).ready(function(){
	var ss =$("#middle").find(".moimg").attr("src");
	if(ss=="/uploads/"){
		$("#middle").hide();
		$("#shouye").hide();
		$("#up").hide();
		$("body").append("<div class='auto w1300' style='margin-top:160px;'>{/literal}<ul>{foreach $re_theme as $th}<a href=\"index.php?change_theme={$th.theme}\"><li class=\'re_theme\'>{$th.theme}</li></a>{/foreach}</ul></div>")
	}{literal}
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
	picready()
})

function cancel(){
	$("#warning_box").fadeOut(0);
	$("#shade").fadeOut(0);
	$("#u_login").hide(200);
	$("#u_reg").hide(200);
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
					$(".id_"+e).css({background:"url(../images/no_ding.png)"});
				}else if(data=="hasding"){
					alert("你已经投过票了！");
				}else if(data=="nopiao"){
					alert("你的投票机会已用完！");
				}else{
					alert("请登录！");
				}    
            } 
	})
}
function u_login(){
	$("#u_login").fadeIn(200);
	$("#shade").fadeIn(0);
}
function cancel_log(){
	$("#u_login").hide(200);
	$("#shade").fadeOut(0);
}
function u_reg(){
	$("#u_reg").fadeIn(200);
	$("#shade").fadeIn(0);
}
function cancel_reg(){
	$("#u_reg").hide(200);
	$("#shade").fadeOut(0);
}
function join_anto(){
	var name = $("#re_u_name").val();
	var pwd = $("#re_u_pwd").val();
	var re_pwd = $("#re_re_pwd").val();
	if(name=="" || pwd=="" || re_pwd==""){
		alert("请填写完整！");
		return false;
	}else if(pwd!==re_pwd){
		alert("两次密码不同！");
		return false;
	}else{
		$.ajax({
			type:"GET",
			url:"index.php",
			data:"regist="+name+"&pwd="+pwd+"&re_pwd="+re_pwd,
			success:function(data){
				if(data=="ok"){
					alert("注册成功，请登录！");
					cancel_reg();
				}else{
					alert("用户已存在！");
				}    
            } 
		})
	}
}
function login_anto(){
	var name = $("#u_name").val();
	var pwd = $("#u_pwd").val();
	if(name=="" || pwd==""){
		alert("请填写完整！");
		return false;
	}else{
		$.ajax({
			type:"GET",
			url:"index.php",
			data:"login="+name+"&pwd="+pwd,
			success:function(data){
				if(data=="ok"){
					cancel_log();
					location.reload();
				}else{
					alert("登录失败，请检查用户名或密码！");
				}    
            } 
		})
	}
}
function picready(){
	var str_no_pic = $("#has_piao").text();
	var arr_no_pic = str_no_pic.split(",");
	for(i=1;i<arr_no_pic.length;i++){
		$("#id_"+arr_no_pic[i]).css({"background":"url(/images/no_ding.png)"})
	}
}
</script>
{/literal}
</head>
<!--弹窗效果-->					
<form id="up_pic" action="/index.php" method="post" enctype="multipart/form-data">
<div id="warning_box">
	<div style="margin:20px 0 0 40px;font-size:14px;">您要参赛的主题：<input id="this_theme" name="this_theme" readonly style="border:none;background:lightyellow;font-size:20px;color:#C00;" type="text" value="{$key_theme}" /></div>
    <div style="margin:20px 0 0 40px;font-size:14px;">参选人：<input style="width:100px;height:24px;padding-left:4px;" type="text" name="maker" /></div>
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
<!--log-->
<div id="u_login" style="z-index:10000; display:none;position:fixed;width:300px;height:150px;top:40%;left:50%; margin-left:-150px; background:#dedede;">
	<div style="width:280px;margin:20px 0 0 50px;" class="auto">
        <div>用户名：<input type="text" class="ttt" id="u_name" /></div>
        <div class="m10">密&nbsp;码：<input type="text" class="ttt" id="u_pwd" /></div>
    </div>
        <div onClick="login_anto()" style="margin-top:20px;margin-left:50px;" class="btn_green left">登 陆</div>
        <div onClick="cancel_log()" style="margin-left:30px;margin-top:20px;" class="btn_red left">取 消</div>
</div>
<!--/log-->
<!--reg-->
<div id="u_reg" style="z-index:10000; display:none;position:fixed;width:300px;height:190px;top:40%;left:50%; margin-left:-150px; background:#dedede;">
	<div style="width:280px;margin:20px 0 0 50px;" class="auto">
        <div>用户名：<input class="ttt" type="text" id="re_u_name" /></div>
        <div class="m10">密&nbsp;码：<input class="ttt" type="text" id="re_u_pwd" /></div>
        <div class="m10">重&nbsp;复：<input class="ttt" type="text" id="re_re_pwd" /></div>
    </div>
        <div onClick="join_anto()" style="margin-top:20px;margin-left:50px;" class="btn_green left">注 册</div>
        <div onClick="cancel_reg()" style="margin-left:30px;margin-top:20px;" class="btn_red left">取 消</div>
</div>
<!--/reg-->
<body style="background:#464646;">
	<div class="auto w1300" id="top">
    <div id="welcome_user">你好，{$anto_name|default:"请登录"}！<a style="color:#FF9;" href="index.php?logout">退出</a><div id="has_piao">{$piao|default:""}</div></div>
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
        <div id="count" class="right" style="margin-top:10px;margin-right:10px;cursor:pointer;"><img onClick="window.location.href='/chart.php';" src="/images/count.png" /></div>
		<div id="up" class="right" style="margin-top:10px;margin-right:10px;cursor:pointer;"><img src="/images/up.png" /></div>
        <div id="shouye" class="right" style="margin-top:10px;margin-right:10px;cursor:pointer;"><img onClick="window.location.href='/index.php';" src="/images/back.png" /></div>
        <div id="login" class="right" style="margin-top:10px;margin-right:10px;cursor:pointer;"><img onClick="u_login()" src="/images/log.png" /></div>
        <div id="regist" class="right" style="margin-top:10px;margin-right:10px;cursor:pointer;"><img onClick="u_reg()" src="/images/reg.png" /></div
        <div class="clear"></div>
	</div>
	<div class="auto w1300" style="margin-top:200px;" id="middle">
    {foreach $pic_cool as $se}
		<div class="pic_box" onlyclick="0">
			<div class="hidden">
				<span></span><img class="moimg" src="/uploads/{$se.c_pic}" />
			</div>
            <div class="piao" id="piao_{$se.id}">{$se.c_num}</div>
			<div class="ding id_{$se.id}" id="id_{$se.id}" onClick="add_num('{$se.id}')"></div><!--顶一下-->
		</div>
	{/foreach}	
	</div>
</body>
</html>