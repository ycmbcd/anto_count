<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>ANTO-投票系统</title>
<link href="/style/index.css" type="text/css" rel="stylesheet" >
<script src="/js/jquery.js"></script>
{literal}
<script>
function change_chart(){
	var ss=$("#c_theme").val();
	$.ajax({
			type:"GET",
			url:"chart.php",
			data:"change_chart="+ss,
			dataType:"json",
			success:function(data){
				if(data){
					var c_theme=$("#c_theme").val();
					tubiao(data,c_theme);
					$("#tips").hide();
				}else{
					alert("错误！");
				}    
            } 
	})
}
function all_piao(){
	var ss=$("#c_theme").val();
	$.ajax({
			type:"GET",
			url:"chart.php",
			data:"all_piao="+ss,
			success:function(data){
				if(data){
					$("#all_piao").html(data);
				}else{
					alert("错误！");
				}    
            } 
	})
}
</script>
{/literal}
</head>
<body style="background:#dedede;height:1000px; position:relative;">
<div class="auto w1300" id="top">
    <div class="auto w1300">
     <select id="c_theme" onChange="change_chart(),all_piao()" style="width:196px;">
     <option value="0">请选择投票主题...</option> 
        {foreach $resu as $se}
        <option value="{$se.theme}">{$se.theme}</option>
        {/foreach}
    </select>
    <div id="shouye" class="right" style="margin-top:10px;margin-right:10px;cursor:pointer;"><img onClick="window.location.href='/index.php';" src="/images/back.png" /></div>
        <div class="clear"></div>
</div>
</div>
<div class="w1300 auto" style="margin-top:140px;font-size:16px;">总票数：<span id="all_piao">*</span></div>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="position:relative;height:400px;margin-top:40px;"></div>
{literal}
    <script src="/js/echarts-all.js"></script>
    <script type="text/javascript">
	function tubiao(data,e){
		var sleng = data.length;
		var shuju = [];
		var tupian = [];
		for(i=0;i<sleng;i++){
			shuju.push(data[i].c_num);
			tupian.push(data[i].c_pic);
		}
		var ss="";
		for(i=0;i<sleng;i++){
			var ss=ss+"<div class='left txt_chart'><img class='chart_img' src='/uploads/"+data[i].c_pic+"' /><br />【"+data[i].c_who+"】"+data[i].c_pic+"</div>";	
		}
		$("#sss").html(ss);
		$("#sss").css({width:200*sleng+"px"})
		$("#main").css({width:203*sleng+"px"})
		$(".txt_chart").css({width:"199px"});
		  // 基于准备好的dom，初始化echarts图表
        var myChart = echarts.init(document.getElementById('main')); 
        
        var option = {
			title : {
       		 text: e,
    		},
            tooltip: {
                show: true
            },
	 		calculable : true,
            legend: {
                data:['票数']
            },
            xAxis : [
                {
                    type : 'category',
                    data : tupian
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    "name":"票数",
                    "type":"bar",
                    "data":shuju,
					itemStyle: {
                normal: {
                    color: '#AE0001',
                    label : {
                        show: true, 
                        position: 'top',
                        textStyle: {
                            color: '#333'
                        }
                    }
                }
            },
                }
            ]
			
        };

        // 为echarts对象加载数据 
        myChart.setOption(option); 
	}
    </script>
    {/literal}
    <div id="sss" style="margin-left:120px; margin-top:-20px; position:absolute;"></div>
    <div id="tips" class="auto w1300" style="font-size:50px; margin-left:-660px; color:#C00;text-align:center; top:400px; position:fixed;left:50%;">选择主题，查看投票情况！</div>
</body>
</html>