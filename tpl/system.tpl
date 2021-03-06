<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>ANTO-投票系统</title>
<link href="/style/index.css" type="text/css" rel="stylesheet" >
<script src="/js/jquery.js"></script>
{literal}
<script>
window.onload=function(){
	var name=prompt("请输入口令：","")
  	if (name=="00"){
    	$("#sys").show(300);
    }
	else{
		alert("输入错误！");window.location=("index.php");
		return false;
	}
}
function add_theme(){
	var new_theme = $("#new_theme").val();
	if(new_theme==""){
		alert("请输入主题名！")
		return false;
	}else{
		$.ajax({
			type:"POST",
			url:"/system.php",
			data:"new_theme="+new_theme,
			success:function(data){
				if(data=="ok"){
					alert("添加成功！");
					window.location='index.php';
				}else{
					alert("添加失败！");
				}    
            } 
		})
	}
}
function del_theme(e){
	$.ajax({
			type:"POST",
			url:"/system.php",
			data:"del_theme="+e,
			success:function(data){
				if(data=="ok"){
					alert("删除成功！");
					window.location='index.php';
				}else{
					alert("添加失败！");
				}    
            } 
	})
}
function change_piao(){
	var all_piao= $("#all_piao").val();
	$.ajax({
			type:"POST",
			url:"/system.php",
			data:"change_piao="+all_piao,
			success:function(data){
				if(data=="ok"){
					alert("发票成功！");
					window.location='index.php';
				}else{
					alert("失败！");
				}    
            } 
	})
}
</script>
{/literal}
</head>
<body style="background:#464646;">
<div id="sys" style="display:none;">
    <div class="auto w1300" id="top">
        <div class="right" style="margin-top:10px;margin-right:20px;cursor:pointer;"><img onClick="window.location.href='/index.php';" src="/images/back.png" /></div>
        <div class="clear"></div>
    </div>
    <div class="auto" style="width:1300px;margin-top:200px">
        <div>
            <div class="left" style="margin-right:10px; font-size:20px; color:#FFF;height:30px; line-height:30px;">添加主题：</div>
            <input id="new_theme" class="left" style="height:24px;padding-left:4px;font-size:14px;width:260px;" type="text" value="" /><div style="margin-left:10px;" onClick="add_theme()" class="btn_green left">确 定</div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="auto w1300">
    
        <table class="t_table">
        {foreach $resu as $se}
            <tr>
                <td>{$se.theme}</td>
                <td style="border:none;"><div style="margin-left:10px;margin-top:4px;" onClick="del_theme('{$se.theme}')" class="btn_red">删 除</div></td>
            </tr>   
    {/foreach}
        </table>
    </div>
    <div class="w1300 auto" style="width:400px;margin-top:50px;color:#FFF;font-size:20px;">发票：每人 <input id="all_piao" class="ttt" type="text" /> 票<div class="btn_green right" onClick="change_piao()">确 定</div></div>
</div>
</body>
</html>