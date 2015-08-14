<?php
//开启session
	session_start();
	require_once("tpl.class.php");
	require_once("db.php");
	@$name=$_SESSION['name'];
	if($name=="jeffery" || $name=="pd" || $name=="ycmbcd" || $name=="MAX"){
		
	}else{
		echo "<script>alert('你无权访问！');window.location='index.php';</script>";die;
	}
	//查询主题
		$db = new DB();
		$sql = "select * from c_theme order by id desc;";
		$res = $db->execute($sql);
		$smarty->assign("resu",$res);
	//查询总数
		$db= new DB();
		$sql = "select sum(c_num) from c_uploads;";
		$res = $db->execute($sql);
		foreach($res as $value);
		foreach($value as $val);
		$smarty->assign("all_num",$val);
	//查看票数
	if(isset($_GET['all_piao'])){
		$s_theme=$_GET['all_piao'];
		$db = new DB();
		$sql = "select sum(c_num) from c_uploads where c_theme='{$s_theme}';";
		$res = $db->execute($sql);
		foreach($res as $value);
		foreach($value as $val);
		echo $val;
		return false;
	}
	//查看票数
	if(isset($_GET['change_chart'])){
		$s_theme=$_GET['change_chart'];
		$db = new DB();
		$sql = "select * from c_uploads where c_theme='{$s_theme}' order by c_num desc;";
		$res = $db->execute($sql);
		echo json_encode($res);
		return false;
	}
//展示
	$smarty->display("chart.tpl");
?>